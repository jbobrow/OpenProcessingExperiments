
/* SOURCE : "Pollock Painting Program" by Nicolas Campbell 
 http://www.openprocessing.org/visuals/?visualID=9062*/
 
PImage splatter1; //had to create an image for each splatter, in order to tint it
PImage splatter2;
PImage painting;
 
//factor that reduces size over time to reflect paint dripping less
float shrink = 1.0;
float shrinkRate = random(0.04,0.06);
 
//color palette of my painting
color[] palette= {
  color(255,255,11), color(254,48,86), color(104,204,8), color(250,22,7)};
   
color[] palette2= { color (255,255,11), color (3,215,176), color(255,255,255),}; 
 
void setup(){
 
  splatter1 = loadImage("splatter4.png");
  splatter2 = loadImage("splatter3.png");
  painting = loadImage("paint.jpg");
 
  size(628,600);
  smooth();

  image(painting,0,0);
}
 
void draw(){
  
   
  //draw when mouse pressed
  if (mousePressed == true){
 
  if (mouseButton == LEFT){  
    image(splatter1,mouseX-10,mouseY-10,(splatter1.width/shrink),(splatter1.height/shrink));
  }
    else if (mouseButton == RIGHT){  
    image(splatter2,mouseX-10,mouseY-10,(splatter2.width/shrink),(splatter2.height/shrink));
  }
  }
 
}
 
void mousePressed(){
   
  if (mouseButton == LEFT){
  //cyle randomly through palette array of set colours
  tint(palette[(int) random(palette.length)]);
}
else if (mouseButton == RIGHT){
  tint(palette2[(int) random(palette2.length)]);
}
 
}
 
void mouseDragged(){
 
  //dripping gets smaller and smaller while dragged
  if (mousePressed) {  
    shrink = shrink + shrinkRate;
  }
}
 
 //I kept the size, since it really fit my painting
void mouseReleased() {
  shrink = 1;
}
 


//this gives a blanck black canva to work on
void keyPressed() {
  if (key == 'b') {
   background(0);
}
//while this returns to an unchanged painting
if (key == ' ') {
    noTint(); //added this function to keep the painting from changing colours as well as the splatters
    image(painting,0,0);
}
}


