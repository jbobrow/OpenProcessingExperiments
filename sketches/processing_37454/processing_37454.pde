
void setup() {
  size(1000, 200);    // acá defino el tamaño
  smooth();
  background(0,0,00);    //
  mouseX=width/1;
  mouseY=height/1;
}
void draw(){
A ();
B ();
C ();
D ();
}
void A () {
  stroke(245,77,99,20);
         strokeWeight (2) ;
  line(width/1, height/1, mouseX, mouseY); 
}
void B () {
  stroke (82,227,100,20);

    line(width/900, height/900, mouseX, mouseY); 

}
void C () {
  stroke (145,143,132,20);
  
  line(width/900, height/1, mouseX, mouseY); 
}
void D () {
  stroke (244,245,87,20);
  
  line(width/1, height/900, mouseX, mouseY);
} 
void mousePressed() {
background(0,0,0);

}
void keyPressed(){
background (255,255,255);

}


                
