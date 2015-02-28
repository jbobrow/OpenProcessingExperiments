
PFont font;
PFont sil;
PFont type;
PFont last;

void setup(){
size(250,250);
font = loadFont("BookmanOldStyle-48.vlw");
sil = loadFont("Stencil-48.vlw");
type = loadFont("Parchment-Regular-48.vlw");
last = loadFont("Gungsuh-48.vlw");
smooth();

}

void draw(){
background(#313535);

textFont(sil,100);
fill(#000000);
text("M5A",10, 120);

smooth();
textFont(type,120);
fill(#fd0101);
text("3W7",100, 170);

//borrowed code from Matt Chan
noFill();
strokeWeight(random(7)); 
frameRate(9);
rectMode(CENTER);
  stroke(#fbfafa, 100);
  rect(random(250), 0, random(250), 600); //boxes extend outside of box, so only lines appear
  stroke(#c3cece, 100);
  rect(random(250), 0, random(250), 600);
  
  
  stroke(#fbfafa, 70);
  rect(random(250), 0, random(250), 600);
  stroke(#fbfafa, 50);
  rect(random(250), 0, random(250), 600);


}

