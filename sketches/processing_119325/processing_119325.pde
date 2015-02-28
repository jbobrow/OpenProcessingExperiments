
Text[] texts= new Text[12];
String [] data = {
  "I am fleeting", 
  "emotion", 
  "slip through your", 
  "fingers", 
  "spend your days chasing", 
  "breath", 
  "kite with snipped string", 
  "piece of paper blowing in the wind", 
  "feather in a Hurricane", 
  "pebble in a typhoon", 
  "pitch black sandstorm", 
  "I fall through endless hands", 
  "I escape from your eyes"
};
String [] h;
String [] l;
String [] z;
String [] p;
int [] x = {
  110, 123, 117, 110, 120, 130, 140, 150, 160, 170, 180, 190
};
int [] y = {
  110, 123, 120, 130, 250, 270, 300, 410, 450, 400, 200, 250
};
int index = int(random(12));
int xLoc = 200;
int indent=1;
int yLoc= 200;
//float [] myfloat = new float [7]
void setup() {
  size(800, 800);
  fill(0);
  //Load poem files  
  h = loadStrings("Ember Tidepoolstext.txt");
  l = loadStrings("how to crack a safetext.txt");
  z = loadStrings("prologuetext.txt");
  p = loadStrings("fibonaccitext.txt");
  for (int i=0; i<12; i++) {
    texts[i]=new Text(data[i], x[i], y[i]);
  }
}
void draw() {
  //display String text
  background(255);
  texts[index].display();
  textSize(30);
  frameRate(1);
    if (yLoc > height+indent) {
      yLoc = 30;
      xLoc=0;
      background(0);
    }
  }
//}
class Text {
  String t;
  float x;
  float y;
  //Constructor
  Text(String thestring, float xLoc, float yLoc) {
    t=thestring;
  }
  void display() {
    stroke(255);
    text(t, xLoc, yLoc);
  }
}
void mousePressed() {
  //When mouse is pressed, data words change to next sentence and loaded text pops up
  if (frameCount % 8 == 2) {
    yLoc+=30;
//    xLoc+=10;
    text(p[(int) random(p.length)] + 
      " " +
      h[(int) random(x.length)] + 
      " " +
      l[(int) random(y.length)] + 
      " " +
      z[(int) random(z.length)] +
      " " +
      p[(int) random(p.length)] +
      " " +
      l[(int) random(y.length)] +
      " ", 
    indent, yLoc);
  }
  index=int(random(12));
  fill(200, 0, 0);
  index++;



  //test
  //When sentences 0 and 5 from index are clicked flash words HELP and CLICK and grow text to size 200
  if (index==12) {
    index=0;
    index=5;
    fill(10, 5, 200);
    textSize(200);
    text("HELP!", 100, 100);
    fill(1, 200, 10);
    text("CLICK", 200, 700);
  }
}
//void mouseReleased(){
//  index=int(random(12));
//  fill(255);
//}



