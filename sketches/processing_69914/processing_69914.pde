
//class rectangle
//{
////fill(#EAEA09);
//rect(50,40,70,70);
//}
 //define color as a variable to get seperate colors
int r=#D64E4E;
int g=#21AD30;
int db=#3321AD;
int yellow=#F4F516;
int purple=#B916F5;
void setup() {
size(420,210);

}
void draw() {
background(58, 458,224);
smooth();
//float x=mouseX;
//float y=mouseY;
fill(r);
quad(158, 55, 199, 14, 392, 66, 351, 107);
fill(g);
triangle(158,55,290, 91,290,112);
fill(db);
      arc(100,95,172,   180,-110, HALF_PI); //180 stretchs shape lengthwise
//anything above 0 on last number makes arc disappear entirely, but if it is below zero, you get a full circle
//in this case it went over the square and gave an outline of the square underneath
fill(yellow);
rectangle();
//rectangle(x,y,x,y);
  //want to create a 2nd rectangle - but it won't let me with the function method
  fill(purple);
circle();
}
void rectangle()
{
  rect(50,40,70,70);
  fill(#EAEA09);  //see diagonalsBackgroundElements program to get moving
  //rectangle picture make update function
}
void circle()
{//goal: create a circle in its own function with a seperate color.
//circle should move with mouse.
//send down mouseX and mouseY 
//declare int w, v in setup and send it down to the circle function
//do v & w need to be global variables instead?
 int w=50;  //original = 50
 int v=80;  //original = 40
  //fill(#370CAF); //still need a different color
  ellipse(180,w,v,66);  //66=mouseY
  fill(0);
  ellipse(200, w, -v, -66);
}

