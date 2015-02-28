


void createseed() {
  //create random coordinates for first DNA
  x1 = random(5,sourceimg.width+4);
  y1 = random(sourceimg.height+9,2*sourceimg.height+8);
  x2 = random(5,sourceimg.width+4);
  y2 = random(sourceimg.height+9,2*sourceimg.height+8);
  x3 = random(5,sourceimg.width+4);
  y3 = random(sourceimg.height+9,2*sourceimg.height+8);
  
  //create random fill color and define alpha
  r = random(1,255);
  g = random(1,255);
  b = random(1,255);
  a = 50;  //opacity should this go up?
}
 
int checkimage() {
  float rerr, gerr, berr, error;
  int fit = 0;
 
  //load pixels from artwork
  loadPixels();
 
  //pull location and color information from the images
  for (int x = 0; x < sourceimg.width; x++) {
    for (int y = 0; y < sourceimg.height; y++) {
      int loc = x + y*sourceimg.width;
      int destloc = x + (y+(2*sourceimg.height+9))*sourceimg.width+4;
      int comploc = x + (y+(sourceimg.height+4))*sourceimg.width+4;
      color sourcepix = sourceimg.pixels[loc];
      color comparepix = pixels[comploc];
 
      //find the error in color (0 to 255, 0 is no error)
      rerr = abs(red(sourcepix)-red(comparepix));
      gerr = abs(green(sourcepix)-green(comparepix));
      berr = abs(blue(sourcepix)-blue(comparepix));
      error = (rerr+gerr+berr)/3;
      fit += error;
    }
  } 
  return fit;
}
 
 
void readDNA() {
  //save current generation's parameters into DNA array
  for (int j = 0; j < polyArray.length; j++) {
    DNA[0][j] = polyArray[j].x1;
    DNA[1][j] = polyArray[j].y1;
    DNA[2][j] = polyArray[j].x2;
    DNA[3][j] = polyArray[j].y2;
    DNA[4][j] = polyArray[j].x3;
    DNA[5][j] = polyArray[j].y3;
    DNA[6][j] = polyArray[j].r;
    DNA[7][j] = polyArray[j].g;
    DNA[8][j] = polyArray[j].b;
    DNA[9][j] = polyArray[j].a;
  }
}
 
void seedDNA() {
  //load parameters from DNA into use
  for (int j = 0; j < polyArray.length; j++) {
    polyArray[j].x1 = DNA[0][j];
    polyArray[j].y1 = DNA[1][j];
    polyArray[j].x2 = DNA[2][j];
    polyArray[j].y2 = DNA[3][j];
    polyArray[j].x3 = DNA[4][j];
    polyArray[j].y3 = DNA[5][j];
    polyArray[j].r = DNA[6][j];
    polyArray[j].g = DNA[7][j];
    polyArray[j].b = DNA[8][j];
    polyArray[j].a = DNA[9][j];
  }
}

class Polygon{
  float x1, y1, x2, y2, x3, y3, r, g, b, a;

Polygon(float x1_, float y1_, float x2_, float y2_, float x3_, float y3_, float r_, float g_, float b_, float a_){
  x1=x1_;
  y1=y1_;
  x2=x2_;
  y2=y2_;
  x3=x3_;
  y3=y3_;
  r=r_;
  g=g_;
  b=b_;
  a=a_;
}

void mutate(){
  //randomize parameters, constrain values with in square
  x1=constrain(x1*random(0.9,1.1),4,sourceimg.width+4);
  y1=constrain(y1*random(0.9,1.1),sourceimg.height+9,2*sourceimg.height+9);
  x2=constrain(x2*random(0.9,1.1),4,sourceimg.width+4);
  y2=constrain(y2*random(0.9,1.1),sourceimg.height+9,2*sourceimg.height+9);
  x3=constrain(x3*random(0.9,1.1),4,sourceimg.width+4);
  y3=constrain(y3*random(0.9,1.1),sourceimg.height+9,2*sourceimg.height+9);

  r=constrain(r*random(0.7,1.3),1,255);
  g=constrain(g*random(0.7,1.3),1,255);
  b=constrain(b*random(0.7,1.3),1,255);

//  ra*=random(0.9,1.1); 
}

void display(){
  //draw polygon on screen based on parameters
  fill(r,g,b,a);
  triangle(x1, y1, x2, y2, x3, y3);
}

}

PImage sourceimg;
PFont font;
int gen, fitness, lastfitness, i;
float x1, y1, x2, y2, x3, y3, r, b, g, a;
Polygon[] polyArray = new Polygon[75];
float[][] DNA = new float[10][polyArray.length];
 
void setup() {
  //load work  to be replicated
  sourceimg = loadImage("AG.jpg");
  
  //setup size based on dimentions of source image
  size (sourceimg.width+8, sourceimg.height*2+44);
  background(255);
  noStroke();
  smooth();
  
  //display art work on top
  image(sourceimg,4,4);
  sourceimg.loadPixels();
  
  //load font for feedback text
  font = loadFont("DIN-Medium-14.vlw");           
  textFont(font,12);
  
  //create random DNA for first generation
  for (int i = 0; i < polyArray.length; i++) { 
    createseed();  
    polyArray[i] = new Polygon(x1, y1, x2, y2, x3, y3, r, b, g, a);
  }
  //save initial triangle DNA and check fitness
  readDNA();
  lastfitness = checkimage();
}
 
void draw() {
  //display replication round count
  fill(0);
  rect(6,2*sourceimg.height+16, sourceimg.width-2,20);
  fill(255);
  text("NUMBER OF REPLICATIONS: " + gen, 16, 2*sourceimg.height+30);
 
  //mutate one triangle per cycle
  polyArray[i].mutate();
  fill(255);
  rect(4,sourceimg.height+9,sourceimg.width,sourceimg.height);
  for(int j=0; j<polyArray.length; j++) {
    polyArray[j].display();
  }
  if (i<polyArray.length-1) { 
    i++;
  }
  else {
    //reset counter and increment generation count
    i=0;
    gen++;
  }
  //check the fitness of new population, how well does shape fit? is the color closer?
  fitness = checkimage();
  //if the new generation of DNA is more viable than the last save DNA, if not reseed last DNA
  if (fitness < lastfitness) {
    readDNA();
    lastfitness = fitness;
  }
  else {
    seedDNA();
  }
}



