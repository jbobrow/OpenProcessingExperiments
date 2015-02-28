
import controlP5.*;
// replace string title for text file name
String title = "poem";
Text txt;
// letters in order of their value
char[] alphabet = {
  'e','t','a','o','h','n','i','s','r','d','l','u','w','m','c','g','f','y','p','v','k','b','j','x','z','q','*'
};
int[] alphabet_val = {
  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,0
};
ControlP5 control;
Textfield myTextfield;
int sizeRing = 300;
float prevValue=0;
int strokeW;
float startingPoint=0;
int totalCount;
int count;
float charPerParagraph;
float spacing=PI/36;
int sentenceNumber;
int lineLength=400;
String inputted;
boolean drawable;

void setup() {
  size(600,600);
  smooth();
  background(255);
  control = new ControlP5(this);
  control.begin();
  //control.setColorBackground(50);
  control.setAutoDraw(false);
  myTextfield = control.addTextfield("sample poem", 290, 540, 300, 50);
  myTextfield.setAutoClear(false);
  myTextfield.keepFocus(true);

  control.addButton("clear",0,500,518,90,20);
  control.addListener(new ControlListener() {
    public void controlEvent(ControlEvent e) {
      //      println(myTextfield.getText());
      //if (e.type() == ControlEvent.PRESSED)
      colorschema();
    }
  }
  );
}

void draw() {
  noStroke();
  //  background(50);
  strokeWeight(0);
  control.draw();
}

void colorschema() {
  inputted = myTextfield.getText();
  String input[] = split(inputted, "/");
  if (key == RETURN) {
  }
  if (input.length>=-1) {
    drawable=true;
  }
  int p=150;
  txt = new Text(input);
  if (txt.paragraphs.length>0) {
    strokeW=(sizeRing-p)/txt.paragraphs.length;
    strokeCap(SQUARE);

    // loops to access words within sentences within paragraph arrays
    for (int i = 0; i < txt.paragraphs.length; i++) {
      int[] totalCount = new int[txt.paragraphs[i].sentences.length];
      for (int j = 0; j < txt.paragraphs[i].sentences.length; j++) {
        for (int l = 0; l < txt.paragraphs[i].sentences[j].words.length; l++) {
          charPerParagraph = txt.paragraphs[i].sentences[j].words[l].chars.length + charPerParagraph;
        }
      }

      for (int j = 0; j < txt.paragraphs[i].sentences.length; j++) {
        // FOR COLLECTING WORD LENGTH
        int[] word_val = new int[txt.paragraphs[i].sentences[j].words.length];
        for (int l = 0; l < txt.paragraphs[i].sentences[j].words.length; l++) {
          //FOR COLLECTING VALUES
          for (int m = 0; m < txt.paragraphs[i].sentences[j].words[l].chars.length; m++) {
            // matches word letter to letter in alphabet in array, which is matched to a value
            for (int n = 0; n < alphabet.length; n++) {
              if (txt.paragraphs[i].sentences[j].words[l].chars[m] == (alphabet[n])) {
                count = count + alphabet_val[n];
              }
            } 
            //stores word values as an array.
            if (count!=0) {
              word_val[l]=word_val[l]+count;
              totalCount[j]=totalCount[j]+count;
              count=0;
            }
          }
        }

        noFill();
        for (int l = 0; l < (txt.paragraphs[i].sentences[j].words.length); l++) {
          sentenceNumber=txt.paragraphs[i].sentences.length-1;
          colorMode(HSB,50,100,100);
          if (strokeW>0) {
            strokeWeight(strokeW);
          } 
          stroke((totalCount[j]/txt.paragraphs[i].sentences[j].words.length), word_val[l], 100);
          arc(width/2, height/2, p, p, startingPoint, ((txt.paragraphs[i].sentences[j].words[l].chars.length/charPerParagraph)*2*PI+startingPoint));
          startingPoint = startingPoint+(txt.paragraphs[i].sentences[j].words[l].chars.length/charPerParagraph)*2*PI;
        }
        //for spaces between sentences.
        //startingPoint=startingPoint+spacing;
      }
      startingPoint=0;
      p=p+2*strokeW;
      charPerParagraph=0;
    }
    //println("done");
  } 
  else {
    println("no entry");
  }
}

void keyPressed() { 
  if (drawable) {
    colorschema();
  }
}

void clear(int theValue) {
  myTextfield.clear();
  background(50);
}


