
import ddf.minim.*;
Minim minim;
//AudioPlayer MIDI;
AudioPlayer ClockClick;

//I'm thinking of a grandmother clock. A big pendulum clock against the wall. 
//Pendulum moves towards right and I'm chasing it (or it chases me).
//under the pendulum clock there are small slivers (at the left) whish I much avoid.

//Define Color Palette
color[] Heaven = {#B575FF, #FFFF02,#7A81FF, #84AECC, #FF9564, #A700A8,#63E8BB,#A8625B,#0F020D,#7A81FF,#D181FF,#FF5809};
color[] palette = Heaven;
float counter = 0;

//Create setup code block
void setup(){
  minim= new Minim(this);
  ClockClick= minim.loadFile("ClockClick.wav");
  //maximum window size for this assignment
  size(1000, 720);
  //select the first color from the selected palette
  background(palette[0]);
  noLoop();
 }

//Create the draw code block
void draw(){
  PFont serif = createFont("serif bold", 20);
  fill(#9B134A);
  textFont(serif);
  fill(#FF9580);
  text("Chasing time (or time chasing us)",430,105);
  PFont serif15 = createFont("serif bold", 15);
   textFont(serif15);
    fill(0);
  text("Click and drag your mouse to run after time",435,130);
    fill(#FF9580);
      text("Press Delete or Backspace to start over",445,150);
  fill(#04060F);
 
   {
    //Set stroke color to random palette color
    stroke(palette[int(random(1, 12))]);
    //Set stroke weight randomly
    strokeWeight(int(random(1, 10)));
    //set objects origin location x to random of screen height  
    float x = random(width);  
    //set objects height and width randomly
    float y = random(height);
    float d = random(10, 50);
     //Set fill color randomly from palette for triangles
     fill(palette[int(random(8, 9))]);
     //draw triangle 
     triangle(-x, y, 500,1,400,10);
     //Set fill color randomly from palette for quads
    fill(palette[int(random(9, 10))]);
     quad(x,500,1,0,x/100,1,1/10,1);
     //Set fill color randomly from palette for ellipses
     fill(palette[int(random(4, 8))]);
     arc(x, 500, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
      //Set fill color randomly from palette for more ellipses
     fill(palette[int(random(0,9))]);
     arc(770, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
     arc(870, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
     arc(970, 0.5*y, 1.3*d, 1.5*d,-1.5*x,2.5*y); 
      //Set fill color randomly from palette for polygons
     fill(palette[int(random(4, 10))]);
     beginShape();
     vertex(x,700);
     vertex(y,650);
     vertex(x,780);
     vertex(y,790);
     vertex(2*x,750);
     endShape();
     //Set fill color randomly from palette for points
     fill(#EAAE85);
     point(x, 555);
 //people
 arc(x, 600, 15, 15,-1.5*x,2.5*y);
 line(x,608,x-5,632);
 line(x-5,630,x-15,645);
 line(x-15,645,x-15,630);
 line(x-5,630,x+5,645);
 line(x,615,x+15,620);
 line(x,615,x+20,610);

 //change limiter count randomly between -1 and +2
    counter += random(2,2.5);
      }
     
}
void mousePressed() {
    ClockClick.play();
    loop();  // Holding down the mouse activates looping
 }

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
 ClockClick.pause() ;
}
void keyReleased() {
  if (key==DELETE || key ==BACKSPACE) background(palette[0]);
  
  if (key=='s' || key=='S' ) saveFrame("screenshot.png."); 
}



