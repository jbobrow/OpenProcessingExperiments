
float hue;
int transp;
void setup() {
  size(500, 500);
  colorMode(HSB, 255);
}


void draw() {
  background(255);

frameRate(15);
  stroke(50);
  //line(0, height/2, width, height/2);
  for (float x1 = 0; x1<=width; x1 = x1+20)
  {
    float x2 = x1 + random(x1);
    {
      for (float y1 = 0; y1<= height*random(2); y1 = y1+10)
      {
        float x3 = x1 +random(5);
        float y2 = y1 +random(x1);
        float y3 = y1 +random(5); 
        if (mouseY <= height/2) {
          transp =255;
        } else {

          transp = 20;
        }

        fill(x1, mouseX, mouseY, transp);

        triangle(x2, y3, mouseX, mouseY, x1, mouseX);
      }
    }
  }
}

void keyPressed() {
  if ( key == ' ' ) {
    //save(picture.jpg);
    //saveFrame("player"+ counter);
    saveFrame("colorMode-#####.jpg");
  }
}



