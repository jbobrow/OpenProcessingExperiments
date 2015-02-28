
//M. Kontopoulos
//Looping vertex disturbance animation
//Adding random values to the vertex points
PFont fontA;
float x, y;
float val;

void setup()
{
  size(800, 800);
  smooth();
  shapeMode(CENTER);
  fontA = loadFont("Uni-Sans-Heavy-48.vlw");
  //  myFont = createFont("Uni-Sans-Heavy", 72);
  textFont(fontA, 48);
  //frameRate(10); //Slow down the frame rate to 10 fps
  x = width/2;
  y = height/2;
}
void draw()
{
  //background(20);

  char letter;
  int counter;
  
  fill(0, 20);
  rect(0, 0, width, height);

  fill(255);
  noStroke();

  //Drawing the MK logo
  //Note how we're adding or substracing val from each point.
  //  beginShape();
  //  vertex(x-76-val, y+68+val);
  //  vertex(x-84-val, y-49-val);
  //  vertex(x-45-val, y-49-val);
  //  vertex(x-26-val, y-25-val);
  //  vertex(x-13-val, y-51-val);
  //  vertex(x+21+val, y-52-val);
  //  vertex(x+25+val, y+6+val);
  //  vertex(x+52+val, y-52-val);
  //  vertex(x+83+val, y-52-val);
  //  vertex(x+64+val, y-6-val);
  //  vertex(x+93+val, y+68+val);
  //  vertex(x+63+val, y+68+val);
  //  vertex(x+51+val, y+21+val);
  //  vertex(x+37+val, y+36+val);
  //  vertex(x+35+val, y+66+val);
  //  vertex(x+9+val, y+66+val);
  //  vertex(x-2-val, y-3-val);
  //  vertex(x-22-val, y+22+val);
  //  vertex(x-44-val, y+val);
  //  vertex(x-44-val, y+61+val);
  //  endShape(CLOSE);

  letter = 'P';
  text(letter, x-40-val, y-20-val);
  letter = 'O';
  text(letter, x-10-val, y+20+val);
  letter = 'S';
  text(letter, x+20+val, y-20-val);
  letter = 'T';
  text(letter, x+50+val, y+20+val);
  letter = 'A';
  text(letter, x-40-val, y+60+val);
  letter = 'N';
  text(letter, x-10-val, y+60+val);
  letter = 'A';
  text(letter, x+20+val, y+60+val);
  letter = 'L';
  text(letter, x+50+val, y+60+val);
  letter = 'O';
  text(letter, x+80+val, y+60+val);
  letter = 'G';
  text(letter, x+110+val, y+60+val);


  //select a new value for VAL for the next pass through the loop.
  //val = random(-400, 200); //uncomment this to make it an animation.
  val = map(mouseX, 0, width, -400, 200); //uncomment this to make it responsive to mouse
}

void mousePressed()
{
  saveFrame("scaling-##.tif");
}


