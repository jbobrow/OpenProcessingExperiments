
void setup() {
 size(600,400);
 background(255);
 smooth();
 frameRate(10);
}

void draw() {
       filter(BLUR,0.55);
  float R = random(0,255);
  float G = random(0,255);
  float B = random(0,255);
  float largeur = random(60,160);
  strokeWeight(largeur);
  float alpha = random(100,255);
  stroke(R,G,B,alpha);
  float y = random(100,300);
 line(random(100,500),y, random(100,500),y);
}

