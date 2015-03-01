
PImage ziege;
PImage alpen;

void setup()
{
  smooth();
  size(500,500);
   ziege = loadImage("ziege.png");
   alpen = loadImage ("alpenwiese.jpg");
}

void draw ()
{
 
 if (mouseX>=150 && mouseX<=350 && mouseY >= 175 && mouseY <=375 && mousePressed == true)
 {
 if (mousePressed == true)
 
 {
   imageMode(CENTER);
  translate(width/2,height/2);
  //scale(-1+millis()/1000.0);
  image(alpen,0,0,600,500);
 image(ziege,0,50,200,250);
   noStroke();
   fill(255);
   ellipse(-75,-75,150,70);
   fill(0);
   textSize(25);
   text("Mäh!",-100,-68);
   
 }
}
else
{

  imageMode(CENTER);
  translate(width/2,height/2);
    image(alpen,0,0,600,500);
  //scale(-1+millis()/1000.0);
 image(ziege,0,50,200,250);
}}

  


