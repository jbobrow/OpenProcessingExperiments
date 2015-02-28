
float x = 300;
float y = 200;
float speed = 4;

boolean gr = true;
  PImage duck;
void setup() {
  size(600,600);

 //Font
String[] fontList = PFont.list();
println(fontList);
}

void draw() 
{
  background (256,256,256);
  
  //rect1
  fill(0);
  rect(0,200,600,50);
  rect(300,100,300,20);
  rect(0,450,300,20);
  
 

fill(250,0,0);
createFont("Verdana", 50);
  textSize(30);
  text("Devil Ducky", random(width), random(height));

  //photo

  duck = loadImage("duckie.jpg");
  image(duck,300,300);
  
  //red ball
  smooth();
   noStroke();
   fill(240,10,0); 
  ellipse(x,y,50,50);

  //
  if (gr == true)
  {
    x = x + speed;
  }
  if (gr == false)
  {
    x = x - speed;
  }
if(x>600)
{
gr=false;
}

if(x<0)
{
gr=true;
} 
 

}



