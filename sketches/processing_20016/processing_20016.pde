
/*
Adam Oaks
 Project 1
 
 Left click stops loop
 Right click continues loop
 Press 's' to save
 */


color White = color(255);
color Red = color(196,0,38);
color Bass = color(223,195,147);

void setup() {
  size(1000,600);
  background(255);
  stroke(0);
  strokeWeight(12);
  rectMode(CENTER);
  frameRate(50);
}

int numberOfRect = 5;

void draw() {

  for(int x = 0; x < numberOfRect; x++) {
    randomColor();
    float rectSizeX = random(100,800);
    float rectSizeY = random(40,100);
    rect(random(x,width), random(x,height),rectSizeX,rectSizeY);
  }
}

void keyPressed() {
  if((key=='s')||(key=='S')) {
    saveFrame("randomrect-####.tif");
    println("saved");
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    noLoop();
  } 
  else if (mouseButton == RIGHT) {
    loop();
  }
}


void randomColor() {
  int randomNum = floor(random(1,100));

  if(randomNum > 40) {
    fill(White);
  };
  if(randomNum < 15) {
    fill(Red);
  };
  if(randomNum > 16) {
    if(randomNum < 39) {
      fill(Bass);
    };
  };
}

/*
output image was converted to cad file then laser cut using plexi for the black stoke and red rectangles, basswood for the bass color and mounted on white foamcore
*/

