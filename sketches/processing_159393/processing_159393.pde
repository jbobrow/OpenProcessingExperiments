
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

float shape = TWO_PI;  
int count = 100;
int forms = 10;
float f;

void setup() { 
  size(600, 600);
  smooth(8);
  noStroke();
}

void draw() {  
  background(255);
  f = frameCount*0.0003;

  pushMatrix();
  translate(width/2, height/2);

  float radn = 250 ;

  fill(20);
  ellipse(0, 0, 120, 120);
  for (int i = 0; i < forms; i++) {


    beginShape(TRIANGLES);
    for (int n = 0; n < count; n++) {
      float rad = radn ;

      if (n%2==1) {
        rad= rad*0.85;
      };
      if (i%2 ==1) {
        float x = sin(map(n, 0, count-1, 0, shape)+f) * rad ;
        float y = cos(map(n, 0, count-1, 0, shape)+f) * rad ;
        vertex(x, y);
      } else {
        float x = sin(map(n, 0, count-1, 0, shape)-f) * rad ;
        float y = cos(map(n, 0, count-1, 0, shape)-f) * rad ;
        vertex(x, y);
      }
    }
    endShape(CLOSE);

    radn = radn*0.85;
  }    

  popMatrix(); 
  saveFrame("color-######.png");
}



