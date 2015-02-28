
//Collage

PImage pom;
PImage nutella;
PImage barbie;
PImage alf;
PImage crayony;
PImage greencrayon;
PImage redcrayon;
PImage luigi;
PImage mario;
PImage stars;
PImage grass;
PImage legoy;
PImage legob;
PImage legor;
PImage lays;




void setup()

{
size (900, 700);
smooth();
pom = loadImage( "POM.png" );
nutella = loadImage ("nutella.png");
barbie = loadImage ("barbie.png");
alf = loadImage ("alf.png");
mario = loadImage ("mario.png");
luigi = loadImage ("luigi.png");
lays = loadImage ("lays.png");
crayony = loadImage ("crayony.png");
greencrayon = loadImage ("green-crayon.png");
redcrayon = loadImage ("redcrayon.png");
stars = loadImage ("stars.png");
grass = loadImage ("grass-copy.png");
legoy = loadImage ("legoy.png");
legob = loadImage ("legoblue.png");
legor = loadImage ("lego.png");




}

void draw ()
{
 background (255);
float x= random(width);
float y= random(height);
float d= random(15, 40);
float i= random(600, 900);


image(stars, 0, 0, width+d, height-d);
image(grass, 0, 300, width, height/2+100);
image(legob, 10, 450, 130, 70);
image(legor, 15, 430, 60, 50);
image(legoy, 40, 430, 100, 50);
image(barbie, x/2-20, 350, 60, 170);
image(alf, 0, 470, 70, 100);
image(alf, 150, 420, 70, 100);
image(alf, 110, 500, 70, 100);
image(nutella, 350, y/2+330, 150, 200);
image(nutella, 300, y/2+360, 150, 200);
image(nutella, 220, y/2+430, 150, 200);
image(lays, 330, y/2+400, 180, 250);
image(luigi, 380, y/2+330, 315, 385);
image(crayony, 650, 300, 50, 250);
image(greencrayon, 720, 290, 70, 310);
image(redcrayon, 800, 300, 50, 250);
image(pom, i, 520, 120, 124);
image(mario, 710, 280, 75, 75);



image(mario, 50, 100, d, d);
image(mario, 250, 70, d+5, d+5);
image(mario, 200, 250, d, d);
image(mario, 650, 170, d+5, d+5);
image(mario, 800, 70, d, d);

frameRate (2);



}

