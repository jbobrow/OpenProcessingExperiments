
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: LIM Hyun Seung
// ID: 201420104

//Triangle
int x = 0;
int y = 0;
float r = 0;
float radius = 360.0;
float z = 5;
PFont font;


void setup() {
  size(600, 600);
  fill(100);
  frameRate(6);
  smooth();
  noStroke();
  //Font
  font = createFont("ACaslonPro-SemiboldItalic", 35);
}

void draw() {
  background(50);
  textAlign(CENTER, CENTER);

  ///Motion Space text   
  fill(255, 255, 255);
  textFont(font);
  text("Space Motion", 120, 550);


  //Motion Space Rotate
  translate(width/2, height/2);
  rotate(width/2+height/2-r);
  
  //Motion Space Triangle 
  for (int deg = 0; deg<360*2; deg+=20) {
    float angle = radians(deg);
    float x= 0+(cos(angle)*radius/2);
    float y= 0+(sin(angle)*radius/2);

    curve(z, z, 20, 10, x, y, z,z);
    fill(random(height), random(255), 100, 86);
  }

  radius = radius + 20;
  z-=2.2;

  if (radius>400) {
    radius-=1020;//short 
    z=3.2;
  }


  r+=PI/16;
}

