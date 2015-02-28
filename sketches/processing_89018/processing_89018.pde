
PImage img;
int x = 0;
int y = 0;
int ag = 0;
int speedx = 10;
int al = 100;
float yoff = 0.0;
void setup() {
  colorMode(HSB, 360, 100, 100); 
  size(1000, 1000);
  img = loadImage("poker.jpg");
 background(100, 100, 18, 20);
  imageMode(CENTER);

}
 
void draw() {
float n = noise(yoff)*random(-0.005,0.005);
  
  x+=speedx;
  if (x>200 || x<0)
  {
    speedx *= -1;
    y+=3+20*n;
    ag++;
    al -= 10;
  }
  if (al <0 || al>100)
  {
    al *= -10;
  }
  
  if (y>200)
  {
    y = 0;
    al += 1;
    ag-=1;
  }
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(ag);
  tint(255,al);
  image(img, x, y, 25, 40);
  popMatrix();
if(ag>12|| ag<0)
{

ag=0;
}





print(al);





  //frameRate(5);
}



