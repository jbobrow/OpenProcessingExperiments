
//here I am DECLARING a pair of variables
int xPos; //variable of x coordinate
int yPos; //variable of y coordinate
String myText; //this gives a name to a 'string' or a sequence of characters
String myText2; //this gives a name to a separate sequence of characters
PFont font; //this gives a name by which to call up font information from the data folder




void setup() {//this defines the initial properties for the sketch
  size(500,400);//sets size of field
  font=loadFont("Calibri-28.vlw");//constructs the specified new font from information stored in the data folder
  textFont(font,28);//activates the font, and sets the size of the font height in pixels
  myText="insufficient wordz in a set text";//describes the content of the string named myText
  myText2="Resembling ancient shorthand";//describes the content of the string named myText2
  xPos=50;//gives a value to the x variable
  yPos=80;//gives a value to the y variable
  smooth();/*this instructs the programme to render curved and angled edges anti-aliased in order to present as visually smoother; 
  may be useful for rendering text characters as they are stored as image data*/
}

void draw( ){//instruction to continuously run the code within the pair of curly brackets associated with it
  background(50,150,250);//sets the colour fill for the background
  text(myText,xPos,yPos);/*sets a location for the bottom left corner of the string of characters named myText;
this is located at the x,y variable coordinates*/
  text(myText2, xPos+40, yPos+40);/*sets a location for the bottom left corner of the string of characters named myText2;
this is located at the x,y variable coordinates offset to the right by 40 pixels, and down by 40 pixels*/
  xPos+=1;/*the value of the variable xPos is set to increase by 1 pixel each time it is redrawn; 
    as it is set to increase the affected strings will appear to move to the right*/
     if(xPos>width+240){/*sets an action that will occur if the condition specified is met; 
    this condition is when the value of the variable xPos is greater than the width of the field plus 240 pixels*/
     xPos=-240;/*when the value of xPos is greater than the width plus 240, then xPos returns to minus 240;
      this has the effect of returning the right end of the string of characters to (near) the left edge of the field*/
        println("off screen");//and also when this condition is met, print the phrase specified to the console
     }
     
     if(mouseX>xPos && mouseX<xPos+textWidth(myText)+40 &&mouseY<yPos && mouseY>yPos-30){/*this sets a second condition that will occur if the mouse in within certain parameters;
     the parameters describe a (rough) rectangular area around the two strings of text, the condition is met when the mouse is within this area*/
       fill(22,150,25);/*this describes the action that will occur when the condition is met, 
       it sets a fill colour for the text*/
       }
        else{//this sets the state that holds when the condition set in line 38 does not apply;
        fill(50,150,250);/*this describes the action that will occur when the condition is met, 
       it sets a fill colour for the text, this colour is the same as the background colour and so the text 'disappears'*/
        }
        
        
        }


   
  



