
void setup() {
  size(900, 450);
  
  //anti-aliasing
  smooth();
  
  //RGB 
    background(150, 130, 100);
  
    
}

  void draw(){
    //background(150, 130, 100, 5);
    int x;
    int y;
    float r = random(20,60);
    float diamx = 0;
    float diamy = 0;
    
    x = mouseX;
    y = mouseY;
    
    //Rectangle draws from center
    rectMode(CENTER);
    
    //Rectangle properties
    noStroke();
    fill(0, 40);
    
    //mouseButton example
    if (mousePressed && (mouseButton == LEFT)) {
    for(int opacity = 160; opacity > 5; opacity = opacity - 10){
    fill(30, 20, 55, opacity);
    background(150, 130, 100);
    }
    diamx = r;
    diamy = r;
    
  } else if (mousePressed && (mouseButton == RIGHT)) {
    for(int opacity = 160; opacity > 5; opacity = opacity - 10){
    fill(50, 60, 45, opacity);
    background(150, 130, 100);
    }
    diamx = r;
    diamy = r;
    
  } 
    
    
   
   for (int x1 = x; x1 > 0; x1 = x1 - 1) {
    //Draw an ellipse
    ellipse(x1, y, diamx, diamy);
   }
   

    for (int y1 = y; y1 > 0; y1 = y1 - 1) {
    //Draw an ellipse
    ellipse(x, y1, diamx, diamy);
   }
    
  
  
  
}               
