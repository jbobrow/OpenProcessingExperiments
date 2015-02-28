
/* @pjs font="Sintony-Regular.ttf"; */
int myState = 0;
PImage myImage;
PFont myFont;
String a="Facts about foxes, click to find out more!";
String b="Foxes are members of the dog family.";
String c="Foxes are the only type of dog capable of retracting their claws like cats do. Foxes also have vertical pupils that look more like those of cats than the rounded pupils that other dogs have.";
String d="Grey foxes who live in North America are the only type of dogs who can climb trees!";
String e="Foxes live just about everywhere – in the countryside, cities, forests, mountains and grasslands. Arctic foxes live in cold climates far north, and fennec foxes live in the North African desert.";


void setup (){
  size(500,500);
  myImage = loadImage("red-fox.png");
  myFont = createFont("Sintony-Regular.ttf", 200);
}

void draw (){
  background(255);
  
  switch(myState){
    case 0:
    textAlign(LEFT);
    textFont(myFont, 25);
    fill(#5E2612);
    image(myImage, 50, 100, width, height);
    text(a, 5, 10,400, 300);
    break;
    
    case 1:
    textAlign(LEFT);
    textFont(myFont, 20);
    fill(#5E2612);
    image(myImage, 50, 100, width, height);
   text(b, 5, 10,400, 250);
    break;
    
    case 2:
    textAlign(LEFT);
    textFont(myFont, 25);
    fill(#5E2612);
      image(myImage, 50, 100, width, height);
    text(c, 5, 10,400, 250);
    break;
    
    case 3:
    textAlign(LEFT);
    textFont(myFont, 25);
    fill(#5E2612);
     image(myImage, 50, 100, width, height);
    text(d, 5, 10,400, 250);
    break; 
    
    case 4:
    textAlign(LEFT);
    textFont(myFont, 25);
    fill(#5E2612);
     image(myImage, 50, 100, width, height);
    text(e, 5, 10,400, 250);
    break;
    
  }
}
void mousePressed() {
 myState ++ ;
if (myState > 5) {
 myState = 1 ;
}
}
    
    
    


