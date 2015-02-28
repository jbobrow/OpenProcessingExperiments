
PImage bg;
int a; 

void setup() 
{
  size(400,419);
  frameRate(15);
  smooth();
  bg = loadImage("flattened.jpg");
}

void draw() 
{
  background(bg);

  a = (a + 1)%(width+102);
  fill(129,100,100,80);
  rect(115,50,100,80);
  rect(25,350,50,20);
  fill(207,196,211,200);
  rect(250,120,40,100);
  rect(300,20,15,15);
  rect(250,120,40,100);
  fill(207,196,211,200);
  rect(250,120,40,100);
  noStroke();
  fill(255,230);
  rect(0, a, 600, 600);
  
  

}

