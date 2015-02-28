
PImage myPic; 

void setup(){
  size(300,300);
  myPic = loadImage("Ski.jpeg");
  smooth();

  //set(0,0,myPic);
}

int v = 1;

 
void draw(){



int x = floor(random(0,myPic.width));   
int y = floor(random(0,myPic.height));
color myColor = myPic.get(x,y);

  stroke(myColor);
  strokeWeight(random(0,3));
  line(x,width,x+mouseX,mouseY);
  line(height,y,mouseX,y+mouseY);
  
  

if (mousePressed){
  
fill(myColor,75);  
  rectMode(CENTER);
  rect(mouseX,mouseY,myPic.get(x+v,y+v),myPic.get(x+v,y+v));
  
  v++;
}
}
  

  

