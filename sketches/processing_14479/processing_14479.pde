
float xamp, yamp, x, y, px, py;

void setup(){
 size(400, 400);
 smooth();
 xamp = 120;
 yamp = 60;
 background(20);
}

void draw(){
  px = x;
  py = y;
  pushMatrix();
  translate(width/2, height/2);

  float m = (float)millis()/100 + PI;
  //m %= TWO_PI*2;
  x = cos(m/2)*xamp;
  y = sin(m/1)*yamp;
  
  x += (noise(m/4) - 0.5) * 40;
  y += (noise(m/4 - 200) - 0.5) * 40;
  
  stroke(255);
  strokeWeight(3);
  line(px, py, x, y);
  popMatrix();
  velo();
}

void velo(){
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
}


