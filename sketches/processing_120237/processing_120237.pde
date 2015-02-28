
void setup()
{
   size(500,500);
PImage a = loadImage("sw.jpg");
image(a,0,0,500,500);
}


void draw() {
  
  
  //joda stick
  if (keyPressed) {
    if (key == 'j' || key == 'J') {
      PImage b = loadImage("joda.gif");
image(b,mouseX,mouseY,100,100); 
    }
 }
  //c3p0 stick
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      PImage c = loadImage("c3.gif");
image(c,mouseX,mouseY,100,100);    
    }}
    //r2d2 stick
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      PImage d = loadImage("r2.gif");
image(d,mouseX,mouseY,100,100);    
     }  
   }
       //darth vader stick
  if (keyPressed) {
    if (key == 'D' || key == 'd') {
      PImage e = loadImage("dv.gif");
image(e,mouseX,mouseY,100,100);    
     }  
   }
   
       //wingr stick
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      PImage f = loadImage("wing.gif");
image(f,mouseX,mouseY,100,100);    
     }  
   }
   //puntero normal
    if (mousePressed){
           fill(random(0,255),random(0,255),random(0,255));
    ellipse(mouseX,mouseY,50,50);
  }
   
       //por si no te gusta lo que has hecho
  if (keyPressed) {
    if (key == 'B' || key == 'b') {
      PImage k = loadImage("sw.jpg");
image(k,0,0,500,500);}   
     }  
   }



