

int posx = 160;
int posy = 240;
int rad = 30;
int distent = 55;
int spacetent = 18;
float angle = 0.1;
float speed = 0.1;
PImage img;
PImage imghead;
boolean imageMode = false;
 
  int hl = 55;
  int hh = 34;


float mx;
float my;

void setup() {
 size(320, 480);
 smooth();
 img = loadImage("skin.png"); // <-- put image in foler
 imghead = loadImage("head.png"); 

  
}


void draw(){
  background(0);
  angle = angle + speed;
  
 my = map(mouseY, 0, height, 0, 10);



//------------sfondo

float radius = 6;

float my = map(mouseY, 0, height, 0, 16);

noFill(); 
for (int c = 0; c < 100; c += 2) {
    stroke(250, mouseY+10, 200);
    strokeWeight(my);
    ellipse(160, 200, radius, radius);
    radius = radius += 30;
}

//----------------end sfondo


noStroke();
  eImageHD(160 + (sin(angle + PI) * 2), 160, 100, 120); //head


  
  fill(230, 0, 0);
  noStroke();
  
 tentacle(radians(00.0));
 tentacle(radians(30.0));
 tentacle(radians(60.0));
 tentacle(radians(90.0));
 tentacle(radians(120.0));
 tentacle(radians(150.0));
 tentacle(radians(180.0));

 
  
  eye(135, 140, -10, hl, hh); // sx
  eye(182, 140, 40, hl, hh); // dx

  


}






  
//--------------change head

  void eImageHD(float x, float y, float d, float dd) {
  
  if (imageMode == true) {
    // Draw the image instead of the ellipse 
    image(imghead, x-48, y-70, 100, 150);
  } else {
    fill(255, 0, 0, 255);
    ellipse(x, y, 120, 160);
  }
  
}

//-------------

  

//----------------------change TENTACLES
void eImage(float x, float y, float d, float dd) {
  
  if (imageMode == true) {
    // Draw the image instead of the ellipse 
    image(img, x - d/2, y - d/2 , d, d);
    speed = 0.8;
    hl = 60;
    hh = 80;
  } else {
    ellipse(x, y, d, d);
    speed = 0.1;
    hl = 55;
    hh = 34;

  } 
  
}




void keyPressed () {
  imageMode = !imageMode; 
}

