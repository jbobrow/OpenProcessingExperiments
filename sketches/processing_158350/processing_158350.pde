
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

float rad = 70 ;
float shape = TWO_PI;  
int count = 110;
float f;

float[][] cordinates = new float[count][2];


void setup() { 
  size(600, 600, OPENGL);
  smooth(8);
  noiseDetail(3, 0.6);
  strokeWeight(2);
  stroke(25);
  noFill();
}

void draw() {  
  background(255);
  f = frameCount*0.01;

  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i < count; i++) {
    float nx = noise(i*0.7+f) * 20 ;
    float x = sin(map(i, 0, count, 0, shape)) * (rad + nx) ;
    float y = cos(map(i, 0, count, 0, shape)) * (rad + nx) ;   
    cordinates[i][0] = x;
    cordinates[i][1] = y;
  }

  strokeWeight(1);
  for (int i = 0; i < count; i++) {
    line(cordinates[i][0], cordinates[i][1], cordinates[i][0]*2.5, cordinates[i][1]*2.5);
  }

  beginShape();
  for (int i = 0; i < count; i++) {
    vertex(cordinates[i][0]*2.6, cordinates[i][1]*2.6);
  }
  endShape(CLOSE);

  beginShape();
  for (int i = 0; i < count; i++) {
    vertex(cordinates[i][0]*0.9, cordinates[i][1]*0.9);
  }
  endShape(CLOSE);

  popMatrix(); 
  saveFrame("color-######.png");
}



