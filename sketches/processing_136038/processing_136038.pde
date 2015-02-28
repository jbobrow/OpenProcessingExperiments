
boolean forma= false;

void setup (){
 size(600,400);
background(129,129,129); 
smooth(50);
}

void draw() {
 if (forma== true) {
   noStroke();
   ellipse(mouseX,mouseY, 120,120 );
   fill(random(255),random(255),random(255),25);
 } else{
   noStroke();
   rect (mouseX,mouseY, 60, 60);
   fill(random(255),random(255),random(255),25);
}
}
void mouseReleased (){
 if (forma== false) {
   forma=true;

}
  else if (forma==true){
    forma= false;
  
  
}
}

  void keyPressed (){
  if (key=='b')
   save("miImagen.png");
}


