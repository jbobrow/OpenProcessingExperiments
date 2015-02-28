
/**
tweaked version of Jian Yi's "poetry generator"
http://www.openprocessing.org/sketch/67462
**/
PFont Font01;

int h = int(random(5));
String[] adj1 = { "happpppy", "gilchttty", "filthy", "technologically-sound", 
                        "aesthetically-pleasing"};
int b = int(random(5));
String[] obj1 = { "birthday", "olderDay", "thirty-tird",
                        "existenceDay", "meatspaceDay"};
int t = int(random(5));
String[] prep = { "to", "4", "war", 
                        "222", "foo"};
int y = int(random(5));
String[] you = { "you,", "u,", "you®,", "ü,,,,",
                        "ahhhh-choooo!,"};
int hammer = int(random(5));
String[] noun = { "hammer!", "ham!", "hammm!", "haHaham!", 
                        "haHahammer!", "lol!"};
 
void setup() {
   size(600, 400);
   background(255);
  
   Font01 = loadFont("Ziggurat-HTF-Black-32.vlw");
}
  
void mouseDragged() {
  {   
    background(random(255), random(255), random(255));
    fill(random(255));
    textFont(Font01);
    h = int(random(5));
    text(adj1[h], 20, 70);
    b = int(random(5));
    text(obj1[b], 20, 120);
    t = int(random(5));
    text(prep[t], 20, 170);
    y = int(random(5));
    text(you[y], 20, 220);
    hammer = int(random(5));
    text(noun[hammer], 20, 270);
  }
}
 
void draw() {
   
}


