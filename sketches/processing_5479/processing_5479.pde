
PImage joy, fear, disgust, anger, surprise, sadness;

int selected = 0;

void setup()  {
  size(200,200);
  background(255);
  
  joy = loadImage("xjoy.jpg");
  fear = loadImage("xfear.jpg");
  disgust = loadImage("xdisgust.jpg");
  anger = loadImage("xanger.jpg");
  surprise = loadImage("xsurprise.jpg");
  sadness = loadImage("xsadness.jpg");
  
}

void mousePressed()  {
  selected = int(random(6));
}

void draw()  {
  /*if(random(100) > 99.0)  {
    selected = int(random(6));
  }*/
  
  if(mousePressed)  {
    PImage temp;
    switch(selected)  {
      case 0:
        temp = joy;
        break;
      case 1:
        temp = fear;
        break;
      case 2:
        temp = disgust;
        break;
      case 3:
        temp = anger;
        break;
      case 4:
        temp = surprise;
        break;
      case 5:
        temp = sadness;
        break;
      default:
        temp = joy;
        break;
    }
    int tempx = max(0, min(width-20, mouseX-10));
    int tempy = min(height-20, max(0, mouseY-10));
    set(tempx, tempy, temp.get(tempx, tempy, 20, 20));
  }
}

