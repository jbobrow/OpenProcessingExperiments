
float counter = 0;

void setup() {
  colorMode(HSB);
size(500,500);
background(0);
}

void draw() {
  float maus=map(mouseX,0,width,0.05,0.2);
  background(maus);
  float bewebung=map(sin(counter),-1,1,0,360);
 fill(bewebung);
noStroke();
quad(0,0,500,0,250,250,250,250);
quad(250,250,250,250,0,500,500,500);

ellipse(250,250,100,70);

counter+=maus;
  
  
}
