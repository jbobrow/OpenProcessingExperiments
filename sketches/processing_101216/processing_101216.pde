
float x = 240; // x-coordinate 
float y = 285; // y-coordinate 
float mid = 360;
int bodyHeight = 120; // Body Height
int bodyWidth = 100; //Body Width
int neckHeight = 15; // Neck Height 
int headHeight = 110; // Head Height
int headWidth = 100;
int wheel = 40;
//int boxX = 425;
//int boxY = 255;

float easing = 0.02;

PImage img1;
PImage img2;

//background canvas set up and global settings
void setup() {
size(720, 480);
img1 = loadImage("mars2.jpg");
img2 = loadImage("rover.png");
smooth();
rectMode(CENTER);
strokeWeight(2);

}

void draw() {
  
  
  float ny = y - (bodyHeight/2) - neckHeight - (headHeight/2); // Neck Y
  background(255, 155, 155);
  image(img1, 0, 0);
  
  float roverscale = .2;
  float offset = 0;
  float adj = 0;
  
  if (mouseX > mid) {
    adj = mid-mouseX;
    roverscale -= adj*.01;
    //offset = 0;
  }
  if (mouseX < mid) {
    adj = (mid-mouseX);
    roverscale += adj*.01;
    //offset = 0;
  }
  
 // float roversizeX = 190 * dist( mouseX, mouseY, pmouseX, pmouseY);
 // float roversizeY = 249 * dist( mouseX, mouseY, pmouseX, pmouseY);
 
  
  image(img2, x+300, y, 190 * roverscale, 249 * roverscale );
  
  
  /*line(x, 0, x, height);
  line(mouseX, mouseY, mouseX + offset, mouseY - 10);
  line(mouseX, mouseY, mouseX + offset, mouseY + 10);
  line(mouseX, mouseY, mouseX + offset*3, mouseY);
}*/
  
  
  
  
    int targetX = mouseX;
  x += (targetX - x) * easing;
   int targetY = mouseY;
  y += (targetY - y) * easing;
    
  if (mousePressed) {
    neckHeight = 40;
    bodyHeight = 60; 
  } else {
    neckHeight = 15;
    bodyHeight = 120; 
  }
  
//Neck
noStroke();
rectMode(CENTER);
fill(255, 100, 0); //drk. orange
rect(x, y-(bodyHeight+neckHeight)/2, 20, neckHeight);

//Head
noStroke(); //Disable stroke
rectMode(CENTER);
fill(255);  //white
ellipse(x, ny, headWidth, headHeight);  //Head

fill(0); //black
ellipse(x, ny+15, 40, 10); //Mouth

fill(0); //black
ellipse(x, ny-1, 6, 6); //Nose

fill(92, 139, 196); //blue
ellipse(x-20, ny-8, 20, 20); //left eye
ellipse(x+20, ny-8, 20, 4); //right eye 
 
//ears
stroke(0);
fill(230, 100, 100);//
ellipse(x-(headWidth/2)-12, ny, 20, 26); //left
line(x-(headWidth/2)-22, ny, x-(headWidth/2)-4, ny);
fill(253, 80, 80);//
ellipse(x+(headWidth/2)+10, ny, 20, 40); //right
line(x+(headWidth/2), ny, x+(headWidth/2)+20, ny);
fill(150, 50, 20);//
ellipse(x, ny-(headHeight/2)-12, 40, 20); //top
//line(x, 78, x, 98);
line(x, ny-(headHeight/2)-20, x,  ny-(headHeight/2)-2);

 
//Body
noStroke(); //Disable stroke
fill(255, 140, 0);  //orange
rect( x, y, bodyWidth, bodyHeight);

//Arms and hands
stroke(201, 58, 41);
strokeWeight(5);
line(x-(bodyWidth/2), y-(bodyHeight/2), x, y);//left arm

    fill(201, 58, 41);
    line(x+(bodyWidth/2), y-(bodyHeight/2), x+bodyWidth, y);//right arm
    //right fingers
    strokeWeight(2);
    line(x+bodyWidth+4, y-2, x+bodyWidth+4, y-17);//thumb
    line(x+bodyWidth+4, y, x+bodyWidth+31, y-5);
    line(x+bodyWidth+5, y+3, x+bodyWidth+35, y);
    line(x+bodyWidth+4, y+5, x+bodyWidth+32, y+5);
    line(x+bodyWidth+4, y+7, x+bodyWidth+29, y+8);
    
    //box and bow
    fill(255);
    noStroke();
    rect(x+bodyWidth+35, y-20, 50, 40);
    ellipse(x+bodyWidth+25, y-48, 25, 10);
    ellipse(x+bodyWidth+45, y-48, 25, 10);

//left fingers
stroke(201, 58, 41);
strokeWeight(2);
line(x+4, y-2, x+4, y-17);//thumb
line(x+4, y, x+31, y-5);
line(x+5, y+3, x+35, y);
line(x+4, y+5, x+32, y+5);
line(x+4, y+7, x+29, y+8);

//Legs and Wheels
noStroke();
rectMode(CORNER);
fill(201, 58, 41);
rect(x-2.5-(bodyWidth/4), y+(bodyHeight/2), 5, 15);//left leg
rect(x+2.5+(bodyWidth/4), y+(bodyHeight/2), 5, 15);//right leg
fill(0);  //black
ellipse(x+2.5-(bodyWidth/4),y+(bodyHeight/2)+15+wheel/2, wheel, wheel); //left wheel
fill(0);  //black
ellipse(x+2.5+(bodyWidth/4), y+(bodyHeight/2)+15+wheel/2, wheel, wheel); //right wheel



}




