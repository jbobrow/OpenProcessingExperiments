
/*
All written online on openprocessing.org

More details here: 
https://docs.google.com/document/pub?id=1WQO_hym_oBE53v6mfXcQyBI0p5tV66lfK4UlhaSxlDo

message: perhaps the easiest cure to many of the world's problems is to give education to everyone. Thinking logically and dare we say programmatically elevates one's thoughts. Let's help make that happen by creating learning applications that can be shared via the web and via hand held devices, for free. Here's a start. Please feel free to help out by supplying code/ideas/ your own sample learing applications... especially you teacher types out there!

application goal: a random number generator that will test individuals ability to calculate addition/subtraction/multiplication/division

need:
need to find user input sample code
**need to match the solution to the answer provided by user
need to find scoring sample code
need to find text alignments sample code

must:
*tell user if their answer is correct
*code must be accessible to user!
*proper alignment of right to left of digits
*proper positioning of digits (higher over lower)
**handle this with an if statement
*ask user for practice of + - * or /
*ask user for high and lows
*scoring


should
*option to select answer with mouse
*as widely distributed as possible, create a google site and host this app and any education app built with processing WITH source code!
*be in as many languages of impoverished people as possible (aim teaching tools at demographically economically/pedagogically poor people)

could
*show graphically the answer but not symbolically i.e. no numbers
*a scoring class that could be reused over and over?
*show possible answers and user click on the correct one
*timer showing how long the user took to answer the problem
*user choose background color

want
*a way for the user to solve the problem on the screen and SAVE the user's mouse strokes as they work through the problem in a processing drawboard/white board
*integration of video at beginning to show user how to solve the problems a 
la Kahn Academy
*sharing of scores
*export equations as SVG

*/ 

size(900, 450);//maximum size for openprocessing
background(102);

// Load the font. Fonts are located within the 
// main Processing directory/folder and they
// must be placed within the data directory
// of your sketch for them to load
PFont fontA = loadFont("Arial");//default font loads in Chrome just fine

// Set the font and its size (in units of pixels)
textFont(fontA, 18);

int x = 30;//this is used for the left edge of text below
int i = 0;

// Use fill() to change the value or color of the text
float num1 = random (10);//random(high);
float num2 = random (10);
int rn1 = round(num1);// rn1 = rounded number
int rn2 = round(num2);//rn2 = rounded number
int score = 0

fill(0);
text ("Your score is: " + score, x, 40);

text("This is a rounded number:" + rn1, x, 60);

text("This is a rounded number:" + rn2, x, 80);

//text ("What is" + rn1 "plus" + rn2 "?",x,100);//this won't work

text ("What is " + rn1,x,100);
//text ("plus" + rn2, (x+5), 100);//this won't work

text ("plus " + rn2,x, 120);

text ("prompt for user input here", x, 140);

text ("if answer correct, add to score", x, 160);

text ("if answer is incorrect, prompt user to try again",x, 180);
int answer = rn1 + rn2;//don't forget the ;

text ("the answer is " +answer, x, 250);
                                                                                                                                                
