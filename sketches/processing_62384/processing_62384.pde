
float xPos = 180;
float yPos = 320;
float speed = 5;
float s;


float r;
float g;
float b;


void setup() {
  size(500, 500);
  smooth();
  background(0);

  //kit
  noStroke();
  fill(235);
  //quad(65, 280, 420, 280, 430, 350, 55, 350);
  //rect(70,270,360,40);


  //scheinwerfer
  fill(255, 255, 210); 
  rect(80, 290, 60, 30);

  fill(255, 255, 210); 
  rect(360, 290, 60, 30);


  //scheibe
  fill(160, 230, 230); 
  quad(150, 180, 350, 180, 390, 230, 110, 230);

  //reifen

  fill(55); 
  rect(370, 350, 40, 50);

  fill(55); 
  rect(90, 350, 40, 50);

  noStroke();

  //roterstreifen
  fill(255, 0, 0, 100); 
  rect(180, 320, 150, 15);
}

void draw() {
 
  PFont font;
  font = loadFont("Flareserif821BT-Bold-48.vlw"); 
  textFont(font, 20); 
  fill(r, g, 0, xPos);
  text("HOL MICH HIER", 170, 80);
  text("RAUS K.I.T.T", 180, 120);
  
  //lichtstreifen
  fill(255, 0, 0, 20); 
  rect(180, 320, 150, 15);

  r = random(255);
  g = random(255);
  b = random(255);

  xPos = xPos + speed * 0.8;
  fill(r, g, b);
  rect(xPos, yPos, 20, 15);

  if (xPos >= 310 || xPos <= 180) {
    speed = - speed;
  }
}

void mousePressed () {
saveFrame ("kitt.png");
  
}



