
//ALittlePot-20

PFont font1; // variabel för typsnitt1


PImage tree; // variabel för träden
PImage mario; //variabel för mario
PImage princess; //variabel för prinsessan
PImage bowser; //variabel för bowser
PImage yoshi; //variabel för yoshi
PImage svamp; //variabel för svamp

int marioXPos; // mario position i x-led
int marioYPos; // mario position i y-led


void setup()
{
size(520, 680); // storlek på fönster


font1 = loadFont("ALittlePot-20.vlw"); // läs in typsnitt


tree = loadImage("tree.jpg"); // läs in bild TRÄD
mario = loadImage("mario.png"); // läs in bild MARIO
princess = loadImage("princess.png"); // läs in bild PRINSESSA
bowser = loadImage("bowser.png"); // läs in bild BOWSER
yoshi = loadImage("yoshi.PNG"); // läs in bild YOSHI
svamp = loadImage("svamp.png"); // läs in bild SVAMP

int marioXPos; // Marios position i x-led
int marioYPos; // Marios position i y-led

marioXPos = width/4;
marioYPos = height/5;


frameRate(55); //  skärmuppdateringsfrekvensen
}


void draw()
{

background(255, 255, 255); // bakgrund




fill(137, 100, 21); //brun väg 1 färg
stroke(137, 100, 21); // brun väg 1 linje
rect(0, 150, 520, 40); // brun väg

fill(137, 100, 21); //brun väg 2 färg
stroke(137, 100, 21); // brun väg 2 linje
rect(80, 250, 440, 40); // brun väg

fill(137, 100, 21); //brun väg 3 färg
stroke(137, 100, 21); // brun väg 3 linje
rect(0, 350, 440, 40); // brun väg

fill(137, 100, 21); //brun väg 3 färg
stroke(137, 100, 21); // brun väg 3 linje
rect(0, 450, 520, 40); // brun väg

fill(137, 100, 21); //brun väg 3 färg
stroke(137, 100, 21); // brun väg 3 linje
rect(90, 550, 440, 40); // brun väg

fill(137, 100, 21); //brun väg rakt ner färg
stroke(137, 100, 21); // brun väg rakt ner linje
rect(230, 150, 60, 500); // brun väg rakt ner


fill(137, 100, 21); //brun väg till prinsessan färg
stroke(137, 100, 21); // brun väg till prinsessan linje
rect(230, 610, 200, 40); // brun väg till prinsessan


// träd gånger 2
image(tree, 190, 24);
image(tree, 42, 24);
image(tree, 350, 24);

//princess
image(princess, 450, 600);

//bowser
image(bowser, 5, 520);

//yoshi
image(yoshi, 445, 300);

//svamp
image(svamp, 5, 230);


fill(211, 62, 119);
textFont(font1); // ange att font1 skall användas för text
  
  // koordinaterna x:100 och y:20
text("Can Mario find his princess?", 100, 30);


if(keyPressed) // VALDA TANGENTER
{
  
  if(keyCode == LEFT) // ÅKER TILL VÄNSTER
{
marioXPos = marioXPos - 5; // VÄNSTER
}


if(keyCode == RIGHT) // ÅKER TILL HÖGER
{
marioXPos = marioXPos + 5; // HÖGER
}


if(keyCode == UP) // ÅKER UPP
{
marioYPos = marioYPos - 5; // UPPÅT
}


if(keyCode == DOWN) // ÅKER NER
{
marioYPos = marioYPos + 5; // NERÅT
}
  
  
}

image(mario, marioXPos, marioYPos); // Mariobild

}

