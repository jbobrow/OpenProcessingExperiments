
float x = 0;
float speed = 10;
int y = 10;
int v = 10;
int t = (int)(Math.random()* v);
int q = 10;

void setup() {
 size(400, 400); 
 fill (0);
 noStroke ();
 rect (0, 0, width, height); 
}

void draw() {
 fill (0, 10);
 rect (0, 0, width, height);
 
 fill(255); 
 ellipse(mouseX, mouseY, y, y); 
 frameRate(40);
 
//Kreise verändern ihren Durchmesser (Vergößern, Verkleinern)

  if ((mouseY>=150) && (mouseY<=250) && (y<=60)) {
     y=y+3; }
 
  if (((mouseY<150) || (mouseY>250)) && (y>=5)){
     y=y-3; }

//Farbzuordnung zu vir unterschiedlichen Zonen in Y-Richtung

  if (((mouseY<=50) || (mouseY>=350))) {
     fill(0, 255, 151);
     ellipse(mouseX, mouseY, y+5, y+5); }
 
  if (((mouseY>50 && mouseY<100) || (mouseY>300 && mouseY<350))) {
     fill(90, 255, 187);
     ellipse(mouseX, mouseY, y+5, y+5); }
   
  if (((mouseY>=100 && mouseY<150) || (mouseY>250 && mouseY<=300))) {
     fill(175, 255, 222);
     ellipse(mouseX, mouseY, y+5, y+5); }
  
// Zwei zusätliche Ellipsen die sich mit Hilfe von Random im 
// äußeren X-Bereich (vor Allem in den Ecken) strecken
 
  if (((mouseX<150) || (mouseX>250))){
     t = (int)(Math.random()* 100);
     ellipse(mouseX, mouseY, y+t, 2); 
     ellipse(mouseX, mouseY, 3, y+t); }
 
  if (((mouseY<50) || (mouseY>350))){
     v = v + 5;
     t = (int)(Math.random()* v);
     ellipse(mouseX, mouseY, y+t, 2); 
     ellipse(mouseX, mouseY, 3, y+t); }
 
  if (((mouseX<50) || (mouseX>350))){
     v = v + 5;
     t = (int)(Math.random()* v);
     ellipse(mouseX, mouseY, y+t, 2); 
     ellipse(mouseX, mouseY, 3, y+t); }
 
  if (((mouseY>=50) && (mouseY<=350)) && (v>0)) {
     v = v - 10;
     t = (int)(Math.random()* v);
     ellipse(mouseX, mouseY, y+t, 2); 
     ellipse(mouseX, mouseY, 3, y+t); }
 
  if (((mouseX>=50) && (mouseX<=350)) && (v>0)) {
     v = v - 10;
     t = (int)(Math.random()* v);
     ellipse(mouseX, mouseY, y+t, 2); 
     ellipse(mouseX, mouseY, 3, y+t); }
} 
