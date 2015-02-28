
int currSize = 100;
int canvasWidth = 400;
int canvasHeight = 400;
float currSecond = 0;
boolean shapeBegun = false;
boolean shapeEnded = true;

void setup() {
  size(canvasWidth, canvasHeight);
  background(random(255));
  smooth();
}

void draw() {
  fill(random(255), random(255), random(255), random(100));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
}

void mouseClicked() {
  if(shapeEnded == false && key != 'v') {
      println("END SHAPE");
      endShape();
      shapeEnded = true;
      shapeBegun = false;
   }    
  // check what key the user has pressed
  switch(key) {
    case 'a':
      float startAngle = random(360);
      float endAngle = startAngle+random(360);
      arc(mouseX, mouseY, random(currSize), random(currSize), radians(startAngle), radians(endAngle));
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
      rect(mouseX-randWidth/2, mouseY-randHeight/2, randWidth, randHeight);
      break;
    case 's':
      save("myPic.jpeg");
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


