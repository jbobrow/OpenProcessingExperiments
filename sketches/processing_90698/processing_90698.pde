
// VARIABLES
//DIFFERENT TYPES AND WAYS TO CREATE VARIABLES

int potato; //declared a variable
//potato = 12;  // assigned a  value to potato

float tomato = 2.5 ; //combining the above 2 tasks
//different types of variables
boolean bool = true; //true or false
byte bite = -128; // creates a 8-digit binary number from -128 to 127



float xPos ;
float yPos ;

void setup(){
  size(200,200);
xPos = width/2;
yPos = height/2;
}
void draw (){
  ellipse(xPos,yPos,100,100);
  ellipse(xPos-20,yPos-20,80,80);
}
