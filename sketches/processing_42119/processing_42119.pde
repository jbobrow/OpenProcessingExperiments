
PFont font;
String str1 = " what is the horizon of my desire how do whales experience time like a great flowing current that surrounds things that do not exist but maybe will the opposite of ancestors have strength and foresight most of all imagination now permeable boundaries wooden walls and marble floors an amber room what age are we in hopeless needs to categorize the eternal now continues this gravity sky is a blanket covering fire enveloping heat nature righting itself entropy persisting hybridization and intervention void approaching yellow line collect leaves and write mantras interpersonal boundaries metalayers of meaning space from inside out money congeals onto the surface of the earth extreme landlessness to be without a line to follow surface distance relations in constructed time patchwork problem silent thereness dominated by light waterfowl traveling over oceans and rivers remaining dragonflies expanded and allowed enclosing fossils obsession with seeing measuring naming just say no to the church of sequence not within a hierarchy of numbers but independent and free flowing and exactly what does that have to do with divine love tendency towards the individual subjective as objective null extreme texture cycle snake circle of air stiller place whale bones for free extrapolated unknowledge considered musings wishing to embrace the now recommended mindfulness choose to isolate and return vertical axiology flight from the modern world into the ancient into the future weather and disposition walrus fortune manageable scale womanable way absence of obsolescence wild meters primitive epiphany motive force glacial momentum simplified lack unified bounds fragile avoidance gross underestimation transforming structure linear containment we can’t leave the earth mold making residue sunset simulation of being on water jolting signals severed mysticism waiting daffodils returned speculation readymade conflation a shocking try attempt at growth whirlwind trifecta constructive monolith treacherous binary ritual bolts mark awareness accordion existence live navigation forget about direction";
// writing by Sondra Hart
// "sky is a blanket covering fire" Lowry Burgess
// "money congeals onto the surface of the earth" Trevor Paglen
// "we can't leave the earth" Paul McCarthy
int textw;
int yposition;
int copydist;
int textpos;
int bottomspace; 

void setup() {
  size(500, 500);
  smooth();
  frameRate(1); //slows to one frame per second
  font=loadFont("Monospaced-28.vlw"); //28 pixels high
  textFont(font);
  textAlign(LEFT);
  smooth();
  background(101, 130, 201); //nice blue
  textw = 0;     //width of all the text on a line
  yposition = 30; //amount of text return
  copydist = -20; //moves picture of the screen up 20 pixels
  textpos = 0;    //keeps tract of where the text is, what line it's on
  bottomspace = yposition + copydist; //distance from the bottom of the screen to the bottom of the lowest line of text
  bottomspace = bottomspace - bottomspace%copydist; //mod so that if inputs change bottomspace still agrees with the size of text
}


void draw() {

  char c = str1.charAt(frameCount%str1.length()); //c, type each character in string once a frame for the length of the string then repeat
  if (textw+textWidth(c)>width) { //if the width of current line plus the next character is more than width
    textw = 0; 
    copy(0, 0, width, height, 0, copydist, width, height); //move an image of the screen up by copydist
    textpos += yposition + copydist; //make text position what it was plus ypoistion plus (negitive value) copydist
    if (textpos>height-(2*yposition + bottomspace)) { //accounts for height of text and bottomspace
      noStroke();
      fill(18, 165, 222);
      rect(0, height-(yposition), width, yposition); //makes a rectangle same color as bkgd and same height as text to cover what's left after copy
      copydist = -yposition; //shifting up more now that the y position of the text is not being shifted down
    }
  }

  fill(255);  
  text(c, textw, textpos+yposition); //data, x, y 
  textw+=textWidth(c);
}


