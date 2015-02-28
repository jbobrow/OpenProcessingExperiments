
int firstAngle = -90;
int fillColor = 255;
int numArcs = 12;
int arcAngle = 30;
int clockWidth = 500;
int clockHeight = 500;
PImage[] starFrames = new PImage[6];
HourHand hourHand;
float clockAngle = 0;
PFont numberFont;
//
float centerX;
float centerY;

void setup() {
 size(600,600);
 background (255, 255, 255);
 smooth();
 ellipseMode(CENTER);
 imageMode(CENTER);
 starFrames[0] = loadImage("frame_0001.png");
 starFrames[1] = loadImage("frame_0002.png");
 starFrames[2] = loadImage("frame_0003.png");
 starFrames[3] = loadImage("frame_0004.png");
 starFrames[4] = loadImage("frame_0005.png");
 starFrames[5] = loadImage("frame_0006.png");
 hourHand = new HourHand();
 numberFont = loadFont("Andalus-24.vlw");
 centerX = width/2;
 centerY = height/2;
}
/*if arcs were pie slices
arc(x coord, y coord, width of original pie, height of original pie, angle of the first cut, angle of the arc);
*/
void draw() {
 background(0);
 fill(145,0,255);
 ellipse(width/2,height/2,width,height);
 int monthCountdown = month();
 println(month());
 fillColor = 255;
 clockAngle = (hour() % 12) * arcAngle;
 //println(clockAngle);
 for (int i = 0; i < numArcs; i++)
 {
    if (i< monthCountdown)
    {
     fill(0);
    }
    else
    {
       fill(255-fillColor ,100, fillColor);
    }
    arc(width/2, height/2, clockWidth, clockHeight, radians(firstAngle), radians(arcAngle+firstAngle));
    fillColor -= 20;
    firstAngle+=arcAngle;
    
   //place the numbers
    int j = 12 - i;
    float posX = centerX-12 + 275*sin(TWO_PI/numArcs*(i+6));
    float posY = centerY+12 + 275 * cos(TWO_PI/numArcs*(i+6));
    fill(255);
    textFont(numberFont);
    text(j, posX, posY);
 }
 hourHand.tick();
 pushMatrix();
 translate(width/2, height/2);
 rotate(radians(clockAngle));
 translate(-width/2, -height/2);
 hourHand.show();
 popMatrix();
}

