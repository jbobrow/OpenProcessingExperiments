
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an ifram


PGraphics canvas;

int vertices = 59; //60
float radius = 100;
float circleX;
float circleY;
float circleZ;
float rotation = 0;
int offset;
float petals;
int counter = 0;
int framecounter = 0;

//int allVertices = [];

void setup() {
  size(700, 700, P3D);
  //background(0);
  circleX = 0;
  circleY = 0;

  canvas = createGraphics(width, height, P3D);
}

void draw() {
  //move camera
  //camera(2*mouseX, 2*mouseY, width/2, width/2, height/2, 0, 0, 1, 0);
  //camera(mouseX, mouseY, 0, 0, 0, 0, 0, 1, 0);

    externals.context.clearRect(0,0,width,height);

  translate(width/2, height/2);

  //rotateZ(radians(rotation));
  //rotateY(radians(rotation));
  rotateX(radians(rotation));
  rotateZ(PI/4);
  rotation += 0.5; //rate
  
  offset++;

  petals = map(sin(offset*0.0002), -1, 1, 1, 100); //small number is rate
  multiShape();
  
  
} ////////////////rotate one, use getVertex() and connect them into a 3D shape

void multiShape() {
  for (float i = 0; i<PI; i+=0.015625) { //resolution //0.0625
    rotateX(PI*i);
    //if (counter % 2 == 0) { fill(#ffcc33); }
    //else{fill(255);}

    //fill(255);
    counter++;
    singleShape();
  }
}

void singleShape() {
  beginShape();
  for (int i = 0; i < vertices; i++) {

    float scale = 150;

    float waveAngle = map(i, 0, vertices, 0, TWO_PI * petals);
    float waveOffset = sin(waveAngle) * scale;  //scale the -1 to 1 up

    float angle = map(i, 0, vertices, 0, TWO_PI * 119); //last number matters

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
    canvas.save("frame.png");
  }
}
