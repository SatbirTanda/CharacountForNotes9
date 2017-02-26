#import "CharacountForNotes9.h"

%hook NotesDisplayController
- (void)viewWillAppear:(BOOL)arg1 // Initialze title 
{
	%orig;
	NSString *content = self.contentLayer.textView.text;
	NSString *contentLength = [NSString stringWithFormat:@"%lu", (unsigned
	long)[content length]]; self.title = contentLength;
}

- (void)viewDidDisappear:(BOOL)arg1 // Reset title 
{
	%orig;
	self.title = nil; 
}

- (void)noteContentLayerContentDidChange:(NoteContentLayer *)arg1 updatedTitle:(BOOL)arg2 // Update title
{
	%orig;
	NSString *content = self.contentLayer.textView.text;
	NSString *contentLength = [NSString stringWithFormat:@"%lu", (unsigned
	long)[content length]]; self.title = contentLength;
} 
%end