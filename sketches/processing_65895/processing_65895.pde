
float v =0;
void setup() {
  size(400, 700, P3D);
  smooth();
    colorMode(HSB);
    frameRate(60);
}
void draw() {
  
 
  background(10);

  translate(width/2, 50);
  for (int i = 0; i < 30; i ++) {
    v = v + 0.06;

    fill(i+v%255, 200, random(200,255), 180);
    //noStroke();
    
    translate(i, i, i);
   
     rotateY(radians(mouseX));

    box(10+i);

    translate(i, i, i);
    rotateY(radians(1));

    box(10+i);
  }
}


