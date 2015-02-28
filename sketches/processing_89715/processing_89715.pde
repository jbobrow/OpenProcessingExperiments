
int counter = 0;
PFont font;
int numOfSteps = 20;
TextBoxButton tbb;
TextBoxButton title;
List textos;
boolean newList = false;
boolean grabbed = false;
int grabbedIndx = -1;
boolean titleGrabbed = false;



void setup() {
  size(1024, 786);

  colorMode(HSB, 360, 255, 255, 255);
  font = loadFont("Nadeem-48.vlw");
  textFont(font);
  textos = new ArrayList();
  tbb = new TextBoxButton();
  title = new TextBoxButton("Processing");
  title.setSize(48);
  
  textos.add(tbb);
}

void draw() {
  noStroke();
  fill(0, 0, 255, 125);
  rect(0, 0, width, height);
  
  title.tbbDraw();

  for (int i = 0;  i < textos.size(); i++) {
    ((TextBoxButton)textos.get(i)).tbbDraw();
  }

}


void keyPressed() {

  switch(key) {
  case RIGHT:
    counter ++;
    if (counter > numOfSteps) {
      counter = 0;
    }
    break;

  case LEFT:
    counter--;
    if (counter < 0) {
      counter = numOfSteps;
    }
    break;

  case ENTER:

    println("ENTER");
    if (tbb.inText.length() != 0) {
      tbb = new TextBoxButton();
      textos.add(tbb);
    }
    break;

  case BACKSPACE:

    int l = tbb.inText.length();
    if (l >= 2) {
      println("del");
      String tmpS = tbb.inText.substring(0, l-1);
      tbb.textUpdate(tmpS);
    }
    else if (l <= 1) {
      tbb.inText = new String();
    }

    break;  
  default:
    if (key != '´') {
      if (key !=CODED) {
        tbb.textUpdate(key);
      }
    }
    break;
  }
}

void mousePressed() {
  
  if(title.isMouseOver()){
    titleGrabbed = true;
    return;
  }

  for (int i = 0;  i < textos.size(); i++) {
    TextBoxButton tmpTbb = ((TextBoxButton)textos.get(i));
    if (tmpTbb.isMouseOver()) {
      grabbed = true;
      grabbedIndx = i;
      return;
    }
  }
}

void mouseDragged() {
  if (titleGrabbed) {
    title.textMove(mouseX, mouseY);
  }
  
  if (grabbed) {
    TextBoxButton tmpTbb = ((TextBoxButton)textos.get(grabbedIndx));
    tmpTbb.textMove(mouseX, mouseY);
    tbb = tmpTbb;
  }
  
  
}

void mouseReleased() {
  grabbed = false;
  titleGrabbed = false;
} 


