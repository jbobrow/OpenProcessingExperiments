
//SKETCH WITH VARIABLES IN COLOUR & POSITION

//colour
int x = 228;
int y = 209;
int z = 204;

//position
int a = 145;
int b = 215;

void setup() {
  size(500,500);
  smooth();
  background(95,94,95);
  noStroke();
}


void draw() {
  background(228,209,204);
 
 //colour
  x=mouseX;
  y=mouseY;
  
  //position (parented to head)
  a=mouseX;
  b=mouseY;
 


//------------------------------------

//right ear
fill(x,y,z);
ellipse(a-15,b-125,42,165);
fill(248,244,243);
ellipse(a-15,b-110,32,105);

//left ear
fill(x,y,z);
ellipse(a+35,b-120,42,165);
fill(248,244,243);
ellipse(a+35,b-105,32,105);

//head
fill(x,y,z);
ellipse(a,b,135,130);

//right eye
fill(248,244,243);
ellipse(a-35,b-17,40,50);
fill(34,30,31);
ellipse(a-27,b-22,18,22);

//left eye
fill(248,244,243);
ellipse(a+15,b-15,40,50);
fill(34,30,31);
ellipse(a+24,b-20,18,22);

//nose
fill(139,134,134);
ellipse(a-15,b+15,16,10);

//mouth
ellipse(a+3,b+45,18,7);




}
