
void setup() {
  size(1024, 768);
  background(0,0,0);
  smooth();

}

void draw() {



float d = dist(pmouseX, pmouseY, mouseX, mouseY);
float winkel = 0;
float geschw = dist(mouseX,mouseY,pmouseX,pmouseY);
float durchmesser = geschw + 1;
float drehgeschwindigkeit =geschw * 10;
translate(mouseX, mouseY);
  

  if (mousePressed) {    
    stroke(255,255,0);
    winkel = winkel+drehgeschwindigkeit;
     println("wert von Winkel: "+winkel);

     //ABFOLGE: translate, rotate, scale
    translate(mouseX, mouseY); //Koordinatensystem auf Maus-Mitte
    rotate(radians(winkel));
    scale(1);
    
    line(0, 150, 0, d+10+20); 



 
  if (keyPressed) {
    if (key == 's') {
      saveFrame("picture-####.png");
    }
     }





}
}
