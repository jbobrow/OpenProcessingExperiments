
PFont type;

Ellipse[] myEllipse;
String[] play;// the array to hold all of the text
String delimiters=",.?!;:'--";
int total=0;// num of words
int words=1;    // num of appearance
ArrayList differentWords;
ArrayList myEllipseTemp;
boolean addEllipse;

void setup() {
  size(1200, 800);
  // Load text file as an array of Strings
  String url = "The-Tragedy-of-Hamlet-Prince-of-Denmark.txt";
  String[] rawtext = loadStrings(url);
  type = loadFont("Arial-Black-16.vlw");
  // Join the big array together as one long string
  String everything = join(rawtext, "" );
  play = splitTokens(everything, delimiters);

  // below is the Algorithm: -----------------------------------
  total = play.length;
  differentWords = new ArrayList();
  myEllipseTemp = new ArrayList();
  differentWords.add(play[0]);

  for (int j= 0; j< play.length-1; j++) {
    words = 1;
    addEllipse = true;
    for (int i= j+1; i< play.length; i++) {
      if (play[j].equals(play[i])) {
        words++;
      }
    }
    for (int k= 0; k< differentWords.size(); k++) {
      if (differentWords.get(k).equals(play[j])) {
        addEllipse = false;
        break;
      }
    }

    if (j==0) {
      println("new ellipse here! number of appearence:"+words);
      myEllipseTemp.add(new Ellipse(random(700), random(500), words, words, random(255), random(255), random(255)));
    }
    else if (addEllipse == true) {
      // add different words into ArrayList
      differentWords.add(play[j]);
      println("new ellipse here! number of appearence:"+words);
      myEllipseTemp.add(new Ellipse(random(700), random(500), words, words, random(255), random(255), random(255)));
      //每一个气泡指示一个句子；气泡的直径表示不同长度;
    }
    total = total-words+1;
  }
  println("total:"+total);
  println("myEllipseTemp.size():"+myEllipseTemp.size());
  println("differentWords:"+differentWords);
  // END OF below is the Algorithm: -----------------------------------

  // we put each ellipse in myEllipseTemp ArryList into the Ellipse[]
  myEllipse = new Ellipse[myEllipseTemp.size()];
  for (int i=0; i<myEllipseTemp.size(); i++) {
    myEllipse[i] = (Ellipse)myEllipseTemp.get(i);
  }
}

void draw() {
  background(0);
  noStroke();
  textFont(type);
  for (int i=0; i< myEllipse.length; i++) {
    myEllipse[i].display();
    myEllipse[i].drive();
    myEllipse[i].bounce();
  }
}

//Display the words when ellipse are here
void mousePressed() {
  textFont(type);
  fill(255);
  for (int i=0; i< myEllipse.length; i++) {
    float mouseIn = distance(mouseX, mouseY, myEllipse[i].xpos, myEllipse[i].ypos);
    if (mouseIn < myEllipse[i].ellipseHeight*myEllipse[i].ellipseHeight/4) {
      text(play[i], myEllipse[i].xpos, myEllipse[i].ypos-20);
    }
  }
}

float distance(float x1, float y1, float x2, float y2) {
  float distance = (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2);
  return distance;
}

//why do they show two or three words in some ellipse???????????
class Ellipse {
  float xpos;
  float ypos;
  float ellipseWidth;
  float ellipseHeight;
  float xspeed = random(10);
  float yspeed = random(10);
  float r;
  float g;
  float b;


  Ellipse(float tempXpos, float tempYpos, float tempellipseHeight, float tempellipseWidth, float tempR, float tempG, float tempB) {
    xpos = tempXpos;
    ypos = tempYpos;
    ellipseHeight = tempellipseHeight;
    ellipseWidth = tempellipseWidth;
    r = tempR;
    g = tempG;
    b = tempB;
  }

  void display () {
    noStroke();
    fill(r, g, b);
    ellipse(xpos, ypos, ellipseHeight, ellipseWidth);
  }

  void drive () {
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }

  void bounce () {
    if (xpos > width || xpos < 0 ) {
      xspeed = xspeed * -1;
    }
    if (ypos > height || ypos < 0) {
      yspeed = yspeed *-1;
    }
  }
}



