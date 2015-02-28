
PImage[] images;
int imageSize = 80;

float minRadius = 200;
float maxRadius = 300;

float pulseDur = .005;

PImage[] sirens;

String shock = "SHOCK";

void setup()
{
  size(800, 600);
  textFont(createFont("Arial-BoldItalicMT", 48));
  textAlign(CENTER, CENTER);
  
  noStroke();
  background(255);
  
  imageMode(CENTER);
  
  images = new PImage[12];
  images[0] = loadImage("Bachmann.png");
  images[1] = loadImage("Biden.png");
  images[2] = loadImage("Boehner.png");
  images[3] = loadImage("Cantor.png");
  images[4] = loadImage("Clinton.png");
  images[5] = loadImage("Kerry.png");
  images[6] = loadImage("McConnell.png");
  images[7] = loadImage("Obama.png");
  images[8] = loadImage("Palin.png");
  images[9] = loadImage("Pelosi.png");
  images[10] = loadImage("Reid.png");
  images[11] = loadImage("Romney.png");
  
  sirens = new PImage[4];
  sirens[0] = loadImage("siren1.png");
  sirens[1] = loadImage("siren2.png");
  sirens[2] = loadImage("siren3.png");
  sirens[3] = loadImage("siren4.png");
}

void draw()
{
  fill(255, 45);
  rect(0, 0, width, height);
  
  fill(0);
  
  float txtSize = map(sin(millis() * pulseDur * 2), -1, 1, 0, 1);
  txtSize = pow(txtSize, 2);
  textSize(lerp(64, 32, txtSize));
  
  text(shock, width/2, height/2);
  
  translate(width / 2, height / 2);
  for (int i = 0; i < images.length; i++)
  {
    pushMatrix();
    
    float theta = (i * PI * 2) / images.length;
    theta += sin(millis() * pulseDur * .25);
    
    float rad = map(cos(millis() * pulseDur), -1, 1, minRadius, maxRadius);
    
    translate(rad * cos(theta), rad * sin(theta));
    
    if ((sin(millis() * pulseDur) < 0 && i % 2 == 0) ||
        (cos(millis() * pulseDur) < 0 && i % 2 == 1))
      scale(-1, 1);
    
    image(images[i], 0, 0, imageSize, imageSize);
    
    popMatrix();
  }
  
  drawSiren(-150, 0);
  drawSiren(150, 0);
}

void drawSiren(float x, float y)
{
  float floatIndex = map(sin(millis() * pulseDur * 2), -1, 1, 0, 1);
  int index = (int)(floatIndex * 4);
  
  constrain(index, 0, 3);
  
  image(sirens[index], x, y, 90, 90);
}


