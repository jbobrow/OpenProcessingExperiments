
//girl position
int[] xpos = new int [13];
int[] ypos = new int [13];
PImage[] girl = new PImage[13];
PImage bg;
PImage bounce;
//girl pic w and h
int w = 70;
int h = 140;
//bouncing picture 
float x = random(0,800);
float y = random(0,600);
int xspeed = 20;
int yspeed = 11;


void setup(){
  size(800,600);
 bg = loadImage("brain1.jpg");
 bounce = loadImage("haha.png");
 
  for (int i = 0; i < xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;
    girl[0] = loadImage("1.png");
    girl[1] = loadImage("2.png");
    girl[2] = loadImage("3.png");
    girl[3] = loadImage("4.png");
    girl[4] = loadImage("5.png");
    girl[5] = loadImage("6.png");
    girl[6] = loadImage("7.png");
    girl[7] = loadImage("8.png");
    girl[8] = loadImage("9.png");
    girl[9] = loadImage("10.png");
    girl[10] = loadImage("11.png");
    girl[11] = loadImage("12.png");
    girl[12] = loadImage("13.png");
  }
}

void draw(){
  background(255);
  frameRate(15);
  image(bg,400,300,800,600);
  
  image(bounce,x,y,74,115);
  x = x + xspeed;
  y = y + yspeed;
  
  if((x > width)|| (x < 0)){
    xspeed = xspeed * -1;
  }
    
  if ((y>height)||(y<0)){
    yspeed = yspeed * -1;
  }
  
  
  
  for(int i = 0; i < xpos.length-1;i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  for(int i =0 ; i < xpos.length; i++){
    imageMode(CENTER);
    image(girl[i],xpos[i],ypos[i],w,h);
  }
}
    
  

