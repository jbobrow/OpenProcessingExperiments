
PImage[] glitter = new PImage[11];
PImage[] atrocity = new PImage[11];
PImage notebook;

void setup(){
  size(600,600);
  background(255);
  notebook = loadImage("bg_notebook.jpg");
  
  glitter[0] = loadImage("g1.png");
  glitter[1] = loadImage("g2.gif");
  glitter[2] = loadImage("g3.gif");
  glitter[3] = loadImage("g4.gif");
  glitter[4] = loadImage("g5.png");
  glitter[5] = loadImage("g6.png");
  glitter[6] = loadImage("g7.png");
  glitter[7] = loadImage("g8.png");
  glitter[8] = loadImage("g9.png");
  glitter[9] = loadImage("g10.png");
  glitter[10] = loadImage("g11.png");
  
  atrocity[0] = loadImage("a1.png");
  atrocity[1] = loadImage("a2.png");
  atrocity[2] = loadImage("a3.png");
  atrocity[3] = loadImage("a4.png");
  atrocity[4] = loadImage("a5.png");
  atrocity[5] = loadImage("a6.png");
  atrocity[6] = loadImage("a7.png");
  atrocity[7] = loadImage("a8.png");
  atrocity[8] = loadImage("a9.png");
  atrocity[9] = loadImage("a10.png");
  atrocity[10] = loadImage("a11.png");
  
  image(notebook,0,0);
}

void draw(){
  
}

void mouseClicked(){
 int index = int(random(0,11));
 print ("Index is: " + index);
 if(mouseButton == LEFT){
   image(glitter[index], mouseX,mouseY); 
 }
 else if(mouseButton == RIGHT){
   image(atrocity[index], mouseX,mouseY); 
 }
}


