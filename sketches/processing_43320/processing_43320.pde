
PFont myFont= createFont ("Times New Roman", 16);
int counter=0; 

void setup() {

  size(640, 480);
  frameRate(1);
}

void draw () {

  background(1);

  String [] sampleText = loadStrings ("Sample Text.txt");

  if (counter <sampleText.length) {

    textFont (myFont);
    text(sampleText[counter], 10, 10, 620, 460);
    counter++;
  }

  if (counter == sampleText.length) {
    counter=0;
  }

}


