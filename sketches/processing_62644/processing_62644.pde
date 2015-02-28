
int Teilung = 3;

int WindowWidth;
int WindowHeight;

int rand = int(random(255));



int ObjectWidth;
int ObjectHeight;


void setup() {

  size(300, 300);
  smooth();  

  WindowWidth = width;
  WindowHeight = height;

  ObjectWidth = WindowWidth/Teilung;
  ObjectHeight = WindowHeight/Teilung;
}



void draw() {

  randomSeed(rand);

  background(255, 150, 45);
  fill(255, 0);

  for (int x = 0; x <= WindowWidth; x = x + ObjectWidth) {

    for (int y = 0; y <= WindowHeight; y = y + ObjectHeight) {
      int a = int(random(9));        
      stroke(0);
      rect(x, y, ObjectWidth, ObjectHeight);         

      if (a < 5 ) {
        stroke(0, 255, 0);
        line(x, y, ObjectWidth+x, ObjectHeight+y);
        line(x, ObjectHeight+y, ObjectWidth+x, y);
      }
      else {
        stroke(255, 0, 0);
        ellipse(x+ObjectWidth/2, y+ObjectHeight/2, ObjectWidth, ObjectHeight);
      }

      println(a);
    }
  }
}

void mouseClicked() {
  rand = int(random(255));
}


