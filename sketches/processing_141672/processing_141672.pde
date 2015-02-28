
float r = 128;
float rot;
float w2, h2;
color[] col;
int k;
String txt,txt_help;
boolean help,showText;
char rotationMode;
float cZoom;

void setup() {
  size(600,600,P3D);
  w2 = width/2;
  h2 = height/2;
  colorMode(HSB,100);
  col = new color[3];
  col[0] = color(63,100,100,100);
  col[1] = color(67,100,50,100);
  col[2] = color(100,100,100,18);
  smooth();
  rotationMode = 'x';
  //txt = "Rotation axis: " + rotationMode;
  txt = "Rotation axis: x";
  cZoom = h2 / tan(PI/6);
  textAlign(LEFT);
  textSize(18);
  rectMode(CENTER);
}

void draw() { 
  background(col[1]);  
  lights();
  //camera(eyeX, eyeY, eyeZ,centerX, centerY, centerZ,upX, upY, upZ);
  camera(w2, h2, cZoom, w2, h2, 0, 0, 1, 0);
  translate(w2,h2);
  switch(rotationMode) {
  case 'x': 
    rot = map(0, mouseY, height, 0, 2*PI);
    rotateX(rot);
    break;
  case 'y': 
    rot = map(mouseX, 0, width, 0, 2*PI);
    rotateY(rot);
    break;
  case 'z':
    rotateZ(atan2(mouseY-h2, mouseX-w2));
    break;
  case 'h':
    help = !help;
    txt_help = "Use x, y, z to change rotation mode,\nh for help";
    break;
  default:
    break;
  }
  if (help) {
    text(txt_help,12,r+36);
  }
  if (showText) {
    text(txt,12,r+44);
  }
  strokeWeight(2);
  stroke(col[0]);
  line(0,-height,0,0,height,0);
  line(-width,0,0,width,0,0);
  strokeWeight(1);
  stroke(col[0]);
  fill(col[0]);
  sphere(r);
  fill(col[2]);
  rect(0,0,2*r+10,2*r+10);
}

void keyPressed() {
  switch(key) {
  case 'x': 
    rotationMode = 'x';
    txt = "Rotation axis: x";
    break;
  case 'y': 
    rotationMode = 'y';
    txt = "Rotation axis: y";
    break;
  case 'z': 
    rotationMode = 'z';
    txt = "Rotation axis: z";  
    break;
  case '+':
    cZoom-=2;
    break;
  case '-':
    cZoom+=2;
    break;
  case 'r':  
    showText = !showText;
    help = (showText && help)? !help:help;
    break;
  case 'h':
    help = !help;
    showText = (showText && help)? !showText:showText;
    txt_help = "Use x, y, z to change axis of\nrotation,\nh to show/hide help,\n+ and - to zoom in and out,\nr to show axis of rotation.";
    break;
  default:
    break;
  }
}
 
  



