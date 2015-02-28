
//AUDIO HAS BEEN COMMENTED OUT 
//Maxim maxim;
//AudioPlayer playerbgm; 
//AudioPlayer playersfx; 
//AudioPlayer playersfx2;

PFont f;

float circlewidth = 10;
float circleheight = 10;
int globalOpacity = 30;

//text for poem, written by Maiji/Mary Huang - humangray.com
String[] poem = {
"morning",
"good morning",
"awaking",
"I woke",
"rising",
"I slowly",
"gently",
"arose",
"quietly",
"lightly",
"softer than air",
"sun",
"rose",
"the sun rose",
"floating",
"and fair",
};

//some alternate colours for fill or stroke wherever you like
    //fill((mouseX+450)*.255,(mouseX+450)*.255,(mouseX+800)*.255,globalOpacity*100); //wild blue yonder  
    //stroke((mouseX+450)*.255,(mouseX+450)*.255,(mouseX+50)*.255,globalOpacity); //vegas gold
    //stroke((mouseX+900)*.255,(mouseX+999)*.255,(mouseX+100)*.255,10); //pear
    //stroke((mouseX+999)*.255,(mouseX+999)*.255,(mouseX+999)*.255,20); //very light
    
void setup() {
  size(600, 600);
  background(255);
  
  f = createFont("Neuton",12,true); 

  //maxim = new Maxim(this);
  //playerbgm = maxim.loadFile("bgm.wav"); //by DeeLoops - via https://soundcloud.com/deerob-loops/bright-n-wide-bells-with 
  //playerbgm.setLooping(true);
  //playersfx = maxim.loadFile("chimehigher.wav"); //by Justinbw - via http://www.freesound.org/people/JustinBW/sounds/80921/
  //playersfx.setLooping(false);
  //playersfx2 = maxim.loadFile("chime.wav"); //by Justinbw - via http://www.freesound.org/people/JustinBW/sounds/80921/
  //playersfx2.setLooping(false);
}

//creating function for the wormhole ellipse or "sun"
void wormholeGrow() {
  circlewidth = circlewidth+=1;
  circleheight = circleheight+=1;
  if (circlewidth > 500 && circleheight > 500) {
      circlewidth = 10;
      circleheight = 10;
    }
}

void draw() { 
  //playerbgm.play(); //this needs to be here instead of setup for a Javascript version
  fill((mouseX+999)*.255,(mouseX+450)*.255,(mouseX+100)*.255,globalOpacity); //peru/rose gold  
  stroke((mouseX+999)*.255,(mouseX+999)*.255,(mouseX+450)*.255,globalOpacity); //wheat gold
  strokeWeight(mouseY);
  ellipse(mouseX, mouseY, circlewidth,circleheight);
 // ellipse((width-mouseX+1), (height-mouseY+1), circlewidth,circleheight); //mirrored wormhole - makes the mirror in mouseDragged unnecessary
  wormholeGrow();
}

void mouseDragged() {
  //mirrored when dragging - can turn off if you have it on in draw
  ellipse((width-mouseX+1), (height-mouseY+1), circlewidth,circleheight);
}

void mousePressed() {
  //plays 2 different sounds for big circle vs small circle
  //if (circlewidth > 100 ) {
    //playersfx.cue(0); //playersfx.stop(); if Javascript
    //playersfx.play(); }
    //else {
    //playersfx2.cue(0); //playersfx2.stop(); if Javascript
    //playersfx2.play(); }
    
    int index = int(random(poem.length));
    int randsize = int(random(14,48)); //randomizes size of words
    //int randmatch = int(random(poem.length)); //activate to randomize when words appear
    //if (index < randmatch) {
    fill(0,(mouseX+200)*.255,(mouseX+300)*.255,globalOpacity*2); //teal
    textFont(f,(randsize));
    textAlign(CENTER);
    text(poem[index],(mouseX), (mouseY-28));
  //} //activate to randomize when words appear
  
    //add random dots
    noFill();
    //strokeWeight(mouseY/2);
    strokeWeight(random(1,10));
    stroke(255,255,255,200);
    ellipse(random(width),random(height),randsize,randsize);
    point(random(width),random(height));
    point(random(width),random(height));
    point(random(width),random(height));
}

void mouseReleased() {
  circlewidth = 0;
  circleheight = 0;
}
