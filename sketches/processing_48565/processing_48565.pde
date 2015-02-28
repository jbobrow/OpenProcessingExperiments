
RoundThing[] roundy = new RoundThing[70];
float[] originalx;
float[] originaly;
int j;


void setup() {
  smooth();
  size(600, 600); 
  originalx = new float[70];
  originaly = new float[70];

  for (int j = 0; j < roundy.length; j++) {
    float x = (random(width))-600;
    float y = (random(height))-600;
    float s =  (random(3)+1);
    int b = int(random(30));
    int g = int(random(255));
    roundy[j] = new RoundThing(x, y, s, b, g);
    originalx[j] = x;
    originaly[j] = y;
  }
}

void draw() {
  background(204);

  doThis();
}



class RoundThing {
  int size = 200;
  float x, y;
  float speed;
  int weight;
  int gray;

  RoundThing(float datx, float daty, float zoom, int bass, int datGray) {
    x = datx;
    y = daty;
    speed = zoom;
    weight = bass;
    gray = datGray; 

    if (x > 0 && y > 0) {
      int det = int(random(2));
      if (det == 1) {
        x = 0;
      } 
      if (det == 0) {
        y = 0;
      }
    }
  }


  void move() {

    if (x > width || y > height) {
      x = random(-width*2, -width);
      y = random(-height*2, -height);
    } 




    x += speed;
    y += speed;
  }
  void display() {
    strokeWeight(weight);
    stroke(gray);
    line(x, y, x + size, y +size);
  }
}

void doThis() {
  for (int i = 0; i < roundy.length; i++) {


    roundy[i].move();
    roundy[i].display();
  }
}


