
import netscape.javascript.*;


PFont font1;
int frame = 0; 
float t = 0;
float k = 0;
int min= minute(); 
float right_x = random(600, 700);
float right_y = 220;
float left_x = random(200, 300);
float left_y = 220; 
int currentS; 
int position;

PImage[] birds = new PImage[4];
PImage tree;
PImage leaves;

void setup() {
  size(800, 600);
  frameRate(7);

  birds[0]  = loadImage("1.png");
  birds[1]  = loadImage("2.png"); 
  birds[2]  = loadImage("3.png");
  birds[3]  = loadImage("4.png");     
  tree = loadImage("tree.png");
  leaves = loadImage("leaves.png");
}

void draw_colorbackground(){
  int h= hour(); 
  if (h < 10) background(map(h, 0, 10, 0, 255), 100);
  else if (h >=10 && h < 18) background(255, 100);
  else background(map(h, 18, 23, 100, 0), 100);
}

void draw_tree(){
  smooth();
  imageMode(CENTER);
  image(tree, width/2, height/2);
}  



void draw_circles(){
 int s = second(); 
 noStroke();
 if ( currentS != second() ) {
 fill(map(s, 0, 59, random(165,255), random(165,255)),map(s, 0, 59,random(165,255), random(165,255)),map(s, 0, 59, random(165,255), random(165,255)),150);
 currentS = second();
 }
 ellipse(250,200, random(138,140), random(90,92)); 
 ellipse(350,220, random(140,142), random(105,107));
 ellipse(300,150, random(100,102), random(88,90));
 ellipse(400,140, random(130,132), random(120,122));
 ellipse(500,150, random(118,120), random(80,82));
 ellipse(480,180, random(100,102), random(90,92));
 ellipse(580,200, random(128,130), random(98,100));
 ellipse(480,220, random(138,140), random(85,87));

 //smaller circles
 ellipse(280,240, random(80,82), random(45,47));
 ellipse(410,255, random(90,92), random(38,40));
 ellipse(530,245, random(80,82), random(35,37));
 ellipse(340,110, random(55,57), random(48,50));
 ellipse(460,115, random(50,52), random(48,50));
 ellipse(247,150, random(53,55), random(50,52));
 ellipse(560,150, random(53,55), random(43,45));
 
}

void draw_birdbackground(){
  for (int i = min; i > 0; i--){
    if ((i <60) && (i > 50)) draw_bird(25*i-950, 150, float(i));  
    if ((i <50) && (i > 40))draw_bird(30*i - 300, 160, float(i));
    if ((i <40) && (i > 30)) draw_bird(25*i-500, 170, float(i));  
    if ((i <30) && (i > 20))draw_bird(30*i - 350, 185, float(i));
    if ((i <20) && (i > 10))draw_bird(25*i, 200, float(i));
    if ((i <10) && (i > 0))draw_bird(270+30*i, 215, float(i));
  }
}  

void draw_bird(float x, float y, float i){
  smooth();
  int shape = int(i)%4; 
  image(birds[shape], x, y, 10,10);
}



  
void draw(){ 

 pushMatrix();
  draw_colorbackground();
  draw_circles();
  draw_tree(); 
  int m = minute();
  if (m % 2 == 0){
    draw_bird(left_x+t, 0+t, t);
    if (t < left_y) t += 0.5;
    else t = t - int(left_y);
  }
  else {
    draw_bird(right_x-k, 0+k, k);
    if (k < right_y) k += 0.5;
    else k = k - int(right_y);
  }
  popMatrix();   
  draw_birdbackground();

}


