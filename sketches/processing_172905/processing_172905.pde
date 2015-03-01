
//Allows Processing to call a javascript function in the template
interface JavaScript {
  void playSound(int num);
}

//binds Processing to javascript
void bindJavascript(JavaScript js) {
  javascript = js;
}

//creates a javascript object to be bound to . . .?
JavaScript javascript;

ArrayList droplets;

String sample0 = "chime0.mp3";
String sample1 = "chime1.mp3";
String sample2 = "chime2.mp3";
String sample3 = "chime3.mp3";
String sample4 = "chime4.mp3";
String sample5 = "chime5.mp3";

int value;
int chimeSelection;
String dataIn;

int selector;



void setup() {
  size(500, 500, JAVA2D);
  droplets = new ArrayList();
}

void draw() {
  frameRate(30);
  smooth();
  background(0);

  for (int i = 0; i < droplets.size (); i++) {
    Droplet d = (Droplet) droplets.get(i);
    //println("This droplet object is at index number: " + i);
    d.display();
    d.grow();
  }
  if (droplets.size() > 120) {
    droplets.remove(0);
  }

  textAlign(CENTER);
  textSize(24);
  text("CHICAGO", width/2, height/2 - 200);
  
  textSize(12);
  text("Live data from the netChimes sensor in Chicago, Illinois.", width/2, 450);
  text("If there is no wind, there is no data.", width/2, 470);
}

void strikeChime(int selection) {
  switch(selection) {
  case 0:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 255, 0, 0));
    break;

  case 1:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 0, 255, 0));
    break;

  case 2:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 0, 0, 255));
    break;

  case 3:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 255, 255, 0));
    break;

  case 4:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 255, 0, 255));
    break;

  case 5:
    droplets.add(new Droplet(width/2, height/2, 20, 600, 1, 0, 255, 255));
    break;
  }
}

class Droplet {
  float xPos, yPos;
  float startSize, endSize, speed;
  float red, green, blue;
  int sampleNum;
  boolean sounding = false;

  Droplet(float _xPos, float _yPos, float _startSize, float _endSize, float _speed, float _red, float _green, float _blue) {
    xPos = _xPos; //x position on the screen
    yPos = _yPos; //y position on the screen
    startSize = _startSize; //initial size of the circle
    endSize = _endSize; //final size of the circle (as fade out)
    speed = _speed; //speed (vector) of the expansion/growth
    red = _red; //RED color value
    green = _green; //BLUE color value
    blue = _blue; //GREEN color value
  }

  void display() {
    noFill();
    strokeWeight(2);
    stroke(red, green, blue, 255 - (255 * startSize/endSize));
    //stroke(red, green, blue, 255);
    ellipse(xPos, yPos, startSize, startSize);
  }

  void grow() {
    startSize = startSize + speed;
    if (startSize > endSize) {
      droplets.remove(this);
    }
  }

}





