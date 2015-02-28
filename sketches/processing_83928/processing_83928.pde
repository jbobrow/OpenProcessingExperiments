
// Manel Lopez,1DAM Escala Masiva
void setup(){
 size(400,400);
 noStroke();
 smooth();
 background(255);
  }
 
void draw(){
 for (int i = 0; i < 10; i++)
 {
   stroke(int(random(255)),int(random(255)), int(random(255)) );
line(mouseX,mouseY,10,10);
line(mouseX,mouseY,200,200);
 }
 fill (random(10),random(200),random(10),90);
 
 for (int x=0; x<10; x++)

 {
 if (mousePressed) rect(mouseX+random(-10,10), mouseY+random(-20,20), 90, 90);
 }
}


