
//Idee, Quelle http://www.processing.org/discourse/beta/num_1215767092.html#1

int radius1 = 5;
int rMove1 = +1;
int minRadius1 = 5, maxRadius1 = 200;
int xPos1 = 100;
int yPos1 = 200;

int radius2 = 5;
float rMove2 = 0;
int minRadius2 = 20, maxRadius2 = 180;
int xPos2 = 300;
int yPos2 = 200;

int x = mouseX;
int y = mouseY;

float diameter;
int baseAngle;
boolean drawMode;
float multiplier;

boolean doitAgain = false;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
}

void draw() {
  if(mousePressed || doitAgain==true) {
    waterDrop();
    doitAgain=true;
  }
}

void mouseClicked() {
  doitAgain=false;
}
void mousePressed() {
  drawMode= !drawMode;
}

int counter = 0;

void waterDrop() {
  if(((abs(mouseX-pmouseX)>0) || (abs(mouseY-pmouseY)>0)) && drawMode==true){
    counter=frameCount;
    multiplier=dist(mouseX,mouseY,width/2,height/2)/(height/15);
    diameter=dist(mouseX,mouseY,pmouseX,pmouseY)*multiplier+25;
    if(counter==9){
      fill (0,0,25,3);
      rect(0,0,width,height);
    }
   int baseAngle = int(random(255));  // Grundfarbe setzen
   fill(0,0,0,random(10,30));
   ellipse(mouseX+2, mouseY+2, diameter*1.1, diameter*1.1);
   fill(color(baseAngle, 30, 50+random(50)));
  fill(random(0,100), random(50,75), random(90,100), 100);
  ellipse(mouseX, mouseY, diameter,diameter);  
   rMove2 += 0.02;
   radius2 = (int) ((maxRadius2 - minRadius2) * sin(rMove2) + minRadius2);
}
}



