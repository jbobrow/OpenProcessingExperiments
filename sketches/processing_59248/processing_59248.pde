
float culr;
float moveZ;
int fix =100;
int factor =1;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB);
  frameRate(60);
}

void draw() {
  // translate(width/2,height/2);

  background(0);
  for (int x = 0; x < width; x = x + 25) {
    for (int y = 0; y < height; y = y + 25) {

      culr = noise(x/(1*fix*factor), y/(1*fix*factor), moveZ)*360;
      fill(culr, 360, 360);

      // rect(x+2.5,y+2.5,20,20);
      roundedRect(x+2.5, y+2.5, 20, 20, 10, 10);

      print(fix);
      print("~~");
      println(factor);
    }
  }

  moveZ+=0.01;
}


void roundedRect(float x, float y, float w, float h, float rx, float ry) { //Code adapted from "cefnhoile", heres the link: https://forum.processing.org/topic/rounded-rectangle . 
  noStroke();
  smooth();
  beginShape();
  vertex(x, y+ry); //top of left side 
  bezierVertex(x, y, x, y, x+rx, y); //top left corner

  vertex(x+w-rx, y); //right of top side 
  bezierVertex(x+w, y, x+w, y, x+w, y+ry); //top right corner

  vertex(x+w, y+h-ry); //bottom of right side
  bezierVertex(x+w, y+h, x+w, y+h, x+w-rx, y+h); //bottom right corner

  vertex(x+rx, y+h); //left of bottom side
  bezierVertex(x, y+h, x, y+h, x, y+h-ry); //bottom left corner

  endShape(CLOSE);
} 


void mousePressed() {
  if (mousePressed && mouseX>=480 && mouseY>=460 && mouseY<480) {
    fix *=10;
  }
  if (mousePressed && mouseX>=480 && mouseY>=480 && fix !=1) {
    fix /=10;
  }

   if (mousePressed && mouseX<=20 && mouseY>=460 && mouseY<480) {
    factor +=1;
  }
  if (mousePressed && mouseX<=20 && mouseY>=480 && factor !=1) {
    factor -=1;
  }
}


