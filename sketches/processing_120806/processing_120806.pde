
int bgColor = color(255,255,255);

//shape triggers
boolean freePencil = false;
boolean freeCercles = false;
boolean freeRect = false;
boolean clean = false;
boolean freeElipse = false;

//color and sizes triggers
int sideColours = color(0,0,0);
int defaultX = 10;
int defaultY = 10;
int defaultElipseX = 20;
int defaultElipseY = 10;

//symmetry triggers
boolean symmetry = false;
boolean symmetryRect = false;
boolean symmetryCercles = false;
boolean symmetryPencil = false;
boolean symmetryElipse = false;

//more sizes triggers
int midSizeX = 40;
int midSizeY = 40;
int hugeSizeX = 100;
int hugeSizeY = 100;
int midElipseX = 80;
int midElipseY = 40;
int hugeElipseX = 200;
int hugeElipseY = 100;

//eraser trigger
boolean esborrar = false;

//more sizes triggers
int defaultStroke = 1;
int midStroke = 8;
int hugeStroke = 15;

//TELL ME MORE ABOUT YOUR CARRIES
PImage draven;



void setup(){
background(bgColor);
size(900,900);
smooth();
draven = loadImage("LEAGUEOFDRAVEN.jpg");
}

void draw(){
println(mouseX+","+mouseY);
//Ajuda per l'usuari per saber que té activat
println("Linea activada: " + freePencil);
println("Rectangles activats: " + freeRect);
println("Cercles activats: " + freeCercles);
println("Elipse activada: " + freeElipse);
println("Simetria activada: " + symmetry);

//Key utilities
if(keyPressed){
if(key == 'r'){
  sideColours = color(random(255),random(255),random(255));
}
}
if(keyPressed){
if(key == 'd'){
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  defaultStroke = 1;
}
}
if(keyPressed){
if(key == 'm'){
  defaultX = midSizeX;
  defaultY = midSizeY;
  defaultElipseX = midElipseX;
  defaultElipseY = midElipseY;
  defaultStroke = midStroke;
}
}
if(keyPressed){
if(key == 'h'){
  defaultX = hugeSizeX;
  defaultY = hugeSizeY;
  defaultElipseX = hugeElipseX;
  defaultElipseY = hugeElipseY;
  defaultStroke = hugeStroke;
}
}
if(keyPressed){
if(key == 'f'){
  defaultX = mouseX;
  defaultY = pmouseY;
  sideColours = color(random(255),random(255),random(255));
  defaultElipseX = mouseX;
  defaultElipseY = mouseY;
  defaultStroke = (abs(mouseX-pmouseY));
}
}

//DRAVEEEEEEEEEEEEEEEEEEEEEEN
if(keyPressed){
if(key == ' '){
  fill(random(255),random(255),random(255));
  textSize(50);
  text("LEAGUE OF DRAVEN",random(0,800),random(0,800));
  image(draven,random(0,800),random(0,800));
}
}

//menuBarBottom_Shapes
textSize(12);
strokeWeight(1);
fill(0,0,0);
rect(0,800,900,100);
fill(255,0,0);
text("Choose the shape you want to draw with:",15,820);
text("Click to clean the board",710,835);
//menuBarSide_Colours
fill(160,160,160);
rect(800,0,100,800);
fill(255,0,0);
text("Colour chart",820,15);

//bottomShapesButtons
fill(255,255,255);
ellipse(40,845,15,15);
rect(860,830,15,15);
stroke(255,255,255);
line(80,845,130,845);
noStroke();
rect(165,835,15,15);
ellipse(230,845,25,15);

//sideColourPicks Green - Blue - Red - Yellow - Cyan - Pink - Gray - Purple
stroke(0,0,0);
fill(0,255,0);
rect(820,30,15,15);
fill(0,0,0);
rect(870,30,15,15);
fill(0,0,255);
rect(820,55,15,15);
fill(255,0,0);
rect(820,80,15,15);
fill(255,255,0);
rect(820,105,15,15);
fill(0,255,255);
rect(820,130,15,15);
fill(255,0,255);
rect(820,155,15,15);
fill(160,160,160);
rect(820,180,15,15);
fill(127,0,255);
rect(820,205,15,15);
noStroke();

//Symmetry, eraser, keys, randomizer, UNLEASH THE FURY
fill(255,0,0);
text("Symmetry",820,260);
stroke(0,0,0);
fill(255,255,255);
rect(820,275,10,10);
rect(840,275,10,10);
noStroke();
fill(255,0,0);
text("Goma",820,320);
stroke(0,0,0);
fill(255,255,255);
rect(820,340,15,15);
noStroke();
fill(255,0,0);
text("Key utilities",820,380);
fill(0,255,0);
text("R, randomizer",820,400);
text("D, defaultSize",820,415);
text("M, midSize",820,430);
text("H, hugeSize",820,445);
text("F for FURY",820,475);

//MADNESS
fill(255,255,255);
text("Hold",805,510);
fill(255,0,0);
text("SPACEBAR",835,510);
fill(255,255,255);
text("for MADNESS",805,525);

//ButtonScripts
frameRate(500);
if(mousePressed && freePencil == true){
  strokeWeight(defaultStroke);
  stroke(sideColours);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }else if(mousePressed && freeCercles == true){  
  noStroke();
  fill(sideColours);
  ellipse(mouseX,mouseY,defaultX,defaultY);
  }else if(mousePressed && clean == true){
  fill(bgColor);
  rect(0,0,800,800);
  noStroke(); 
  }else if(mousePressed && freeRect == true){
  fill(sideColours);
  rect(mouseX,mouseY,defaultX,defaultY);
  noStroke();
  }else if(mousePressed && freeElipse == true){
  fill(sideColours);
  noStroke();
  ellipse(mouseX,mouseY,defaultElipseX,defaultElipseY);
  }else if(mousePressed && symmetry == true && symmetryRect == true){
  fill(sideColours);
  rect(mouseX,mouseY,defaultX,defaultY);
  rect(800-mouseX,mouseY,defaultX,defaultY);
  noStroke();
  }else if(mousePressed && symmetry == true && symmetryPencil == true){
  strokeWeight(defaultStroke);
  stroke(sideColours);
  line(mouseX,mouseY,pmouseX,pmouseY);
  line(800-mouseX,mouseY,800-pmouseX,pmouseY);
  }else if(mousePressed && symmetry == true && symmetryCercles == true){
  fill(sideColours);
  noStroke();
  ellipse(mouseX,mouseY,defaultX,defaultY);
  ellipse(800-mouseX,mouseY,defaultX,defaultY);
  }else if(mousePressed && symmetry == true && symmetryElipse == true){
  fill(sideColours);
  noStroke();
  ellipse(mouseX,mouseY,defaultElipseX,defaultElipseY);
  ellipse(800-mouseX,mouseY,defaultElipseX,defaultElipseY);
  }else if(mousePressed && esborrar == true){
  noStroke();
  fill(bgColor);
  rect(mouseX,mouseY,defaultX,defaultY);
  }
}

