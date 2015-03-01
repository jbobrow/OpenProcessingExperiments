
void setup(){
    size(300,300);
    colorMode(RGB,100);
    background(random(100),random(100),random(100));
    frameRate(60);
     
 }


void draw(){/*@pjs preload="shape.png";*/
PImage img;   
img = loadImage("shape.png");     

tint(0, 153, 0);    
image(img, 0, 0);  
tint(0, 0, 255, 127);      
image(img, 150, 150, 150, 150); 


strokeWeight(3); 
stroke(106, 0, 252); 
noFill(); 
rect(90,70,130,190);    
}
  void mousePressed(){
 if( mouseButton == LEFT ) {
    fill(random(100), random(100), random(100));
    noStroke();
    smooth();

   ellipse(mouseX, mouseY,10, 10);
}
  }
