

float geoX;
float geoY;

void setup()
{
size(800,600);//canvas
background(#999999);//grey background

geoX=width/9;
geoY=height/9;

}

void draw()
{
background(#999999);//background redrawn grey

if(mousePressed)
  {
    background(225,30,30);//pressing mouse makes background red
  }
existPAL();
if(mousePressed)
  {
    fill(150,30,30,100);
    rect(geoX+225,geoY+100,150,350);
  }
}



void existPAL(){
  
int addX;
int addY;

float inc;  
float plcX;
float plcY;

float noiseA;
float noiseB;
  
  
noiseA=1;
noiseB=2;
inc=0.0001;

addX=301;
addY=315;
  
geoX=geoX-(0.5-noise(noiseA));
geoY=geoY-(0.5-noise(noiseB));
noiseA=noiseA+inc;
noiseB=noiseB+inc;

fill(#D0D0D0);//light grey
rect(geoX+225,geoY+100,150,350);//large rectangle (element 1)
noStroke();//noHemorrhage
  fill(#686868);//mid grey
    rect(geoX+229,geoY+104,142,275);
  fill(#808080);//light grey
    rect(geoX+233,geoY+111,134,32);//top accent rectangle (element 3)
  fill(#D0D0D0);//another light grey
    rect(geoX+236,geoY+114,65,26);//top left rectangle (element 4)
    ellipse(geoX+addX,geoY+addY,100,100);//large ellipse (element 5)
  fill(#383838);//dark grey
    rect(geoX+229,geoY+381,142,65);//bottom rectangle (element 6)
    rect(geoX+addX,geoY+114,63,26);//top right rectangle (element 7)
  fill(#000000);//black
    ellipse(geoX+addX,geoY+addY,90,90);//dark circle (element 8)
    
plcX= map(mouseX, 0, width, -600, 600);//remaps mouseX from (0 - 600) to (-600 - 600)
plcY= map(mouseY, 0, height, -500, 500);//remaps mouseY from (0 - 500) to (-500 - 500)
  fill(#880000);//dark red
    ellipse(geoX+plcX/65+addX, geoY+plcY/100+addY,62,62);//large ellipse (element 9)
  fill(#C80000);//middle red
    ellipse(geoX+plcX/45+addX, geoY+plcY/50+addY,20,20);//middle ellipse (element 10)
  fill(255,255,random(255));//random
    ellipse(geoX+plcX/35+addX, geoY+plcY/40+addY,7,7);//small ellipse (element 11)
  fill(255,255,255,65);//transluscent white
      ellipse(geoX+addX,geoY+addY,100,100);//covering ellipse (element 12)
    textSize(12);//PAL 9000 text
        fill(#D0D0D0);
        text("PAL 9000",geoX+305,geoY+132);
        
// if ((geoX+150)>=width || geoX<=0) {
//   geoX*=-1;
// }
 
// if ((geoY+350)>=height || geoY<=0) {
//   geoY*=-1;
// }
}


