
 Catepillar c;
void setup() { 
  size(307,449);
 c = new Catepillar(100, 80, 20, 50, 20, color(72,55,37), color(26,22,17));
}
void draw() {
PImage b;
b = loadImage("Nina-Shackleton.jpg");
// Nina Katchadourian Self-Portait as Sir Ernest Shackleton
image(b, 0, 0);
smooth();
noStroke();
fill(250,20, 20);
ellipse(104,168,15,15);
ellipse(165,165,15, 15);
c.drawCatp();
}



class Catepillar
{
  int[] xVals;
  int[] yVals;
  int startingX;
  int startingY;
  int lengthh;
  int wiggle;
  int thickness;
  int color1;
  int color2;
  int current;
  int POIx;
  int POIy;
  
Catepillar(int startingX, int startingY, int lengthh, int wiggle, int thickness, int color1, int color2){
  current=1;
  yVals = new int[lengthh];
  xVals = new int[lengthh];

  for(int i = 1; i < lengthh; i+=10)
    {
  //    yVals[i]=(int)(random(wiggle));
  yVals[i]=startingX;
  xVals[i]=startingY;
    }
  this.startingX=startingX;
  this.startingY = startingY;
  this.lengthh = lengthh;
  this.wiggle=wiggle;
  this.thickness=thickness;
  this.color1=color1;
  this.color2=color2;
  POIx = startingX;
  POIy = startingY;  
}
void drawCatp(){
  if((abs(startingX-POIx)<=20) && (abs(startingY-POIy)<=20))
  {
   POIx= constrain((int)(random(startingX-wiggle,startingX+wiggle)), 100, 200);
   POIy= constrain((int)(random(startingY-wiggle,startingY+wiggle)), 50, 100);
  }
  startingX=(int)((startingX*.95+POIx*.05));
  startingY=(int)((startingY*.95+POIy*.05));
  current++;
  xVals[current%lengthh]=startingX;
  yVals[current%lengthh]=startingY;

  for (int i=current; i < current+(int)lengthh/3; i+=5){
    drawFuzz(xVals[i%current]+i%current, (int)(yVals[i%current]), thickness, color1, color2);
  }
    for (int i=((int)(current+(lengthh/3))); i < (current+((int)(2*(lengthh/3)))); i+=5){
    drawFuzz(xVals[i%current]+15+i%current, (int)(yVals[i%current]), thickness, color(234,154,73), color(211,109,6));
  }
    for (int i= current+(int)2*(lengthh/3); i < current+lengthh; i+=5){
    drawFuzz(xVals[i%current]+30+i%current, (int)(yVals[i%current]), thickness, color1, color2);
  }
}

void drawFuzz(int centerx, int centery, int radiuss, color col1, color col2){
  strokeWeight(2);
  for (int a=1; a<360; a+=6){
    color col = lerpColor(col1,col2, random(0.1, .9));
    stroke(col);
    line(centerx, centery, centerx+radiuss * cos(a), centery+radiuss * sin(a));
    }
  }
}

