
//int a = mouseX;
//int b = mouseY;
PImage img;
int a = 359;
int b = 0;

int z = 30;
int f = 4;

int lx1 = 359;
int ly1 = -10;
int lx2 = 359;
int ly2 = -10;
 
void setup (){
  
  size(718,384);
  img = loadImage("in3.jpg");
  image(img,0,0);
}
 
void draw(){
  frameRate(10);
  noFill();
  //fill(0,0,255);
  stroke(210,219,97);
  strokeWeight(3);
  line(lx1, ly1, lx2, ly2);

  lx1 = lx1 - z;
  ly1 = ly1 + z;
  lx2 = lx2 + z;
  ly2 = ly2 + z;
 

   
    if(ly1>380){
  lx1 = lx1 =359;
  ly1 = ly1 =-10;
  lx2 = lx2 =359;
  ly2 = ly2 =-10;
  image(img,0,0);
  }
  
  if (mousePressed == true) {
    frameRate(20);
    stroke(210,219,97);
  }
   
   
}


