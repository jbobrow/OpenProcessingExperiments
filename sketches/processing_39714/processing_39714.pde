
PImage braids,blackhair,bluehair,pigtails,pinkribbons,head;
 
int numObjects = 6;
int centerX = 300;
int centerY = 300;
int distance = 200;
 
void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  braids = loadImage("braids.png");
  blackhair = loadImage("blackhair.png");
  bluehair = loadImage("bluehair.png");
  pigtails = loadImage("pigtails.png");
  pinkribbons = loadImage("pinkribbons.png");
  head = loadImage("head.png");
  imageMode(CENTER);
  frameRate(20);
}
 
void draw() {
  background(random(50,200),random(50,200),random(0,50));
  fill(255,18,81,90);
  ellipse(300,300,600,600);
   fill(255,170);
  ellipse(300,300,500,500);
  float angleObject = TWO_PI/numObjects;
  for (int i=0;i<numObjects; i ++ )
  {
    float posX=centerX + distance *sin(angleObject*i + frameCount*0.1);
    float posY=centerY + distance *cos(angleObject*i + frameCount*0.1);
    float posZ=centerX + distance *cos(angleObject*i + frameCount*0.15);
    float posA=centerY + 200 * cos(angleObject*i + frameCount*0.06);
    float posB=centerX + 200 * sin(angleObject*i + frameCount*0.06);
    
    pushMatrix();
    translate(posX, posY);
    rotate(angleObject*(numObjects-i));
    image(pigtails, 0, 0, pigtails.width*.8,pigtails.height*.8);
    popMatrix();
    
    pushMatrix();
    translate(posY, posX);
    rotate(angleObject*(numObjects-i));
    image(blackhair, 0, 0, blackhair.width*.3,blackhair.height*.3);
    popMatrix();
    
    pushMatrix();
    translate(posA,posB);
    rotate(angleObject*(numObjects-i));
    pushMatrix();
    rotate(radians(random(200)));
     image(braids, posY,posA,300,300);
     popMatrix();
     popMatrix();

     pushMatrix();
    translate(posB,posA);
    rotate(angleObject*(numObjects-i));
    fill(255,255,255,200);
     ellipse(300,300,90,90);
     popMatrix();
     
    image(bluehair, posA, posB);
    image(pinkribbons, posB, posA, 200,200);
    pushMatrix();
    translate(300,300);
    rotate(frameCount*.04%TWO_PI);
    image(head, 0, 20,head.width*1.4,head.height*1.4);
    popMatrix();
  }
}


