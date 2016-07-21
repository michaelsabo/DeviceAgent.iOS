
#import "MiscViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MiscViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textDelegateMessage;
@property (weak, nonatomic) IBOutlet UILabel *howGoesItLabel;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *currentVolume;

// These are temporary - once run-loop can support pan, I will replace
// with a pan gesture on the UITextField that will set the text to @"".
// Adding pan at this point is beyond the scope of the changeset.
@property (weak, nonatomic) IBOutlet UIButton *clearTextFieldButton;
- (IBAction)clearTextFieldButtonTouched:(id)sender;
@property(nonatomic, strong) AVAudioSession *session;

@end

static NSString *const kCaVa = @"Ça va?";

@implementation MiscViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.delegate = self;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.clearButtonMode = UITextFieldViewModeAlways;

    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(handleTapOnTouchQuestionLabel:)];
    recognizer.numberOfTapsRequired = 1;
    recognizer.numberOfTouchesRequired = 1;
    [self.howGoesItLabel addGestureRecognizer:recognizer];

    NSError *audioSessionError = nil;
    self.session = [AVAudioSession sharedInstance];
    if (![self.session setCategory:AVAudioSessionCategoryPlayback error:&audioSessionError]) {
        if (audioSessionError) {
            NSLog(@"Error %@, %@",
                  @(audioSessionError.code), audioSessionError.localizedDescription);
        } else {
            NSLog(@"Failed to set audio sesson category but no error was generated");
        }

    } else {
        NSLog(@"Set audio session category to playback.");

        audioSessionError = nil;
        if (![self.session setActive:YES
                    withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation
                          error:&audioSessionError]) {
            if (audioSessionError) {
                NSLog(@"Error %@, %@",
                      @(audioSessionError.code), audioSessionError.localizedDescription);
            } else {
                NSLog(@"Failed to start audio session but no error was generated");
            }
        } else {
            NSLog(@"Started audio session");

            [self.session addObserver:self
                      forKeyPath:@"outputVolume"
                         options:0
                         context:nil];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)handleTapOnTouchQuestionLabel:(UIGestureRecognizer *)recognizer {
    UIGestureRecognizerState state = [recognizer state];
    if (UIGestureRecognizerStateEnded == state) {
        UIView *view = recognizer.view;
        if (view == self.howGoesItLabel) {
            if (recognizer.numberOfTouches == 1) {
                self.howGoesItLabel.text = kCaVa;
            }
        }
    }
}

- (IBAction)clearTextFieldButtonTouched:(id)sender {
    self.textField.text = @"";
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.textDelegateMessage.text = @"textFieldShouldBeginEditing:";
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.textDelegateMessage.text = @"textFieldDidBeginEditing:";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.spellCheckingType = UITextSpellCheckingTypeNo;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.textDelegateMessage.text = @"textFieldShouldEndEditing:";
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.textDelegateMessage.text = @"textFieldDidEndEditing:";
}

- (BOOL)textField:(UITextField *)textField
 shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string  {
    self.textDelegateMessage.text = @"textField:shouldChangeCharactersInRange:replacementString:";

    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField  {
    self.textDelegateMessage.text = @"textFieldShouldClear:";
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.textDelegateMessage.text = @"textFieldShouldReturn:";
    [textField resignFirstResponder];
    NSString *answer = [NSString stringWithFormat:@"%@ - %@",
                        kCaVa, textField.text];
    self.howGoesItLabel.text = answer;
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

    if ([keyPath isEqual:@"outputVolume"]) {
        NSLog(@"volume changed: %@", @(self.session.outputVolume));
        self.currentVolume.text = [NSString stringWithFormat:@"%@",
                                   @(self.session.outputVolume)];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.currentVolume.text = [NSString stringWithFormat:@"%@",
                               @(self.session.outputVolume)];
}

@end
