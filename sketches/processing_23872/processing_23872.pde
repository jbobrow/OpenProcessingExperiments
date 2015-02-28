
PImage img;

PFont font;
float opacityv = 0; //opacity variables
float opacity5 = 0;
float opacityb = 0;
float opacity1 = 0;
float opacityz = 0;
float opacity9 = 0;

void setup() {
  size(733, 477);
   img = loadImage("027.jpg");
   background (200);
  image(img,0,0);
   font = loadFont("HelveticaNeue-Bold-48.vlw"); 
    smooth();
}

void draw() {
  background(20);
    image(img,0,0);
  textFont(font);
  frameRate(15);
   

   
  fill(255, opacityv); //colour
  text("T", 420, 125);
  fill(255, opacity5); //colour
  text("O", 450, 125);
 
  fill(255, opacityb); //colour
  text("R", 500, 125);
  fill(255, opacity1); //colour
  text("E", 535, 125);
  fill(255, opacity5); //colour
  text("A", 570, 125);
  fill(255, opacityb); //colour
  text("D", 605, 125);
  
  fill(255, opacityz); //colour
  text("W", 420, 175);
  fill(255, opacity9); //colour
  text("I", 470, 175);
  fill(255, opacityv); //colour
  text("T", 487, 175);
  fill(255, opacityz); //colour
  text("H", 520, 175);
  fill(255, opacity9); //colour
  text("O", 560, 175);
  fill(255, opacityv); //colour
  text("U", 600, 175);
  fill(255, opacityz); //colour
  text("T", 640, 175);
  
  fill(255, opacity5); //colour
  text("R", 420, 225);
  fill(255, opacityb); //colour
  text("E", 455, 225);
  fill(255, opacity1); //colour
  text("F", 485, 225);
  fill(255, opacityz); //colour
  text("L", 512, 225);
  fill(255, opacity9); //colour
  text("E", 540, 225);
  fill(255, opacityb); //colour
  text("C", 570, 225);
  fill(255, opacityb); //colour
  text("T", 605, 225);
  fill(255, opacity1); //colour
  text("I", 635, 225);
  fill(255, opacityz); //colour
  text("N", 650, 225);
  fill(255, opacity1); //colour
  text("G", 685, 225);
  
  fill(255, opacity1); //colour
  text("I", 420, 275);
   fill(255, opacityb); //colour
  text("S", 435, 275);
  
  fill(255, opacityz); //colour
  text("T", 480, 275);
  fill(255, opacity1); //colour
  text("O", 510, 275);
  
  fill(255, opacity5); //colour
  text("E", 560, 275);
  fill(255, opacityb); //colour
  text("A", 595, 275);
  fill(255, opacity1); //colour
  text("T", 625, 275);
  
   fill(255, opacityz); //colour
  text("W", 420, 325);
  fill(255, opacity9); //colour
  text("I", 470, 325);
  fill(255, opacityv); //colour
  text("T", 487, 325);
  fill(255, opacityz); //colour
  text("H", 520, 325);
  fill(255, opacity9); //colour
  text("O", 560, 325);
  fill(255, opacityv); //colour
  text("U", 600, 325);
  fill(255, opacityz); //colour
  text("T", 640, 325);
  
  fill(255, opacityb); //colour
  text("D", 420, 375);
  fill(255, opacityb); //colour
  text("I", 455, 375);
  fill(255, opacity1); //colour
  text("G", 470, 375);
  fill(255, opacityz); //colour
  text("E", 505, 375);
  fill(255, opacity9); //colour
  text("S", 535, 375);
  fill(255, opacityb); //colour
  text("T", 570, 375);
  fill(255, opacityb); //colour
  text("I", 600, 375);
  fill(255, opacity1); //colour
  text("N", 615, 375);
  fill(255, opacityz); //colour
  text("G", 650, 375);
  fill(255, opacity1); //colour
  text(".", 685, 375);
  
  opacityv += 30; //increasing opacity from 0 at different rates
  opacity5 += 25;
  opacityb += 20;
  opacity1 += 15;
  opacityz += 10;
  opacity9 += 5;
  
  //rates of opacity change because speed of reachign 500 varies
   
  if(opacityv > 500){  //if opacity reaches 500, change back to 0
     opacityv = 0;}
   if(opacity5 > 500){
     opacity5 = 0;}
   if(opacityb > 500){
     opacityb = 0;}
   if(opacity1 > 500){
     opacity1 = 0;}
   if(opacityz > 500){
     opacityz = 0;}
   if(opacity9 > 500){
     opacity9 = 0;}
}

void keyReleased() {
if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
Calendar now = Calendar.getInstance();
return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


