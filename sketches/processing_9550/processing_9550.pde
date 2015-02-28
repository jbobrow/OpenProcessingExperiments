
int xspeed, yspeed;
int xpos, ypos, wdth, ht;

PImage Zombie, Sleep, Skull, Skull2, Up;
void setup(){
  size(400,400);
  //loading Images
  Zombie = loadImage("ZombieShoot.jpg");
  Sleep = loadImage("Sleep.jpg");
  Skull =loadImage("Skull.jpg");
  Skull2 =loadImage("Skull2.jpg");
  Up = loadImage("Up.jpg");
  background(232,222,164);

  xspeed = 4;
  yspeed = 2;
 //ball size
  wdth = 20;
  ht = 20;
  // turn off shape stroke rendering
  noStroke();
 //ball start point
  xpos = width/2;
  ypos = height/2;
  frameRate(50);
  fill(232,222,164);
}

void draw(){
   stroke(255);
   display();
   //changes the color of the box 
   fill (random(255),random(200), random(64));
   move();
   bounce(); 
}
void mousePressed(){
  background(232,222,164);
  int i=(int)random(2);
  //if the mouse is pressed one of these images will appear with filters
  if (i==0){
    image (Zombie, 0, 0); 
    filter(BLUR, random(4));
    image (Sleep,0,0);
    blend(Sleep, 0, 0, height, width, 0, 0, int (random(1000,500)), int (random(1000,500)), LIGHTEST);
    }else{
    image(Up,0,0);
    filter(BLUR,random(1));
    blend(Up, 0, 0, height, width, 0, 0, int (random(1000,450)), int (random(1000,450)), LIGHTEST);   
}
}
void mouseReleased(){
  background(232,222,164);
  int i=(int)random(2);
  //when the mouse is released one of these images will occur
  if (i==0){
    image(Skull, 0, 0); 
    image(Zombie,0,0);
    filter(BLUR, random(4));
    blend(Skull, 0, 0, height, width, 0, 0,int (random(1000,400)), int (random(1000,400)), LIGHTEST);
    blend(Skull2, 0, 0, height, width, 0, 0,int (random(1000,400)), int (random(1000,400)), LIGHTEST);
    blend(Zombie, 0, 0, height, width, 0, 0, 400 , 400, DODGE);
    }else{
    image (Up,0,0);
    filter(BLUR,random(1));
    blend(Up, 0, 0, height, width, 0, 0, int (random(1000)), int (random(1000)), DODGE);
    blend(Zombie, 0, 0, height, width, 0, 0, int (random(1000,500)), int (random(1000,500)) , BURN);   
}
}
  void display(){
  rect(xpos, ypos, wdth, ht); 
  //changes the color of the text constantly
  fill(232,222,164);
  smooth();
  fill (random(232),random(22), random(3)); 
  //the text stays on top 
PFont font;
font = loadFont("Garamond-48.vlw");
textFont(font);
text ("The  Home  of",60,50);
text ("The      Disco",80,200);
text ("Rock   &    Roll", 65, 350);
fill(198,125,28);
smooth();
}
void move(){
 xpos+=xspeed;
 ypos+=yspeed; 
}
    //ball collission with the edge
  void bounce(){ 
  if (xpos>=width || xpos<=0){
    xspeed*= -1;
  }   
   if (ypos>=height || ypos<=0){
    yspeed*= -1;
} 
  }


