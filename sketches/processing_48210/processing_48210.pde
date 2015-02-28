
PFont font;
float theta = 0;
void setup() {
  size(800, 800, P3D);
  smooth();
  frameRate(30);
  font = loadFont("3.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  stroke(255);
  translate(width/2, height/2.4);
  fill(100);
  textFont(font, int(map(mouseX, 0, width, 5, 48)));
  text("museum of science", 0, int(map(mouseX, 0, width, 0, 100)));

  for (float i=0;  i < TWO_PI; i+=0.9) {
    pushMatrix();
    rotateX(theta+i);
    for (float j = 0; j < PI; j+=0.4) {

      rotateY(-theta-j);
      rotateZ(-theta-j);

      stroke(int(random(215, 255)), int(random(215, 255)), int(random(215, 255)));    
      noFill();
      ellipse( 0, 0, int(map(mouseX, 0, width, 30, 300)), int(map(mouseX, 0, width, 30, 300)));
    }
    popMatrix();
    endShape();
  }
  theta+= 0.0022;
} 


