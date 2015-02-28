
float diam;
float x;
float y;






void setup () {
  size (600,500);
}


void draw () {
  diam =random (20);
  x = random(width);
  y = random(height);
  rect(x,y,diam,diam);

fill (random(255),random(255),random(255),random(255)); 

if (mousePressed) {
  fill(0);
}
  

}

