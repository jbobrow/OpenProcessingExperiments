
Wave[] myWave;
Static[] myStatic;
int count =0;

void setup() {
  size(600, 600);


  myWave = new Wave[ 150 ];
  myStatic = new Static[ 150 ];

  for ( int i=0; i<myWave.length; i++) {
    float newRed = random(142);
    float newGreen = random(112,199);
    if (newGreen > newRed){
      newGreen=newGreen;
    }
    else{
      newGreen=255;
    }
    color newColor = color (newRed, newGreen,255);
    myWave[ i ] = new Wave(newColor);
  }
}

void draw() {
  fill(50, 20);
  noStroke();
  rect(0, 0, width, height);

  for ( int i=0; i<myWave.length; i++) {
    myWave[i].display();
  }
  for ( int i=0; i<count; i++) {
    myStatic[i].display();
  }

}

void mouseClicked() {;  color newColor = color( random(255), random(100), random(255));
  if(count < myStatic.length) {
    myStatic[count] = new Static(mouseX, mouseY, newColor);
    count ++;
  }
}

class Static {
  float x;
  float y;
  color fillColor;

  Static(float theX, float theY, color theColor) {
    x = theX;
    y = theY;
    fillColor = theColor;
  }

  void display() {
    float mil=millis()*.001;
    float r1=100*cos(mil*5)*noise(mil);
    stroke(fillColor);
    strokeWeight(10);
    if(mil<1)
    {background(255);}
    point(x+r1*sin(mil),y+r1*cos(mil));
  }
}
class Wave {
  color fillColor;

  Wave(color theColor ) {
    fillColor = theColor;
  }
  
  void display() {
    float mil=millis()*.001;
    float r=300*cos(mil*5)*noise(mil);
    stroke(fillColor);
    strokeWeight(10);
    if(mil<1)
    {background(255);}
    point(mouseX+r*sin(mil),mouseY+r*cos(mil));
  }
}


