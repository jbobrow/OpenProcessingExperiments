
//here I am DECLARING a pair of variables//
int xPos;//this gives a name to the x coordinate variable
int yPos;//this gives a name to the y coordinate variable
String myText; //this gives a name to a 'string' or a sequence of characters
String myText2; //this gives a name to a separate sequence of characters
PFont font; //this gives a name by which to call up font information from the data folder



void setup() {//this defines the initial properties for the sketch
  size(500,400);//sets size of field
  font=loadFont("Calibri-28.vlw");//constructs the specified new font from information stored in the data folder
  textFont(font,28);//activates the font, and sets the size of the font height in pixels
  myText="insufficient wordz in a set text";//describes the content of the string named myText
  myText2="Resembling ancient shorthand";//describes the content of the string named myText2
  xPos=100;//gives a value to the x variable
  yPos=130;//gives a value to the y variable
  smooth();/*this instructs the programme to render curved and angled edges anti-aliased in order to present as visually smoother; 
  may be useful for rendering text characters as they are stored as image data*/
}

void draw( ){//instruction to continuously run the code within the pair of curly brackets associated with it
  background(50,150,250);//sets the colour fill for the background
fill(220,150,25);//sets the colour fill for the items described in the lines that follow
text(myText,xPos,yPos);/*sets a location for the bottom left corner of the string of characters named myText;
this is located at the x,y variable coordinates*/
text(myText2, xPos+40, yPos+40);/*sets a location for the bottom left corner of the string of characters named myText2;
this is located at the x,y variable coordinates offset to the right by 40 pixels, and down by 40 pixels*/
textWidth (myText2); //this calculates a value for the width of the string of characters 
float tw = textWidth(myText2+40);/*this declares a float variable named tw; 
this allows for a decimal point value to be returned, and so can give more detailed resolution 
e.g. here in order to keep animated text legible;
the variable is then specified as having a value of the width of the string myText2 plus 40 pixels;*/
    xPos-=1;/*the value of the variable xPos is set to decrease by 1 pixel each time it is redrawn; 
    as it is set to decrease the affected strings will appear to move to the left*/
    if(xPos<-tw){/*sets an action that will occur if the condition specified is met; 
    this condition is when variable xPos is less than minus the value of the variable tw*/
      xPos=500;/*when the value of xPos is less than minus the value of tw, then xPos returns to 500;
      this has the effect of returning the beginning of the string of characters to the right edge of the field*/
      println(xPos);//and also when the condition is met, print the value of xPos to the console
     
    }
}


