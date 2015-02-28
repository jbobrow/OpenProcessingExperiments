
int myVar = 0;
int myBit = 1;
int myBat = 2;


void setup () {
  size(500,500);
  smooth();
  ellipseMode(CENTER);
  PImage b;
  b = loadImage("CHAIR.jpg");
  background(b);

}

  void draw () {
    
    fill(myVar);
    stroke(255,0,0);
    strokeWeight(0.7);
    
    
    ellipse(myVar,0,50,50);
    
    fill(158,34,94,10);
    ellipse(500,0,mouseX,mouseY);
    
    fill(myBit);
    
    ellipse(mouseX,mouseY,25,25);
    
    fill(199,240,250,5);
    ellipse(myVar,500,50,50);
    
    fill(167,226,240,5);
    stroke(187,239,247);
    ellipse(30,500,mouseX,mouseY);
  
    
  }
  

  
  
  
  void mouseDragged() 
{
  myVar = myVar + 5;
  if (myVar > width) {
    myVar = 0;
  }
    myBat = myBat+1;
  if (myBat >55) {
    myBat = 0;
  }
}

void mouseMoved() {
  myBit = myBit + 3;
  if (myBit > height) {
    myBit = 0;
  }
}
void mousePressed(){ 
 
  setup(); 
} 

