
PImage donut;
PImage babygirl;
float aspect = 0.1;
//p is paused
boolean p = false;

void setup(){
  size(800,800);
  background(255);
 donut = loadImage("Motif_9.png");
 babygirl = loadImage("Motif_7.png");
}


void draw (){
  if(p==false)
  {
 image(donut, random(-250,width), random(-250,height));
 frameRate(100);}
 }
void mousePressed(){
image(babygirl, mouseX-100, mouseY-100, babygirl.width/2, babygirl.height/2);
}
void keyPressed(){
  if(key == ' ')
  {
  //if program is paused, then unpause (set p=false)
  
  if(p ==true)
  {
    p=false;
  }
  else
  {
    p=true;
  }
  }
  if(key == 'c')
  {
    fill(136, 152, 206, 30);
   rect(0, 0, width, height); 
  }
  
}


