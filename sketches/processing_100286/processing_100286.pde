
float x = 240; // x-coordinate 
float y = 285; // y-coordinate 
int bodyHeight = 120; // Body Height
int bodyWidth = 100; //Body Width
int neckHeight = 15; // Neck Height 
int headHeight = 110; // Head Height
int headWidth = 100;
int wheel = 40;

float easing = 0.02;

//background canvas set up and global settings
void setup() {
size(720, 480);
background(255, 155, 155);
smooth();
rectMode(CENTER);
strokeWeight(2);

}

void draw() {

  float ny = y - (bodyHeight/2) - neckHeight - (headHeight/2); // Neck Y
  background(255, 155, 155);
  
    int targetX = mouseX;
  x += (targetX - x) * easing;
    
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
line(x+(bodyWidth/2), y-(bodyHeight/2), x+bodyWidth, y);//right arm

fill(201, 58, 41);
//right fingers
strokeWeight(2);
line(x+bodyWidth+4, y-2, x+bodyWidth+4, y-17);//thumb
line(x+bodyWidth+4, y, x+bodyWidth+31, y-5);
line(x+bodyWidth+5, y+3, x+bodyWidth+35, y);
line(x+bodyWidth+4, y+5, x+bodyWidth+32, y+5);
line(x+bodyWidth+4, y+7, x+bodyWidth+29, y+8);

//left fingers
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

//box and bow
fill(255);
rect(x+bodyWidth+7, y-40, 50, 40);
ellipse(x+bodyWidth+20, y-45, 25, 10);
ellipse(x+bodyWidth+45, y-45, 25, 10);

}




