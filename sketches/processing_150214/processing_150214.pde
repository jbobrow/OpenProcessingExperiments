
float heightScale;
float widthScale;
int i;
float zoomlevel;
float dotscale;
float bx;
float by;
float xOffset = 0.0; 
float yOffset = 0.0; 
boolean drag = false;
String[] stuff;
String[] dates;
float[][] data;
color dotColor;
color dotColor1;
color dotColor2;
color backColor;
color backColorOpaque;
int timer;
int oldTime;
PFont font;
boolean initialise;
float sliderXPos;
float sliderYPos = height*15/16;
float sliderWidth = width/128;
float sliderHeight = height/32;
float maxX;
float maxY;
float fadeAmount = 150;

void setup() {
  initialise = true;
  size(600,400,P3D);
  sliderYPos = height*15/16;
  sliderWidth = width/128;
  sliderHeight = height/32;
 // The text from the file is loaded into an array. 
  stuff = loadStrings("data4.csv");
  data = new float[2][stuff.length];
  dates = new String[stuff.length];
  for (int i = 0; i < stuff.length; i ++ ) {
    dates[i] = split(stuff[i], ',')[0];
    data[0][i] = 100*float(split(stuff[i], ',')[1]);
    //println(float(split(stuff[i], ',')[0]));
    data[1][i] = 100*float(split(stuff[i], ',')[2]);
  }
  maxX = max(data[1]);
  maxY = max(data[0]);
  //widthScale = heightScale = float(ceil(max(maxX,maxY)))/height;
  widthScale = float(ceil(maxX))/width;
  heightScale = float(ceil(maxY))/height;
  dotColor1 = color(255,150,0);
  dotColor2 = color(255,150,255);
  zoomlevel = .77;
  dotscale = 0.02;
  backColorOpaque = color(50,30,90,255);
  background(0);
  oldTime = 0;
  timer = 20;
  //backColor = color(50,30,90,255);
  font = createFont("Georgia", int(width*24/1024));
  textFont(font);
}

void draw() {
  if (fadeAmount == 0 && i < stuff.length-1) {i += 1;}
  if (initialise == true) {
    timer = 255;
    initialise = false;
  } else {
    timer=int(millis()-oldTime)/100;
  }
  backColor = color(150,130,90,min(fadeAmount,timer+20));
  pushMatrix();
    translate(width*(1-zoomlevel)/2,height*(1-zoomlevel*1.1)/2);
    scale(zoomlevel);
    fill(backColor);
    noStroke();
    rect(-width,-height,width*4,height*4);
    dotColor=lerpColor(dotColor1,dotColor2,float(i)/float(stuff.length));
    strokeWeight(2);
    fill(dotColor);
    if (data[0][i] >= 2 && data[0][i] <=3){
      stroke(255);
    } else {
      stroke(dotColor);
    }
    ellipse(data[1][i]/widthScale,height-data[0][i]/heightScale,width*dotscale,width*dotscale);
    drawAxes();
  popMatrix();
  strokeWeight(1);
  fill(color(0));
  stroke(color(0));
  GradientRectangle(width/8,sliderYPos,width*6/8+sliderWidth/2-1,sliderHeight,dotColor1,dotColor2);
  fill(color(255));
  stroke(color(255));
  sliderXPos = float(i)/float(stuff.length)*width*6/8+width/8;
  rect(sliderXPos,sliderYPos,sliderWidth,sliderHeight);
  fill(0);
  textSize(22);
  text(dates[i],width*.48,sliderYPos+sliderHeight*.75);
  textSize(32);
}

void drawAxes() {
  strokeWeight(5);
  stroke(color(255));
  line(width,height,0,height);
  line(0,height,0,0);
  fill(255);
  text("inflation",-width/16,-height/20);
  text("growth",width-width/10,height+height/12);
  strokeWeight(3);
  text(0 + "%",-width/16,height+height/64);
  //ytics
  for (int z = 1; z < height*heightScale; z ++){
    z+=int(height*heightScale/9);
    text(z + "%",-width/16,height-z/heightScale+height/64);
    line(0,height-z/heightScale+height/128,width/64,height-z/heightScale+height/128);
  }
  //xtics
  for (int z = 1; z < width*widthScale; z ++){
    z+=int(width*widthScale/9);
    text(z + "%",z/widthScale-height/48,height+width/24);
    line(z/widthScale,height-width/64,z/widthScale,height);
  }
}
void mousePressed() {
  if (mouseY >= sliderYPos - sliderHeight && mouseY <= sliderYPos + sliderHeight*2) {
    bx = mouseX*8/6 - width/6;
    by = mouseY-yOffset;
    i = min(max(0,int(stuff.length*bx/width)),stuff.length-1);
  }
}
void mouseDragged() {
  if (mouseY >= sliderYPos - sliderHeight && mouseY <= sliderYPos + sliderHeight*2) {
    oldTime = millis();
    bx = mouseX*8/6 - width/6;
    by = mouseY-yOffset;
    i = min(max(0,int(stuff.length*bx/width)),stuff.length-1);
  }
}
void GradientRectangle(float x, float y, float xwidth, float yheight, color startC, color endC)
{
  for (int l = 0; l < xwidth; l++)
  {
    color sc = lerpColor(startC, endC, (float) l / (float) xwidth);
    stroke(sc);
    line(x + l, y, x + l, y + yheight);
  }
}

void keyPressed() {
  if (fadeAmount == 150) {
    fadeAmount = 0;
    i = 1;
  } else {
    fadeAmount = 150;
  }
}


