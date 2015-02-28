
float theta = 0.0;
float colorR;
float colorG;
float colorB;

void setup() {
 size(800,800);
smooth();
}

void draw() {
 background(255);

theta += 0.02;

noStroke();
//fill(random(5), random(203), random(255));
 colorR = random(255); //declare eye colors
  colorG = random(255);
  colorB = random(255);
  fill(colorR, colorB, colorG);



float x = theta;

for (int i = 0; i <= 200; i++) {
 float y = sin(x)*height/2;

ellipse(i*5,y+height/2,60,60);

x += 40.2;
}

}



