
PImage bild1;
PImage bild2;

color farbe1;
color farbe2;

int grox1 = 10;
int groy1 = 2;

int grox2 = 2;
int groy2 = 10;

float x;
float y;

int rx;
int ry;

boolean check = true;

void setup() {
  size(500, 500);
  noStroke();
  imageMode(CENTER);
  frameRate(800);

  bild1 = loadImage("grass.jpg");
  bild2 = loadImage("foggy.jpg");
}



void draw() {

/*  int dif = 2;
  int w = width/dif;
  int h = height/dif;

  int scale = 1;
  int dimx = bild1.width/scale;
  int dimy = bild1.height/scale;
*/  

  //image(raster, w, h, dimx, dimy);
  




  if(mousePressed == false){
  x = random(mouseX-50,mouseX+50);
  y = random(mouseY-50,mouseY+50);
  
  rx = round(x);
  ry = round(y);
      farbe1 = bild1.get(rx,ry);
      fill(farbe1);
      ellipse(rx,ry,grox1,groy1);
  }
  
  if(mousePressed == true){
  x = random(mouseX-50,mouseX+50);
  y = random(mouseY-50,mouseY+50);
  
  rx = round(x);
  ry = round(y);
      farbe2 = bild2.get(rx,ry);
      fill(farbe2);
      ellipse(rx,ry,grox2,groy2);
      ellipse(rx,ry,grox2,groy2); 
      //check = false;
  }
}



