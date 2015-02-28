
  //HW3 Arthur Siebesian
  //MouseX, MouseY, If, else if, and other interesting works
  //February 2, 2014
  
  float x = 0; //ellipse coords
  float y = 250; //ellipse coords 
  
  void setup() {
    size(500,500);
    background(0);
    smooth(10); 
    strokeWeight(10); //outline
    frameRate(10); //speed of both the moving circle and mouse 
  }
  void draw() {
    x = x + 1; 
    fill(random(255),random(255),random(255),random(255));  //fun colors
    ellipse(x, y, 50,50); //moving circle
     if(x > 499)
     x=0;
    rect(mouseX,mouseY,random(100),random(100));
    if(mouseX>475) {  // resets the screen
      background(255);
      }
    if(mouseY>475) {  //varies the screen
      background(random(255),random(255),random(255),random(255));
    }  
}
    
