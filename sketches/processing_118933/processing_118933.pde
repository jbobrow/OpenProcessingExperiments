
void setup(){
size(300,300);
background(255,84,15);
}
void draw(){
//Corpo
noStroke();
fill(255,10);
ellipseMode(CENTER);
ellipse(130,150,80,150);
//Olhos
fill(0);
ellipse(120,110,5,10);
fill(0);
ellipse(140,110,5,10);
//Boca
fill(0);
ellipse(130,180,30,50);
}
void mousePressed(){
  fill(255);
 textSize(70);
text("BOO!!", 10, 60); 
}
void mouseMoved(){
  background(0);
  fill(252,104,5);
  textSize(25);
  text("THIS IS HALLOWEEN!!!",40,290);
}
