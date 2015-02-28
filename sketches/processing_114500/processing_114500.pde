
float brightness, m, counter = 0;
int[] x = {74,161,163,192,173,173,180,197, 
215,196,186,193,203,216,206,205,197,215,158,158,74,74};
int[] y = {336,300,270,255,277,301,306,294,295,
300,313,320,307,312,314,315,325,350,383,358,358,336};
int[] xx = {74,160,158,85,74};
int [] yy = {358,358,383,375,358};
int[] xxx = {-96,12,47,84,124,146,230,265,287,336,375,347,500};
int[] yyy = {480,104,239,121,216,309,120,74,224,178,287,82,505};
int[] xxxx = {74,160,158,85,74};
int [] yyyy = {358,358,383,375,358};
int wig = 318;
int directionY = 10;
int num = 50;
int[] c = new int[num];
int[] d = new int[num]; //I am running out of variables


void setup()
{
  size(400,500);
  smooth();
  colorMode(HSB, 360,100,100);
}

void draw()
{
  counter = counter + 0.167;
  brightness = brightness + 1;
  if(brightness >= 100)
  {
    brightness = 0;
  }
  
  if(counter > 0)
  {
    drawGradient();
  }
  //background
  beginShape();
  for (int i = 0; i < xxx.length; i++)
  {
    strokeWeight(3);
    fill(#1A130D);
    vertex(xxx[i],yyy[i]);
  }
  endShape();
  fill(#362B25);
  strokeWeight(3);
  ellipse(191,474,460,246);
  fill(#1A130D);
  triangle(298,438,357,438,327,388);
  triangle(218,479,279,479,249,428);
  triangle(24,438,54,389,83,438);
  triangle(92,476,150,476,122,426);
  m = m + .6;
   if ( m > 400)
  {
    m = 0;
  }
  noStroke();
  fill(#DEDEDE,100);
  ellipse(m, 50, 200,60);
  ellipse(m+50, 80, 150, 60);
  ellipse(m+200, 20, 100, 20);
  ellipse(m-100,100, 80,30);
  ellipse(m+300, 150,200, 50);
  ellipse(m+280, 130, 150, 60);
 
  
  //dragon
  stroke(#63D825);
  strokeWeight(20);
  noFill();
  bezier(146,182,280,160,248,290,248,290);
  noStroke();
  fill(#409B0C);
  ellipse(203,wig,147,161);
  if(wig < 310 || wig > 320)
  {
    directionY = directionY * -1;
  }
  wig = wig + directionY;
  noStroke();
  fill(#7C7C7C);
  triangle(160,203,160,159,124,183);
  fill(#63D825);
  triangle(120,230,157,286,73,273);
  triangle(265,238,231,289,322,265);
  fill(#FBFF89);
  ellipse(175,393,33,21);
  ellipse(233,393,33,21);
  beginShape();
  for (int i = 0; i < xx.length; i++)
  {
    noStroke();
    fill(#FBFF89);
    vertex(xx[i],yy[i]);
  }
  endShape();
  beginShape();
  for (int i = 0; i < x.length; i++)
  {
    fill(#63D825);
    vertex(x[i],y[i]);
  }
  endShape();
  fill(#FFFFFF);
  ellipse(156,324,25,25);
  fill(#000000);
  float a = constrain(mouseX, 150, 160);
  float b = constrain(mouseY, 320, 330);
  ellipse(a,b,15,15);

// actions
if((mousePressed == true) && ((mouseX > 74) && (mouseX < 160) && (mouseY >340) && (mouseY < 383)))
{ 
  
  beginShape();
  for (int i = 0; i < xxxx.length; i++)
  {
    noStroke();
    fill(0);
    vertex(xxxx[i],yyyy[i]); 
  }
  endShape();
    pushMatrix();
    translate(159,357);
    rotate(radians(160));
    fill(#FBFF89);
    rect(0,0,80,-35);
    popMatrix();
    
  for(int i = num-1; i > 0; i--) //fire!
  {
    c[i] = c[i - 1];
    d[i] = d[i - 1];
  }
  fill(0,100,100,102);
  c[0] = mouseX;
  d[0] = mouseY;
  for(int i = 0; i < num; i++)
  {
    ellipse(c[i],d[i], i/2.0, i/2.0);
  }
}
noStroke();
if((mousePressed == true) && ((mouseX >124 ) && (mouseX < 160) && (mouseY >159) && (mouseY < 203)))
{
  fill(random(360),random(100),random(100));
  triangle(160,203,160,159,124,183);
}
if((mousePressed == true) && ((mouseX >298 ) && (mouseX < 357) && (mouseY > 388) && (mouseY < 438)))
{
  for (int i = 0; i < 400; i ++)
  {
    stroke(random(360));
    point(i,i);
  }
}
if((mousePressed == true) && ((mouseX > 218 ) && (mouseX < 279) && (mouseY > 428) && (mouseY < 479)))
{
  for (int i = 0; i < 400; i++)
  {
    stroke(random(360));
    line(i,0,i,height);
  }
}
if((mousePressed == true) && ((mouseX >24 ) && (mouseX < 83) && (mouseY > 389) && (mouseY < 476)))
{
  for (int i = 0; i < 100; i ++)
  {
    fill(random(360),random(100),random(100));
    rect(0, i, width, i);
  }
}
if((mousePressed == true) && ((mouseX >92 ) && (mouseX < 150) && (mouseY > 426) && (mouseY < 476)))
{
  for (int i = 0; i < 400; i ++)
  {
    fill(#0343FF,80);
    ellipse(i*100,250,100,100);
  }
}
if((mousePressed == true) && ((mouseX >140) && (mouseX < 170) && (mouseY > 310) && (mouseY < 340)))
{
  fill(224,random(100),random(100));
  ellipse(156,324,25,25);
}
}

void drawGradient()
{
  for (int i = 0; i < height; i ++)
  {
    float percent = i/(float)height;
    stroke(0,100,brightness*percent);
    line(0,i,width,i);
  }
}


