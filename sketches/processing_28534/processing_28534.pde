
PImage leaves;
PImage [] worm; 
int frame = 0; 
int x = 250;
int y = 275;
float rot = 0; 
float desiredRot = 0;
int b = 100;
int a = 75; 
int x2= 3; 

void setup() {
  frameRate (10); 
  size(500,500);
  worm = new PImage[2];
  for(int i = 0; i<worm.length; i++) {
    worm[i] = loadImage("monarch"+ (i+1) +".png");
  }
  leaves = loadImage("Background.jpg");
}

void draw() {
  if (frame > 1) frame = 0;
  image(leaves,0,0,500,500);
  
  pushMatrix();
  translate(x, y);
  rotate(rot);
  image(worm[frame],-50,-50, a, b);
  popMatrix();
  
  x+=x2;
  frame++;
  if(x>=500 || x<=0){
    x2*=-1;
  }
  else if(mousePressed){
    a++;
    b++;
  }
}
  



