
import geomerative.*;
float oldPointX;
float oldPointY;

RPoint[] pnts;


int i =0;

void setup() {
 size(1000, 800);
 smooth();

 RG.init(this);
RFont font = new RFont( "Neu_Eichmass.ttf", 180, RFont.CENTER);
RGroup grp = font.toGroup("No.One");
RCommand.setSegmentLength(12);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
pnts = grp.getPoints();

oldPointX = pnts[0].x;
oldPointY = pnts[0].y;

background(0,0,0);

strokeWeight(0.5);
colorMode(HSB,pnts.length,100,100);

}

void draw() {

//background(255);
translate(width/2, height/2);





float randomNess = 10;
float x = map(mouseX, 0, width, 0,100);
float y = map(mouseY, 0, height, 0,100);





float pointX = pnts[i].x+random(-x,x);
float pointY = pnts[i].y+random(-y,y);


int test = (int) random(0, pnts.length-1);


noFill();


 stroke(i,100,100);

 rect(pointX,pointY , 5,5);
 line(pointX,pointY,oldPointX,oldPointY);
//  line(pointX,pointY,pnts[test].x,pnts[test].y);



if(i >= pnts.length -1) i = 0;
else i++;

oldPointX = pointX;
oldPointY = pointY;
}


