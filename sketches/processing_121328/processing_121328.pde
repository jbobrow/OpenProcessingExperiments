

int huevariation = 20;
int numcircles = 3;
PImage logo; 
float firstd = 160;


void setup() {
  size(1920, 1080);
  frameRate(5);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER); 
  logo = loadImage("EDP_logo3.png");
}

void draw() {

  background(0);
  for (int i=0; i<numcircles; i++) {
    fill(huevariation+(i*10), 255, 255); 
    noStroke();
    int rectsizey = 1080 - (i*100); 
    int rectsizex = 1920 - (i*100);
    rect(960, 540, rectsizex,  rectsizey);
  }

  if (frameCount % 40 == 0) {
    huevariation = int(random(255)); 
    numcircles = int(random(3, 12));
  }


  image(logo, 0, 0, 1920, 1080);
  

  
  crazyLine(960, 540);
  crazyLine(800, 400);
  crazyLine(700, 300);
  crazyLine(1100, 700);
  crazyLine(400, 400);
  crazyLine(500, 500);
  crazyLine(1200, 900);
  crazyLine(1400, 200);
  crazyLine(1600, 400);
  crazyLine(1800, 700);
  
}

void crazyLine(float a, float b) {
  float x = a;
  float y = b;
  float d = firstd;
for (int j=0; j<50; j++) {
    
    float nextd = d*0.9;
    float z = random(6.28);
    stroke(255, 100);
    strokeWeight(7);
    line(x, y, x-(cos(z)*d/2)-(cos(z)*nextd/2),y-(sin(z)*d/2)-(sin(z)*nextd/2));
    x=x-(cos(z)*d/2)-(cos(z)*nextd/2);
    y=y-(sin(z)*d/2)-(sin(z)*nextd/2);
    d=nextd;
  }

}




