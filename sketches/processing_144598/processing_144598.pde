
PImage picture;
void setup(){
  frameRate(8);
  picture=loadImage("final.png");
  tint(0,153,204,200);
  size(720,831);
}

void draw() {
  background (252, 152, 84);
  stroke(noise(0),30);
  for (int i = 0; i < 850; i++)
  {
    float b = random (3);
    strokeWeight(b);
    float offset = b * 5;
    line (i, 900, i+offset, 0);
}
  noStroke();
  for(int y = 0; y < 800; y += 10)
  {
  for (int x = 0; x < 800; x += 10)
    {
      fill ((x+y) * 0.5,0,10,210);
      rect(x,y,0,0);
}
}
  
  noStroke();
  fill(252,191,150);
  rect(245,0,240,840);
  
  
  image(picture,0,0);
  filter(POSTERIZE, 8);

}


