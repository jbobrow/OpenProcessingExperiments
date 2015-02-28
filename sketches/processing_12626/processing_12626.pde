
color a,b,c;
color[]mycolors=new color[3];

int currSize = 130;
int canvasWidth = 690;
int canvasHeight = 690;
float currSecond = 0;
boolean shapeBegun = false;
boolean shapeEnded = true;

float PX,PY,X,Y;
      float easing=0.005;
      
 
void setup() {
  size(canvasWidth, canvasHeight);
  a=color(255);
  b=color(0);
  c=color(120);
  mycolors[0]=a;
  mycolors[1]=b;
  mycolors[2]=c;
  background(mycolors[int(random(3))]);
  smooth();
}
 
void draw() {
  fill(random(255), random(255), random(255), random(100)+random(100));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  if(key == 'd'){
  drip();}
      
   
}
 
 void drip(){
   float targetX=mouseX;
      float targetY=mouseY;
      X+=(targetX-X)*easing;
      Y+=(targetY-Y)*easing;
      float weight= 30/dist(X,Y,PX,PY);
      if(weight>=50){weight=random(45,65);}
      strokeWeight(weight);
      line(X,Y,PX,PY);
      PX=X;
      PY=Y;
   }
void mouseClicked() {
  if(shapeEnded == false && key != 'v') {
      println("END SHAPE");
      endShape();
      shapeEnded = true;
      shapeBegun = false;
   }   
 
  switch(key) {
    case 'a':
      float startAngle = random(360);
      float endAngle = startAngle+random(360);
      arc(mouseX, mouseY+random(currSize), random(currSize), random(currSize), radians(startAngle), radians(endAngle));
      break;
    case 'b':
      bezier(mouseX, mouseY+random(currSize), random(currSize), random(currSize), random(currSize), random(currSize), random(currSize), random(currSize));
      break;  
    case 'e':
      ellipse(mouseX, mouseY, random(currSize), random(currSize));
      break;
    case 'l':
      line(mouseX, mouseY, random(canvasWidth), random(canvasHeight));
      break;
    case 'p':
      point(mouseX, mouseY);
      break;
    case 'q':
      quad(mouseX-random(currSize), mouseY-random(currSize), mouseX-random(currSize), mouseY+random(currSize), mouseX+random(currSize), mouseY+random(currSize), mouseX+random(currSize), mouseY-random(currSize));
      break;
    case 'r':
      float randWidth = random(currSize);
      float randHeight = random(currSize);
      rect(mouseX, mouseY-randHeight/4, 2*randWidth, randHeight);
      break;
    case 's':
      save("myDrawing.jpeg");
    case 't':
      triangle(mouseX, mouseY, mouseX+random(currSize/2), mouseY-random(currSize/2), mouseX+random(currSize/2), mouseY+random(currSize/2));
      break;
    case 'v':
      if(shapeBegun == false) {
      println("BEGIN SHAPE");
        beginShape();
        shapeBegun = true;
        shapeEnded = false;
      }
      vertex(mouseX, mouseY);
      point(mouseX, mouseY);
      break;
    case ' ':
      background(random(255));
      key = 'p';
      break;
    default:
      key = 'p';
      point(mouseX, mouseY);
      break;
  }
}

