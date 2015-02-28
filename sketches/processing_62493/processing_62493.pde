
float xcent=width/2;
float ycent=height/2;

void setup() {
  
  size(400,600);
  smooth();
  stroke(5,80);
  fill(122,201,145);
  frameRate(200);
  
}

void draw() {

   
  
  for (int b=30; b<1000; b=b+6) {
    for (int c=45; c<700; c=c+9) {
      
      fill(c/20, b+c+30, b*64);
      ellipse(xcent, ycent, 20,140);
      translate (width,height,mouseY); 
    translate (mouseX,mouseY,mouseX);
      
      
   
    
    fill (c*6,b*2, 24);
    triangle (7,110,110,250,6,80);
    translate (width/20,height/30); 
    translate (mouseX,mouseY);
    }
    
    
  }
  
}

