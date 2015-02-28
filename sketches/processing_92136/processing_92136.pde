

 
int var1;
int var2;
int int1;
int int2;


void setup() {
  size(600,600);
  background(2,1,7);
  frameRate(10);
}
void draw()
{
  
  smooth(10);
  pushMatrix();
  translate(300,300);
  rotate(mouseY);
  scale(1);
  
if (mousePressed){
noStroke();
  int var1 = (int) (random(width));
  int var2 = (int) (random(height));
  int int1 = (int) (random(width/2));
  int int2 = (int) (random(height/3));
  int opac = (int) (random(255));
  fill(var2,var1,int2,opac);
  ellipse(var1,var2,int1,int1);
  fill(0,0,0);
  ellipse(var2,var1,opac/30,opac/30);
  fill(255,255,255,15); // the opacity @x makes a disappearing background
  rect(0,0,width,height);
}
  
  fill(255,255,51);
  ellipse(0,0,50,50);
  fill(600, 70, 155);
  ellipse(150,125,50,50);
  fill(0,71,171);
  ellipse(50,50,50,50);
  fill(137,207,240);
  ellipse(60, 60, 50,50);
  fill(106,90,205);
  ellipse(25,25,50,50);
  fill(57,255,43);
  rect(35,35,50,50);
  fill(220,20,60);
  ellipse(80,80,50,50);
  fill(43,228,255);
  ellipse(65,65,50,50);
  fill(164,43,255);
  rect(75,75,50,50);
  fill(101,242,148);
  ellipse(95,95,50,50);
  fill(143,255,57);
  rect(100,100,50,50);
  fill(255,121,43);
  ellipse(120,120,50,50);
  fill(48,9,240);
  rect(130,130,50,50);
  fill(255,43,71);
  rect(150,150,50,50);
     popMatrix();
}



