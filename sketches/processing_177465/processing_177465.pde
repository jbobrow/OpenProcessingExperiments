
PImage Hintergrund;
PImage Kopflos;
PImage Kopf;

void setup()
{
size (760,500);
Hintergrund = loadImage("Hintergrund.jpg");
Kopflos = loadImage("Kopflos.jpg");
Kopf = loadImage("Kopf.png");

}

void draw()

{

if ( mousePressed  == true) 
{
pushMatrix();
translate(width/2, height/2);
imageMode(CENTER);
tint(237,69,69);
image(Kopflos, 0,0);
popMatrix();

pushMatrix();
translate(300, 255);
rotate(radians(-130));
imageMode(CENTER);
image(Kopf,0,0);
popMatrix();

pushMatrix();
noStroke();
translate(300,270);
rectMode(CENTER);
fill(255,255,255);
rect(0,0,30,5);
rotate(radians(90));
rect(0,0,30,5);
popMatrix();

pushMatrix();
noStroke();
translate(270,240);
rectMode(CENTER);
fill(255,255,255);
rect(0,0,30,5);
rotate(radians(90));
rect(0,0,30,5);
popMatrix();

pushMatrix();
translate(520, 160);
rectMode(CENTER);
fill(0,0,0);
rect(0,0, 130, 40);
textSize(30);
fill(255,255,255);
text("zensiert",-60,10);
popMatrix();
noTint();
}

else
{
pushMatrix();
translate(width/2, height/2);
imageMode(CENTER);
image(Hintergrund, 0,0);
popMatrix();

pushMatrix();
translate(510, 90);
fill(255,255,255);
ellipse(0,0, 30,30);
fill(0,0,0);
ellipse(0,0, 10,10);
popMatrix();

pushMatrix();
translate(550, 90);
fill(255,255,255);
ellipse(0,0, 30,30);
fill(0,0,0);
ellipse(0,0, 10,10);
popMatrix();

}



}












