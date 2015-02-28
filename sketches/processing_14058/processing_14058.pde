
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;

PImage cupcakes;
PImage blank;
PImage sheep;

PImage city1;
PImage city2;
PImage castle;
PImage field;
PImage tacobell;

PFont mis;
PFont mist;

int x=-40;
int y=-90;

void setup() {
  size (640, 480);
  smooth();
  noLoop();
  
   a = loadImage("pic1.png");
   b = loadImage("pic2.png");
   c = loadImage("pic3.png");
   d = loadImage("pic4.png");
   e = loadImage("pic5.png");
   f = loadImage("pic6.png");
   
   cupcakes = loadImage("cupcakes.png");
   sheep = loadImage("sheep.png");
   
   city1= loadImage("city1.png");
   city2 = loadImage("city2.png");
   castle= loadImage("castle.png");
   field = loadImage("field.png");
   tacobell = loadImage("tacobell.png");
   
   mis = loadFont("Zapfino-25.vlw");
   mist = loadFont("Zapfino-36.vlw");
}

void draw(){
  
// backgrounds  
  
  int b= floor(random(1, 7));
  a = loadImage("pic"+ b + ".png");
  image(a, 0, 0);
  
  
//things in the sky

float r = random (1, 13);
if (r < 4)
{
  image(cupcakes, 0, 0); 
}
else if (r>9)
{
  image (sheep, x, y);
}

//buildings

float s = random (1, 120);
if (s <20)
{
  image(city1, x+s, y+s);
}
else if (s>100)
{
  image(city2, x+(s/10), y+(s/10));
}
else if (s>60)
{
  image(tacobell, 0-s/10, 0);
}


else if (s>40)
{
  image(field, x+(s/10), y+(s/10));
}

else if (s>20)
{
  image(castle, x+(s/10), y+(s/10));
}


else 
{
  image(blank, 0, 0);
}



//type

textFont(mis);
float t = random (0, 9);
if (t < 3){
  fill(0);
  text ("Come and visit...", 10+(t*5), 30+(t*5));
  fill(255);
   text ("Come and visit...", 8+(t*5), 28+(t*5));
}
else if (t < 5){
  fill(0);
  text("Take a trip to...", 10+(t*5), 30+(t*5));
  fill(255);
  text("Take a trip to...", 8+(t*5), 28+(t*5));
  
}
else if (t < 7){
  fill(0);
  text("Wish you were here!", 10+(t*5), 30+(t*5));
  fill(255);
  text("Wish you were here!", 8+(t*5), 28+(t*5));
}

else if (t < 9){
  fill(0);
  text("Stay a while in...", 10+(t*5), 30+(t*5));
  fill(255);
  text("Stay a while in...", 8+(t*5), 28+(t*5));
}
textFont(mist);
float u = random (0, 11);
if (u < 3){
  fill(0);
  text ("Canada", 470, 445);
  fill(255);
   text ("Canada", 468, 443);
}
else if (u < 5){
  fill(0);
  text("Shirt Island", 360, 445);
  fill(255);
  text("Shirt Island", 358, 443);
  
}
else if (u < 7){
  fill(0);
  text("Los Angeles", 365, 445);
  fill(255);
  text("Los Angeles", 363, 443);
}

else if (u < 9){
  fill(0);
  text("Sandwich City", 325, 445);
  fill(255);
  text("Sandwich City", 323, 443);
}

else if (u < 11){
  fill(0);
  text("Idaho", 395+(3*u), 445);
  fill(255);
  text("Idaho", 393+(3*u), 443);
}


}

///
void mousePressed(){
 redraw();
}

