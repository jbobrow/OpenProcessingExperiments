
/* Instructions:
Letters - Letters will appear at the position of the mouse.
Mouse - Pressing the mouse will draw a line across the canvas.
1-5 - Choose color from palette.
6-9 - Choose direction of lines.
ENTER or RETURN - Save screenshot.

My idea was that reading books helps people relax and escape their
reality for a short vacation in a different world. In the mind of
the reader their figurative imagination and the letters they are
reading are all mixed together to create a unique experience.
*/



// external visual art (photo)
PImage reading;

// global variables
int direction = 1;
color c = #ffffff;

color [] palette = {#ffffff, #cdc7cb, #a1d5fd, #4e80bb, #ead8a8};

// setup
void setup(){
  size(900,716);
  background(#FFFFFF);
  smooth();
  // load and set background to external photo
  reading = loadImage("reading.jpg");
  image(reading,0,0);
}

// draw
void draw(){
  // qualifiers for the textfunction used in keyPressed
  textSize(random(20,80));
  fill(c);
  
  // drawing lines with the mouse
  strokeWeight(2);
  stroke(c,20);
  if(mousePressed){
    switch(direction){
      case 1:
        line(0,mouseY,width,mouseY);
        break;
      case 2:
        line(mouseX,0,mouseX,height);
        break;
      case 3:
        line(0,mouseY+716*mouseX/900,width,mouseY-716*(width-mouseX)/900);
        break;
      case 4:
        line(0,mouseY-716*mouseX/900,width,mouseY+716*(width-mouseX)/900);
        break;
    }
  }
}

void keyPressed(){
  if( key == ENTER || key == RETURN){
    saveFrame("screenshot.png");
  }
  
  // writing letters
  if( (key >= 'A' && key <= 'Z')||(key >= 'a' && key <= 'z') ){
    text(key,mouseX,mouseY);
  }
  
  // changing settings
  switch(key){
    case '1':
        c = palette[0];
        break;
    case '2':
        c = palette[1];
        break;
    case '3':
        c = palette[2];
        break;
    case '4':
        c = palette[3];
        break;
    case '5':
        c = palette[4];
        break;
        
        
    case '6':
        direction = 1;
        break;
    case '7':
        direction = 2;
        break;
    case '8':
        direction = 3;
        break;
    case '9':
        direction = 4;
        break;
  }
}






