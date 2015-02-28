
int patternSeperationX = 100;
int patternSeperationY = 100;
float h = 0;
float s = 255;
float b = 150;
float bChange = 1;
 
 
void setup(){
  colorMode (HSB, 360, 100, 100);
  size(500,500);
  smooth();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(150);
} 

 
void draw() {
background(h, s, b);
  if (mouseX > 0 && mouseX < 500) { 
    h = map (mouseX, 0, width, 0, 360);
  }
  if (mouseY > 0 && mouseY < 500) { 
    s = map (mouseY, 0, height, 0, 100);
  }
  if (mousePressed) {
    b = b + bChange;
  }
  if (mousePressed && b > 500 || b < 0) {
    bChange = bChange * -1;
  }
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        hexagon();
        popMatrix();
      }
  }
 
  
}

void hexagon(){
  strokeWeight(4);
  // vert
  line(0,0,0,17);
  line(50,0,50,17);
  line(0,83,0,100);
  line(50,83,50,100);
  line(25,33,25,67);
  line(75,33,75,67);
  //diag
  line(0,17,25,33);
  line(25,33,50,17);
  line(50,17,75,33);
  line(75,33,100,17);
  line(0,83,25,67);
  line(25,67,50,83);
  line(50,83,75,67);
  line(75,67,100,83);
   
  //inner lines
  strokeWeight(3);
  line(5,0,5,14);
  line(5,14,25,27);
  line(45,0,45,14);
  line(25,27,45,14);
   
  line(55,0,55,14);
  line(55,14,75,27);
  line(95,0,95,14);
  line(75,27,95,14);
   
  line(0,23,20,36);
  line(20,36,20,63);
  line(20,63,0,76);
   
  line(50,23,30,36);
  line(30,36,30,63);
  line(30,63,50,76);
   
  line(50,23,70,36);
  line(70,36,70,63);
  line(70,63,50,76);
   
  line(100,23,80,36);
  line(80,36,80,63);
  line(80,63,100,76);
   
  line(5,100,5,86);
  line(5,86,25,73);
  line(45,100,45,86);
  line(25,73,45,86);
   
  line(55,100,55,86);
  line(55,86,75,73);
  line(95,100,95,86);
  line(75,73,95,86);

}
