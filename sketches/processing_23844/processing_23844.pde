
PImage img;
PFont font;


void setup() {
  size(733, 477);
  //img = loadImage(selectInput("select an image"));
   img = loadImage("026.JPG");
   background (200);
   image(img,0,0);
    font = loadFont("HelveticaNeue-Bold-48.vlw"); 
     smooth();
}




boolean drawing = false;

//------------------------------------SCAN PROPERTIES
void draw (){
    textFont(font);
  fill(255); //colour
  text("PEW PEW!", 240, 75);
  text("GOES THE LASER GUN.", 90, 120);
  if (drawing){
    
//mouse determines lines' Y coordinate
  float y = mouseY;
  
//----------------LINE PROPERITES
//THIN
  strokeWeight(3);
  stroke(#D81A1A,(25));
//LINE 
  line(0,y,width,y);
//THIN
  strokeWeight(1);
  stroke(#D81A1A);
//LINE 
  line(0,y,width,y);

//----------------SPRAY PROPERTIES
  noStroke();
  fill(#D81A1A,random(10));
 //garident
  rect (0,(y+1),width,20);
  rect (0,(y+1),width,-20);
  rect (0,(y+1),width,10);
  rect (0,(y+1),width,-10);
  rect (0,(y+1),width,5);
  rect (0,(y+1),width,-5);

}
}




//--------------------------------- MOUSE PROPERTIES ----------------------

//----------------LEFT----- to draw
void mousePressed () {
  if (mouseButton == LEFT) {
    drawing = true;
//----------------RIGHT----- to overlay background
} else if (mouseButton == RIGHT) {
    image(img,0,0);
  }
}
//---------------RELEASE------- stop
void mouseReleased () {
  drawing = false;
}


//--------------------------------- SAVE PROPERTIES ----------------------




