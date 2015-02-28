
PImage img;

void setup ()
{
size (3000,500); 
img = loadImage ("wolfy.png");
}

void draw ()
{
background (#6BE7FA);
fill (#008000);
rect (200,210,30,300);
rect (200,0,30,100);
rect (400,0,30,200);
rect (400,300,30,300);
rect (600,0,30,100);
rect (600,210,30,300);
rect (800,0,30,220);
rect (800,310,30,300);
rect (1000,0,30,100);
rect (1000,210,30,300);
image (img,mouseX, mouseY);  
 fill(#FAFA1E);
 textFont(createFont("SansSerif",100));
  textAlign(CENTER);

  //noLoop();
  text("FLAPPY NICKY", width/4, height/1);
}


