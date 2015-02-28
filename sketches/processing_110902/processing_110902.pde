
//So Hei Man, Heyman
//Declare variable of type float
float r1,g1,b1,a1;
float r2,g2,b2,a2;
float x, y;
float r=300, angle=0 ;

//Set up the basic settings
void setup() {
  size(600, 600);
  background(255);
  smooth();
  frameRate(10);
}

void effect() {
  // Each time through draw(), new random value of RGB color are picked
  r1 = random(100);
  g1 = random(50);
  b1 = random(225);
  a1 = random(5);
  
  r2 = random(225);
  g2 = random(50);
  b2 = random(50);
  a2 = random(5);
  
  // Draw ellipses with different rotation, stroke, width and height
  stroke(255);
  strokeWeight(0.5);
  
  x = r * cos(angle);
  y = r * sin(angle);
   
  rotate(r);
  r = r + 1;
  angle = angle + 2; 
  
  ellipse(0, 0, x, y);
  strokeWeight(1);
}

void draw(){
  for (int i=0; i<300; i=i+70){
    for(int j=0; j<300; j=j+70){
      effect();
      
      //Press the "up" or "down" key to change the color of ellipses 
      if (key == CODED) {
        if (keyCode == UP) {
         fill(r1,g1,b1,a1);
        
       }else if (keyCode == DOWN) {
         fill(r2,g2,b2,a2);
       } 
      }
    }
  }
}

//Reference Source:http://www.openprocessing.org/sketch/110308



