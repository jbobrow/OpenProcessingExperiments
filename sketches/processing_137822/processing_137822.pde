
int vertices = 40; //60
float radius = 100;
float circleX;
float circleY;
float circleZ;
float rotation = 0;
int offset;
float petals;


void setup() {
  size(700, 700, P3D);
  background(0);
  circleX = 0;
  circleY = 0;
}

void draw() {
  //move camera
  camera(mouseX, mouseY, width/2, width/2, height/2, 0, 0, 1, 0);
  
  translate(width/2, height/2);
  background(0);
  offset++;
  //noStroke();
  
  //light source
  //pointLight(255, 255, 255, 500, 500, 0);
  //ambientLight(40, 40, 40); 

  rotate(radians(rotation));
  //rotation += 1; //rate

  petals = map(sin(offset*0.0002), -1, 1, 1, 100); //small number is rate
 
  fill(#ffcc33);
  shape();
  //rotateZ(PI); //offset
  
  rotateX(PI/2); //perpendicular in 3D
  fill(#ffcc33);
  shape();
  
  
  rotateX(PI/4);
  fill(#ffffff);
  shape();
    
  rotateX(TWO_PI/4);
  fill(#ffffff);
  shape();
  
  
} ////////////////rotate one, use getVertex() and connect them into a 3D shape

void shape(){
  beginShape();
  for (int i = 0; i < vertices; i++) {

    float scale = 150;

    float waveAngle = map(i, 0, vertices, 0, TWO_PI * petals); //number of petals
    float waveOffset = sin(waveAngle) * scale;  //scale the -1 to 1 up

    float angle = map(i, 0, vertices, 0, TWO_PI * 110); //last number matters

    float circleOffsetX = cos(angle) * (radius + waveOffset); //xposition
    float circleOffsetY = sin(angle) * (radius + waveOffset); //yposition
    //float circleOffsetZ = sin(angle) * (radius + waveOffset); //zposition

    float x = circleX + circleOffsetX;
    float y = circleY + circleOffsetY;
    //float z = circleZ + circleOffsetZ;

    vertex(x, y);
  }
  endShape(CLOSE);
}

//screenshots:
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("filename-####.png");
  }
}
