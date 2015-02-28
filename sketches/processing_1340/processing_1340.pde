
final static int screenW = 800;
final static int screenH = 400;
final int blockSize = 25;
int maxW = int(screenW/blockSize);
int maxH = int(screenH/blockSize);
int towers[] = new int[maxW];
int bridges[] = new int[maxH];
int offset1 = 3;
int offset2 = 3;

int color1 = color(88,152,219);
int color2 = color(175,194,214);

int baseR1 = 88;
int baseG1 = 152;
int baseB1 = 219;
int spreadR1 = 10;
int spreadG1 = 10;
int spreadB1 = 10;
int adjust1 = 120;

int baseR2 = 175;
int baseG2 = 194;
int baseB2 = 214;
int spreadR2 = 20;
int spreadG2 = 20;
int spreadB2 = 10;
//int adjust2 = 50;

PImage backStore;

void setup() 
{
  size(screenW, screenH);
  background(255);
  noStroke();
  frameRate(60);
  backStore = new PImage(screenW, screenH);
  strokeWeight(4);
  tint(255, 100);
  //smooth();
  reset();
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxH);
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxW);
  backStore = get();
}


void draw()
{
  translate(width, height);
  rotate(0.003);
  translate(-width, -height);
  translate(-1,1);
  image(backStore, 0, 0, width + 4, height + 4);
  int adder = int(random(maxW - 2));
  int adder2 = int(random(maxH - 2));

    
  
  towers[adder] += random(1, 4);
  towers[adder+1] += random(1, 4);
  towers[adder+2] += random(1, 4);
  
  
  bridges[adder2] += random(1, 4);
  bridges[adder2 + 1] += random(1, 4);
  bridges[adder2 + 2] += random(1, 4);
  
  
  if (towers[adder] > maxH || mousePressed)
  {
     reset();
     
  }
  
   //bridges
  for(int index = 0; index < maxH; index++)
  {
    for(int countUp = 0; countUp < bridges[index]; countUp++)
    {
      fill(color2);
      rect(width - blockSize * countUp, offset2 + blockSize * index, blockSize - 3, blockSize - 3);
    }
  }
  
  //slashes  
  for(int ii = 0; ii < 2; ii++) slash();
 
  
  //towers
  for(int index = 0; index < maxW; index++)
  {
    for(int countUp = 0; countUp < towers[index]; countUp++)
    {
      fill(color1);
      rect(offset1 + blockSize * index, height - blockSize * countUp, blockSize - 3, blockSize - 3);
    }
  }
  
  
  
  image(backStore, 0, 0, width + 4, height + 4);
  backStore = get();
  
}

void reset()
{
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxH / 4);
   for(int ii = 0; ii < bridges.length; ii++) bridges[ii] = (int)random(maxW / 4);
   
   //colour-choosing algorithm - pick two colours not too far from the base colours, and make sure they're apart tonally. 
   int adjust = (int)random(adjust1/2, adjust1);
   if(random(1.0) < 0.5) adjust *= -1;
   
   color1 = color(random(baseR1 - spreadR1, baseR1 + spreadR1) + adjust, random(baseG1 - spreadG1, baseG1 + spreadG1)+ adjust, random(baseB1 - spreadB1, baseB1 + spreadB1)+ adjust);
   adjust = -adjust;
   color2 = color(random(baseR2 - spreadR2, baseR2 + spreadR2)+ adjust, random(baseG2 - spreadG2, baseG2 + spreadG2)+ adjust, random(baseB2 - spreadB2, baseB2 + spreadB2)+ adjust);
   
   backStore = get();
   offset1 = (int)random(5);
   offset2 = (int)random(5);
   fill(255,255, 135);
   ellipse(random(width/2), random(height/2), random(300,500), random(20));
   ellipse(random(width/2), random(height/2), random(300,500), random(20));
   ellipse(random(width/2), random(height/2), random(300,500), random(20));
   slash();
   slash();
   slash();
   float rnd = random(1.0);
   //println(rnd);
   if(rnd < 0.1)
   {
     background(255);
     backStore = get();
   }   
}

void slash() 
{
  int startX = (int)random(width);
  int stopX = startX - (int)random(width/2);
  stroke(random(255));
   line(startX, 0, stopX, height);
   noStroke();
}

