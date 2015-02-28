
PImage myPic;
void setup(){
  size(400,400,P3D);
  myPic = loadImage("mona.jpg");
  noStroke();
  smooth();
  background(0);
}

int cell = 5;
int n=0;
float cameraX, cameraY;

void draw(){
  //camera(500,-100,200,0,0,0,1,1,-1);
  translate(width/2,height/2,0);
  for(int y=cell; y <= 399; y+=cell){
   for(int x=cell; x <= 399; x+=cell){
     rotateZ(n*-PI/6*0.05);
     color myFill = color(myPic.pixels[x + (y * 400)]);
     fill(myFill);
     float radius = cell * (brightness(myPic.pixels[x + (y * 400)]) / 255);
     ellipse(x,y,radius,radius);
     n++;
    }
  }
}
void mousePressed(){
  background(255);
  //camera
  cameraX = radians(map(mouseX, 0, width, 180, 45));
  cameraY = radians(map(mouseY, 0, height, 45, 180));
  camera(500 * cos(cameraX * 2),-100,500 * sin(cameraY * 2),0,0,0,1,1,-1);
}

