
PImage[] glitter = new PImage[11];
PImage[] atrocity = new PImage[11];
PImage notebook;

void setup(){
  size(600,600);
  background(255);
  notebook = loadImage("img/bg_notebook.jpg");
  
  glitter[0] = loadImage("img/glitter/g1.png");
  glitter[1] = loadImage("img/glitter/g2.gif");
  glitter[2] = loadImage("img/glitter/g3.gif");
  glitter[3] = loadImage("img/glitter/g4.gif");
  glitter[4] = loadImage("img/glitter/g5.png");
  glitter[5] = loadImage("img/glitter/g6.png");
  glitter[6] = loadImage("img/glitter/g7.png");
  glitter[7] = loadImage("img/glitter/g8.png");
  glitter[8] = loadImage("img/glitter/g9.png");
  glitter[9] = loadImage("img/glitter/g10.png");
  glitter[10] = loadImage("img/glitter/g11.png");
  
  atrocity[0] = loadImage("img/atrocity/a1.png");
  atrocity[1] = loadImage("img/atrocity/a2.png");
  atrocity[2] = loadImage("img/atrocity/a3.png");
  atrocity[3] = loadImage("img/atrocity/a4.png");
  atrocity[4] = loadImage("img/atrocity/a5.png");
  atrocity[5] = loadImage("img/atrocity/a6.png");
  atrocity[6] = loadImage("img/atrocity/a7.png");
  atrocity[7] = loadImage("img/atrocity/a8.png");
  atrocity[8] = loadImage("img/atrocity/a9.png");
  atrocity[9] = loadImage("img/atrocity/a10.png");
  atrocity[10] = loadImage("img/atrocity/a11.png");
  
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


