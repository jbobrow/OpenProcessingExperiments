
import peasy.*;

PeasyCam jCam;

void setup(){
  size(500,500,P3D);
  frameRate(10);
 


jCam = new PeasyCam(this, 100);


}

void draw(){
  background(150,20,200);
  
  stroke(255);
  noFill();
 
  
  int x = 15;
  int y = 10;
  int r = 5;
  int g = 15;
  int b = 10;

  
for(int j=0;j <24; j++) {
  
  for(int i = 0; i < 24;i++){
    strokeWeight(1);
    fill(r,100,200);
    rect(x,y,10,10);
    rotate(random(1));
    ellipse(x+10,y+10,10,10);
    box(x/8,y/2,10);
    
    
    x = x+20;
    r++;
    
  }
  
  
  y=y+20;
  x= 45;
}

if (mousePressed) {
    if (mouseButton == RIGHT) 
    fill(30,200,40);
    ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX-20,mouseY-15,20,20);
  ellipse(mouseX+20,mouseY-15,20,20);
  ellipse(mouseX-20,mouseY-15,5,5);
  ellipse(mouseX+20,mouseY-15,5,5);
  ellipse(mouseX +10,mouseY +25,mouseX/10,mouseY/10);

}

}




