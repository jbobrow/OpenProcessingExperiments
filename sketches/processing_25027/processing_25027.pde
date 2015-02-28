
String lines[];
PFont font;
float posX;
float posY;
float r;
float g;
float b;
float a;

ArrayList bubbles;


/////////SETUP

void setup() {
 size(1000,700);
 font = loadFont("KozGoPro-ExtraLight-18.vlw");
 bubbles = new ArrayList();


 lines =loadStrings("http://itp.nyu.edu/~gg964/Listy2.txt");
 println("there are " + ((lines.length)-1) + " participants on the list!");
 for (int i=0; i < lines.length; i++) {

   float posX = random(0,width);
   float posY = random(0,height);

   String[] name = split(lines[i], "==");
   String[] onlyName = split(name[0], "<");
   println(name);
   //print(", ");
   //println(onlyName[0]);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

   bubbles.add(new Bubble(onlyName[0], int(name[1]), posX, posY,(i/150.0)));

 }
}

/////////MOUSEPRESSED

void mousePressed() {
 //Loop through the array list, from BACK to FRONT (last drawn to first drawn)
 //and find out if the mouse clicked inside a circle

 Bubble bubble;
 for (int i=0; i < bubbles.size(); i++) {
   bubble = (Bubble)bubbles.get(i);
   bubble.displayName = false;
 }

 for (int i = bubbles.size()-1; i >= 0; i--) {
   bubble = (Bubble)bubbles.get(i);
   if (bubble.testHit(mouseX, mouseY)) {
     //println ("Hit on bubble: " + bubble.name); //if you do "i"
//instead of "bubble.name" you will get the # of the bubble...
     bubble.displayName = true;
     i = -1; //Breaks the loop so we don't keep looking for hits, we
//already got the top most one.
   }
 }
}

/////////DRAW

void draw() {
 smooth();
 background(#9999FF);
 Bubble bubble;
 for (int i=0; i < bubbles.size(); i++) {
   bubble = (Bubble)bubbles.get(i);
   //bubble.draw();
   bubble.display();
   bubble.move(); //Making it move
 }

 for (int i=0; i < bubbles.size(); i++) {
   bubble = (Bubble)bubbles.get(i);
   bubble.drawName();
   //bubble.drawNum();
 }
}







