
float speed = 10;
float x;
float y;

 
PFont font1;
String storedKeys = "";
String [] words = new String [10];
//when you click add new word into array
String [] wordsX = new String[10];
//when you click add words X
//when drawing add one onto each x
String [] wordsY = new String[10];
//when you click add words Y



void setup () {
  size (800,800);
  font1 = loadFont ("FelixTitlingMT-150.vlw");
 background (255);
}

 

void draw () {
  

 
 if (mouseY <160) {
textFont(font1, 40);}
 fill(0);
 if (mouseY > 160 && (mouseY <320)) {
  textFont(font1, 60);}

 if (mouseY > 320 && (mouseY <480)) {
textFont(font1, 80);}

if (mouseY > 480 && (mouseY <640)) {
  textFont(font1, 100);

}
 if(mouseY > 640 && (mouseY <800)) {
  textFont(font1, 110);
 }
 


 
 if (mouseX < 160) {
 //black
 fill(0); }
 //red
 if (mouseX > 160 && (mouseX <320)) {
 fill(255,0,0); }
  //blue
 if (mouseX > 320 && (mouseX <480)) {
 fill(0,0,255); }
   //green
 if (mouseX > 480 && (mouseX <640)) {
 fill(0,255,0); }
   //yellow
 if (mouseX > 640 && (mouseX <800)) {
 fill(255,217,0); } 
 

 
// legend or key 
//rect (0,750,50,50);

}
 
  


void keyPressed () {
  //key
storedKeys += key;
println(storedKeys);
}

void mouseClicked() {

 text (storedKeys, mouseX, mouseY);
//mouseReleased ();
//text (storedKeys, mouseX + random (-speed, speed), mouseY+ random (-speed, speed));

 storedKeys ="";}
 
 






