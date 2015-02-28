
int rad = 500;
int ballSize = 20;
int angle = 0;
int colorBlack = 30;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  frameRate(5);
  background(colorBlack);
  translate(width/2, height/2);
  
  

  for ( int inc=0; inc < 360; inc +=40) {
    //we use the increment to add to the angle
    //every frame it will be incremented by 10
    float angle1 = radians(inc);
    float angle2 = radians(inc-20);
    
    float x = cos(angle1) * rad;
    float y = sin (angle1) * rad;
    
    float x2 = cos(angle2) * rad;
    float y2 = sin (angle2) * rad;
    
    strokeWeight(5);
    stroke(0);
    fill(random(255),random(55),0);
    triangle (x,y, x2, y2, 0, 0);
    
    strokeWeight(5);
    stroke(0);
    fill(255,175,0);
    triangle (x/5,y/5, x2/2, y2/2, 0, 0); 
    
    strokeWeight(5);
    stroke(0);
    fill(0,50,100);
    ellipse (x/5,y/5, 30, 30); 
    
    strokeWeight(5);
    stroke(0);
    fill(0,50,100);
    ellipse (x/2,y/2, 130, 130); 
    
    rectMode(CENTER);
    strokeWeight(5);
    stroke(0);
    fill(255,175,0);
    rect (x/2,y/2, 90, 90);
    
    strokeWeight(5);
    stroke(0);
    fill(150,10,0);
    ellipse (x/2,y/2, 60, 60); 
    
    
    
    
    
    
    
  }
  if(mousePressed){
    frameRate(100);
    colorBlack = 255;
  }
  else{
    colorBlack = 30;
  }
   
 
}


