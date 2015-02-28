
int card = 0;
int x = 570;
int y = 300;
int w = 70;
int h = 70;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img5;
PImage img6;

void setup() {
  size(600, 600);
  smooth();
  stroke(255);
  img = loadImage("pic.png");
  img1 = loadImage("clud.png");
  img3 = loadImage("btfy.png");
  img5 = loadImage("sky.png");
  img6 = loadImage("flw2.png");
  img2 = loadImage("flw.png");
}

void draw() {

  noStroke();

  if (card == 0) {
    background(255);
    smooth();
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  }  
  else if (card == 1) {
    background(255);
    smooth();
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    image(img1, 400,440, 400,320);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  } 
  else if (card  == 2) {  
    background(255);
    smooth();
    image(img5, 300,290, 362,470);
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    image(img1, 400,440, 400,320);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  }
  else if (card  == 3) { 
    background(255);
    smooth();
    image(img5, 300,290, 362,470);
    image(img2, 300,300, 100,100);
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  }
  else if (card  == 4) {  
    background(255);
    smooth();
    image(img5, 300,290, 362,470);
    image(img6, 310,355, 320,320);
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  } 
  else if (card  == 5) {  
    background(255);
    smooth();
    image(img5, 300,290, 362,470);
    image(img6, 310,355, 320,320);
    image(img3, 300,300, 100,100);
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    triangle(562,290,562,310,582,300);
  } 
  else if (card  == 6) {  
    background(255);
    smooth();
    image(img5, 300,290, 362,470);
    image(img6, 310,355, 320,320);
    photuris(350,100,0.3,235,162,97);
    photuris(370,300,0.4,235,162,97);
    photuris(230,80,0.8,248,248,169);
    photuris(100,120,1.2,249,139,247);
    image(img, 300,300, 600,600);
    imageMode(CENTER);
    fill(255, 255, 100);
    stroke(255,100,100);
    ellipse(x, y, 40, 40);
    fill(255,100,100);
    ellipse(x,y,20,20);
  }
}


void mousePressed() {  

  if (card == 0) {  

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 4;
    }
    else card = 3;
  }  
  else if (card == 4) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 5;
    }
    else card = 4;
  }  
  else if (card == 5) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 6;
    }
    else card = 5;
  } 
  else if (card == 6) {
    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 0;
    }
    else card = 6;
  }
}

void photuris(int x, int y, float s, int r, int g, int b) {
  pushMatrix();
  translate(x,y);
  scale(s);
  smooth();
  noStroke();
  fill(r,g,b);
  ellipse(140,220,80,80);
  ellipse(60,220,80,80);
  ellipse(125,270,50,50);
  ellipse(75,270,50,50);
  fill(100,80,60);
  ellipse(100,195,30,30);
  ellipse(100,220,30,30);
  ellipse(100,260,30,70);
  stroke(5);
  line(100,180,70,140);
  line(100,180,130,140);
  popMatrix();
}


