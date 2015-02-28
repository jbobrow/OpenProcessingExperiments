
float posX;
float posY;
float opp = 0.0;


void setup() {
  size(800, 600);
  background(0); 
  smooth();
}


void draw() {
  
 
  
   noStroke();
fill(0,0,0,0.03);
rect(0, 0, width, height);

 translate(0, -height/2);
 
 
  opp = opp + .01;
  float n = noise(opp) * width;
  float m = noise(opp) * height;
  
 for (int i=0; i<3000; i++){
  
   stroke (random(255),random(255),0, random(255));
  fill (0,0,0, random(127));
  posX = n;
  posY = m;
 ellipse (posX+i, posY+i, 20, 20);
  translate(opp, opp*i);
  rotate (180);
  }

}