void mousePressed(){
  //SHAPES
  if(mousePressed && 165 < mouseX && mouseX < 180 && 830 < mouseY && mouseY < 850){
  freePencil = false;
  freeCercles = false;
  freeRect = true;
  clean = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 33 < mouseX && mouseX < 45 && 837 < mouseY && mouseY < 851){
  freeCercles = true;
  freePencil = false;
  freeRect = false;
  clean = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 860 < mouseX && mouseX < 875 && 830 < mouseY && mouseY < 845){
  clean = true;
  freeCercles = false;
  freeRect = false;
  freePencil = false;
  symmetry = false;
  freeElipse = false;
  sideColours = color(0,0,0);
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 80 < mouseX && mouseX < 130 && 830 < mouseY && mouseY < 845){
  clean = false;
  freeCercles = false;
  freeRect = false;
  freePencil = true;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 219 < mouseX && mouseX < 242 && 837 < mouseY && mouseY < 851){
  freeCercles = false;
  freePencil = false;
  freeRect = false;
  clean = false;
  freeElipse = true;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }/*SYMMETRY
  BEGINS HERE*/else if(mousePressed && 820 < mouseX && mouseX < 855 && 270 < mouseY && mouseY < 290 && freeRect == true){
  symmetry = true;
  symmetryRect = true;
  symmetryCercles = false;
  symmetryPencil = false;
  freeCercles = false;
  freeRect = false;
  freePencil = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 820 < mouseX && mouseX < 855 && 270 < mouseY && mouseY < 290 && freePencil == true){
  symmetry = true;
  symmetryRect = false;
  symmetryCercles = false;
  symmetryPencil = true;
  freeCercles = false;
  freeRect = false;
  freePencil = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 820 < mouseX && mouseX < 855 && 270 < mouseY && mouseY < 290 && freeCercles == true){
  symmetry = true;
  symmetryRect = false;
  symmetryCercles = true;
  symmetryPencil = false;
  freeCercles = false;
  freeRect = false;
  freePencil = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }else if(mousePressed && 820 < mouseX && mouseX < 855 && 270 < mouseY && mouseY < 290 && freeElipse == true){
  symmetry = true;
  symmetryElipse = true;
  symmetryRect = false;
  symmetryCercles = false;
  symmetryPencil = false;
  freeCercles = false;
  freeRect = false;
  freePencil = false;
  freeElipse = false;
  defaultX = 10;
  defaultY = 10;
  defaultElipseX = 20;
  defaultElipseY = 10;
  }
  
  //COLORING BEGINS HERE
  if(mousePressed && 820 < mouseX && mouseX < 835 && 30 < mouseY && mouseY < 45){
    sideColours = color(0,255,0);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 55 < mouseY && mouseY < 70){
    sideColours = color(0,0,255);
  }else if(mousePressed && 870 < mouseX && mouseX < 885 && 30 < mouseY && mouseY < 45){
    sideColours = color(0,0,0);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 80 < mouseY && mouseY < 95){
    sideColours = color(255,0,0);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 105 < mouseY && mouseY < 120){
    sideColours = color(255,255,0);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 130 < mouseY && mouseY < 145){
    sideColours = color(0,255,255);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 155 < mouseY && mouseY < 170){
    sideColours = color(255,0,255);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 180 < mouseY && mouseY < 195){
    sideColours = color(160,160,160);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 205 < mouseY && mouseY < 220){
    sideColours = color(127,0,255);
  }else if(mousePressed && 820 < mouseX && mouseX < 835 && 340 < mouseY && mouseY < 355){
    esborrar = true;
    symmetry = false;
    symmetryElipse = false;
    symmetryRect = false;
    symmetryCercles = false;
    symmetryPencil = false;
    freeCercles = false;
    freeRect = false;
    freePencil = false;
    freeElipse = false;
  }
}


