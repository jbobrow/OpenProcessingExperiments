
//setting up variables
Boolean button = false;
int x = 150; // x location of owl
int y = 150; // y location of owl 
int z = 0;
int speed = 1;
float g;
float b;
float a;
float diam;
float w;
float h;

//setup
void setup () {
//Size
size(800,700);
}

void draw() {
// if the mouse is pressed 
{ if(mousePressed == true) {
  
// set background to black
   background(0);
   
   //draw moon
   noStroke();
   fill(#FFF981);
   ellipse(650,x,x,x);
   
   //draw rectangle to create half moon
   noStroke();
   fill(0);
   rect(650,x/2,x,x);
   
   //draw stars
   //random ellipse varibles
g = random(255);
b = random(255);
a = random(255);
w = random(width);
h = random(height);
diam = random(5);

   noStroke();
   fill(g,b,a);
   ellipse(w,h,diam,diam);
   
//DRAW OWL

//draw left wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX-60,mouseY,25,50);

//draw right wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX+60,mouseY,25,50);

//draw left foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(mouseX-20,mouseY+75,mouseX-15,mouseY+50,mouseX-10,mouseY+77.5);

//draw right foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(mouseX+10,mouseY+77.5,mouseX+15,mouseY+50,mouseX+20,mouseY+75);

//Draw Owl Body
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX,mouseY,125,150);

//draw owl left ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX-20,mouseY-65,25,25);

//draw owl right ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX+20,mouseY-65,25,25);

//eye left circle
noStroke();
fill(#C9BFBD);
ellipse(mouseX-20,mouseY-35,50,50);

//eye right circle
noStroke();
fill(#C9BFBD);
ellipse(mouseX+20,mouseY-35,50,50);

//draw owl left eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(mouseX-20,mouseY-40,25,25);

//draw owl right eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(mouseX+20,mouseY-40,25,25);

//draw owl right pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(mouseX-20,mouseY-40,10,10);

//draw owl left pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(mouseX+20,mouseY-40,10,10);

//draw chest
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX,mouseY+20,90,90);

//draw owl beak
noStroke();
fill(#FF4C2C);
triangle(mouseX-5,mouseY-25,mouseX,mouseY-15,mouseX+5,mouseY-25);
}
}
// ifthe mouse is NOT pressed
if(!mousePressed == true) {
  // set background to light blue
  background(#C9FFFE);
  
  //draw sun 
  noStroke();
   fill(#FBFF21);
   ellipse(650,x,x,x);
   
   //draw cloud
 z = z + speed;
 if ((z > width)  || (x<0)) {
   speed = speed * -1;
 }{
 noStroke();
 fill(255);
 ellipse(z,80,102,102);
noStroke();
 fill(255);
 ellipse(z-40,130,102,102);
noStroke();
 fill(255);
 ellipse(z+40,130,102,102);
{
} 
  
   //DRAW OWL
   
//draw left wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX-60,mouseY,25,50);

//draw right wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX+60,mouseY,25,50);

//draw left foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(mouseX-20,mouseY+75,mouseX-15,mouseY+50,mouseX-10,mouseY+77.5);

//draw right foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(mouseX+10,mouseY+77.5,mouseX+15,mouseY+50,mouseX+20,mouseY+75);

//Draw Owl Body
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX,mouseY,125,150);

//draw owl left ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX-20,mouseY-65,25,25);

//draw owl right ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(mouseX+20,mouseY-65,25,25);

//eye left circle
noStroke();
fill(#C9BFBD);
ellipse(mouseX-20,mouseY-35,50,50);

//eye right circle
noStroke();
fill(#C9BFBD);
ellipse(mouseX+20,mouseY-35,50,50);

//draw owl left eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(mouseX-20,mouseY-40,25,25);

//draw owl right eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(mouseX+20,mouseY-40,25,25);

//draw owl right pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(mouseX-20,mouseY-40,10,10);

//draw owl left pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(mouseX+20,mouseY-40,10,10);

//draw chest
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(mouseX,mouseY+20,90,90);

//draw owl beak
noStroke();
fill(#FF4C2C);
triangle(mouseX-5,mouseY-25,mouseX,mouseY-15,mouseX+5,mouseY-25);
}
}}
