
/*
Assignmet 1_Lama
*/
void setup (){
size(430, 430);

//Body
fill(0);
stroke(225);
triangle(150, 150, 50, 250,150,350);
triangle(150, 150, 280, 300, 150, 400);
triangle(280, 300, 280, 430, 75, 430);

//The ears
triangle(0, 0, 75, 75, 0, 150);
triangle(150, 0, 75, 75, 150, 150);

//The Tail

shearX(PI/-4.0);
rect(710, 380, 100, 50);

//The face
rectMode (CORNER);
shearX(PI/4.0);
rotate(PI/4.0);
rect(107, 0, 106 , 106);


}
void draw() {
  //...
  frame.setTitle(mouseX + ", " + mouseY);
}


