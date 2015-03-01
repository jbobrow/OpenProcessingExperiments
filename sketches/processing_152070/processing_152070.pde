
color BLUE = #002147;
color WHITE = #FFFFFF;
color RED = #BB133E;

void setup() {
  size(400, 300);
}

void star(float x, float y, float radius) {

  float s = radius  / 50;

  beginShape();
  vertex(x + 0  * s, y - 50 * s);
  vertex(x + 14 * s, y - 20 * s);
  vertex(x + 47 * s, y - 15 * s);
  vertex(x + 23 * s, y + 7  * s);
  vertex(x + 29 * s, y + 40 * s);
  vertex(x + 0  * s, y + 25 * s);
  vertex(x - 29 * s, y + 40 * s);
  vertex(x - 23 * s, y + 7  * s);
  vertex(x - 47 * s, y - 15 * s);
  vertex(x - 14 * s, y - 20 * s);
  endShape(CLOSE);
}


void stars(float x, float y, float flagHeight) {
  float A = flagHeight;
  float B =  1.9 * A;
  float C = 7 * A / 13;
  float D = 2*B / 5;
  float E = C / 10;
  float F = C / 10;
  float G = D / 12;
  float H = D / 12;
  float K = 4 *A / 65;
  float L =  A / 13; 
  
  noStroke(); //disable the black outlines
  fill(BLUE);
  rect(x, y, D, C);
  
  fill(WHITE);
  for (int i = 0; i < 11; i++) {
    for (int j = 0; j < 9 ; j++) {
      if ((i + j) % 2 == 0){
        star( i * H + G, j*F + E, K/2);
      }
    }
  }
    
}


void stripes(float x, float y, float flagHeight) {
  float A = flagHeight;
  float B =  1.9 * A;
  float C = 7 * A / 13;
  float D = 2*B / 5;
  float E = C / 10;
  float F = C / 10;
  float G = D / 12;
  float H = D / 12;
  float K = 4 *A / 65;
  float L =  A / 13;
  
  //The white background
  fill(WHITE);
  rect(x, y, B, A);
  
  //The red stripes
  fill(RED);
  for (int i = 0; i < 7; ++i) {
    //Every *other* stripe, that is why i*L*2
    rect(x, y + i*L*2, B, L);
  }
} 

void flag(float x, float y, float flagHeight) {
  stripes(x, y, flagHeight);
  stars(x, y, flagHeight);
}

void draw() {
  randomSeed(146);
  background(0);

translate(60, 60);
rotate(radians(30)*sin(frameCount/10.0));
translate(-60, -60);
flag(10, 10, 150);

}
