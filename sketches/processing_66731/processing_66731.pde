
int rotation;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  
  //frameRate(0.5);
  
  
  
  //import text type/see texts
    String[] fontList = PFont.list();
    println(fontList);
}

void draw() {

  background(255);
  
  
  circleVortex(width - rotation , height - rotation);
  circleVortex(0, height + rotation);
  circleVortex(width - rotation, 0);
  circleVortex(0, 0 - rotation);
  circleVortex (width - rotation, height + rotation);
  
  noStroke();
  fill(0 + rotation, 50, 100);
  rect(width - rotation - 15, height - rotation - 15, 30, 30);
  
 
  rotation += 1;
  
 
  
}

void circleVortex(int x, int y) {

  for (int i = 0; i < 600; i += 5) {
    stroke(100, 100, i + 1);
    noFill();
    ellipse(x, y, i, i);
  
 // for (int j = 0; j < 400; j += 40) {
   // noStroke();
   // fill(255 - j, 100, 255 - j);
   // rect(j+1, 0, j, j);
    
     
    
    
    
   

    
     }
   

 
}




