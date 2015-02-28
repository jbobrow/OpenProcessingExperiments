
float timer = 0.0;
float timerScalar = 20.0;


void setup(){
  size(500,500);
  colorMode(HSB,360,100,100,100);
  
  frameRate(60);
}

void draw() {

  
  
  for (int i=0; i< 400; i += 30) {
    for(int j = 0; j < 400; j += 10) {
      ellipse(i, j, i, 400);
      ellipse(j,i,500, j);
      fill(random(0,360),random(100),random(100));
    }
  }

  strokeWeight(random(10));
  stroke(random(0,360),100,100);
  float timer=0.0;

   float m = ( mouseY) /(20 +mouseX);
   float b = (350-mouseY) - (m * mouseX);
    
    for(int i=0; i<100; i++) {
      float x= random(50, mouseX);
      float y = m * x+b;
      fill(random(0,360),100,50);
      rect(x, y, random(100),random(100));
    }

 
 translate(mouseX,mouseY);
rotate(radians(18));
translate(160, mouseY);
noStroke();
fill(random(0, 159), 32, 50);
scale(1, 0.5);
triangle(150, 40, 120, 80, 30, 80);
 
translate(30,10);
noStroke();
fill(random(12, 226), 247, 100);
triangle(150, 40, 120, 80, 30, 80);
 
translate(mouseX, mouseY);
noStroke();
fill(random(0, 240), 12, 100);
triangle(150, 40, 120, 80, 30, 80);


      
}



