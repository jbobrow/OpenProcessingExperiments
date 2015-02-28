
float m;
char currKey = 'p';
char prevKey = 'p';
int currSize = 100;
int canvasWidth = 400;
int canvasHeight = 400;
float currSecond = 0;

void setup() {
  size(canvasWidth, canvasHeight);
  background(random(255));  
}

void draw() {
  if (mousePressed == true)
    background(random(255));
  smooth();
  m = second();
  
  if(keyPressed) {
    currKey = key;
  }
  fill(random(255), random(255), random(255), random(100));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  
  // make a shape approximately every second
  if (currSecond != m) {
    currSecond = m;
    
    // check what key the user has pressed
    switch(currKey) {
      case 'a':
        prevKey = 'a';
        float startAngle = random(360);
        float endAngle = startAngle+random(360);
        arc(mouseX, mouseY, random(currSize), random(currSize), radians(startAngle), radians(endAngle));
        break;
      case 'e':
        prevKey = 'e';
        ellipse(mouseX, mouseY, random(currSize), random(currSize));
        break;
      case 'l':
        prevKey = 'l';
        line(mouseX, mouseY, random(canvasWidth), random(canvasHeight));
        break;
      case 'p':
        prevKey = 'p';
        point(mouseX, mouseY);
        break;
      case 'q':
        prevKey = 'q';
        quad(mouseX-random(currSize), mouseY-random(currSize), mouseX-random(currSize), mouseY+random(currSize), mouseX+random(currSize), mouseY+random(currSize), mouseX+random(currSize), mouseY-random(currSize));
        break;
      case 'r': 
        prevKey = 'r';
        float randWidth = random(currSize);
        float randHeight = random(currSize);
        rect(mouseX-randWidth/2, mouseY-randHeight/2, randWidth, randHeight);
        break;
      case 't': 
        prevKey = 't';
        triangle(mouseX, mouseY, mouseX+random(currSize/2), mouseY-random(currSize/2), mouseX+random(currSize/2), mouseY+random(currSize/2));
        break;
      case '[':
        if(currSize > 50)
          currSize -= 50;
        currKey = prevKey;
        print(currSize);
        break;
      case ']':
        currSize += 50;
        currKey = prevKey;
        print(currSize);
        break;      
      default:
        currKey = 'p';
        ellipse(mouseX, mouseY, random(currSize), random(currSize));
        break;
    }
  }
}


