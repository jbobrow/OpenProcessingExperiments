
/* @pjs preload="dino_01"; */
PImage picture;
PImage dino;
int value=0;
int count;


int x = 250;
int y = 500;
int a = 200;
int n = 4;

void setup(){
    size(500,500);
  picture =loadImage ("knot.jpg");
  dino =loadImage("puke.jpg");
  noStroke();
  smooth();
  
}

void draw(){
  println("");
 
  
   if(key == 'c')
    {
      strokeWeight(3);
      stroke(random(255), random(255), random(255));
      line(mouseX,mouseY,random(mouseX+60,mouseX-60),random(mouseY+60,mouseY-60));
    fill(93,146, 221);
      drawT(x,y,a,n);
  }
   
  count = millis();
  if (count<500)
  image(picture,0,0,500,500);
  
if(keyPressed){
    if (key == 'd') {
      image(dino, mouseX-75,mouseY-75,150,150);
      println("SUCCESS!!");  
  }
  }
  
  if(keyPressed==true){
    fill(207,178,86);
  }
  
  else{
     fill(177,65,48);
  }
  if(mousePressed ==true){
    ellipse(mouseX,mouseY,25,25);
    
  }
 
}
 void drawT(int x, int y, int apex, int num) {
   line(x,y,x,y-apex);
   line(x-apex, y-apex, x+apex, y-apex);
   if (num > 0) {
     drawT(x-apex, y-apex, apex/2, num-1);
     drawT(x+apex, y-apex, apex/2, num-1);
     println("SUCCESS!!");
   }
 }


