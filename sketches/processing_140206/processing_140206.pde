
void setup()
{
  size(500, 500, P3D);
  background(#ffffff);
}

void draw()
//korok egyedul
{
  noFill();
ellipse(250, 250, 500, 500);
 
 if(frameCount % 100 == 0) {
  noFill();
ellipse(250, 375, 250, 250);
 }
 
 if(frameCount % 100 == 0) {
  noFill();
ellipse(250, 125, 250, 250);
 }
 
 if(frameCount % 200 == 0) {
  noFill();
ellipse(250, 62.5, 125, 125);
 }
 
 if(frameCount % 300 == 0) { 
  noFill();
ellipse(250, 31.25, 62.5, 62.5);
 }

if(frameCount % 400 == 0) {
  noFill();
ellipse(250, 15.875, 31.25, 31.25);
}

if(frameCount % 500 == 0) {
  noFill();
ellipse(250, 7.8125, 15.625, 15.625);
}

//vonalak egyedul

  if(frameCount % 50 == 0)
 {
  fill(#000000);
  line(0,250,500,250);
 }
  
 if(frameCount % 150 == 0) {
  fill(#000000);
  line(125,125,375,125);
}
 if(frameCount % 250 == 0) {
  fill(#000000);
  line(187.5,62.5,312.5,62.5);
}
 if(frameCount % 350 == 0) {
  fill(#000000);
  line(218.75,31.25,281.25,31.25);
 }
 if(frameCount % 450 == 0) {
  fill(#000000);
  line(234.125,15.625,265.875,15.625);
}
 if(frameCount % 550 == 0) {
  fill(#000000);
  line(242.1875,7.8125,257.8125,7.8125);
 }
 
 //sorozatok
 //vonalak
 
   if(frameCount % 150 == 0) {
  for(int i=0; i < 2; i++)
  {
  sorozategy(i / 100.0);
  }
}
 
   if(frameCount % 250 == 0) {
  for(int j=0; j < 4; j++)
  {
  sorozatketto(j / 100.0);
  }
}
 
   if(frameCount % 350 == 0) {
  for(int k=0; k < 8; k++)
  {
  sorozatharom(k / 100);
  }
}
 
  if(frameCount % 450 == 0) {
   for(int l=0; l < 16; l++)
  {
  sorozatnegy(l / 100);
  }
}
 
  if(frameCount % 550 == 0) {
   for(int m=0; m < 32; m++)
  {
  sorozatot(m / 100);
  }
}

 //korok
 
  if(frameCount % 200 == 0) {
  for(int n=0; n < 4; n++)
 {
  korsorozategy(n / 100);
  }
}
  
  if(frameCount % 300 == 0) {
  for(int o=0; o < 8; o++)
 {
  korsorozatketto(o / 100);
  }
}

  if(frameCount % 400 == 0) {
  for(int p=0; p < 16; p++)
  {
  korsorozatnegy(p / 100);
 }
}

  if(frameCount % 500 == 0) {
  for(int q=0; q < 32; q++)
    {
    korsorozatot(q / 100);
    }
 }
}


//vonalak

void sorozategy (float vonal)
{
  translate(0,250);
  pushMatrix();
  fill(#000000);
  line(125,125,375,125);
  popMatrix();
}


void sorozatketto (float vonal)
{
  translate(0,125);
  pushMatrix();
  fill(#000000);
  line(187.5,62.5,312.5,62.5);
  popMatrix();
}


void sorozatharom (float vonal)
{
  translate(0,62.5);
  pushMatrix();
  fill(#000000);
  line(218.75,31.25,281.25,31.25);
  popMatrix();
}


void sorozatnegy (float vonal)
{
  translate(0,31.25);
  pushMatrix();
  fill(#000000);
  line(234.125,15.625,265.875,15.625);
  popMatrix();
}


void sorozatot (float vonal)
{
  translate(0,15.625);
  pushMatrix();
  fill(#000000);
  line(242.1875,7.8125,257.8125,7.8125);
  popMatrix();
}

//korok
void korsorozategy (float kor)
{
  translate(0,125);
  pushMatrix();
  noFill();
  ellipse(250,62.5,125,125);
  popMatrix();
}

void korsorozatketto (float kor)
{
  translate(0,62.5);
  pushMatrix();
  noFill();
  ellipse(250,31.25,62.5,62.5);
  popMatrix();
}

void korsorozatnegy (float kor)
{
  translate(0,31.25);
  pushMatrix();
  noFill();
  ellipse(250,15.875,31.25,31.25);
  popMatrix();
}

void korsorozatot (float kor)
{
  translate(0,15.625);
  pushMatrix();
  noFill();
  ellipse(250,7.8125,15.625,15.625);
  popMatrix();
}

