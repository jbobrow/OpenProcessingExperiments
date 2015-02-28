
PImage level;
PImage [] bee;
int x = 0;
int y = 250;
int frame = 0;
int x2 = 3;
int b = 100;
int a = 75;
 
float rot=0;
float desiredRot = 0;
 
 
void setup(){
  size (500,500);
  
  bee = new PImage[3];
  for(int i = 0; i< bee.length; i ++) {
  bee[i]= loadImage("bee" + (i+1) + ".png"); 
  }
  level= loadImage("level.jpeg"); 
}
 
 
 
void draw(){
   
 if(frame > 2) frame = 0;
   
  
 image(level, 0,0, 500, 500);
   
   
   
  pushMatrix();
  translate(x,y);
  rotate(rot);
  image(bee[frame], -50,-50, a,b);
  popMatrix();
   
  x+=x2;
  frame++;
 // y+=y2;
  
 if (x>=500 || x<=0)
   {
    x2*=-1;
 }
  else if(mousePressed){
  a++;
  b++;
     
 }
}


