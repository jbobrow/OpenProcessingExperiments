

void setup(){
size(700, 500);
background(250);
smooth();


  frameRate(10);
}

float pts=36;

void draw(){
noStroke();
fill (255,255,255,3.5);
rect (0,0,700,500);
stroke(190, 0, 255, 4);
fill(0, 153, 204, 4); 
int x = width/2;
int y = height/2;
int outerRad = mouseX;
int innerRad = mouseY;
float px = 0, py = 0, angle = 0;

float rot = 360.0/pts;

beginShape(TRIANGLE_STRIP); 
for (int i=0; i<pts; i++) {
  px = x+cos(radians(angle))*outerRad;
  py = y+sin(radians(angle))*outerRad;
  angle+=rot;
  vertex(px, py);
  px = x+cos(radians(angle))*innerRad;
  py = y+sin(radians(angle))*innerRad;
  vertex(px, py); 
  angle+=rot;
}

endShape();

}

void mousePressed()
{
 fill (255,255,255);
 rect (0,0,700,500);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      pts++;
    } else if (keyCode == DOWN) {
      pts--;
    } 
  } 
if (pts<0) {
      pts=1;
    }
}

