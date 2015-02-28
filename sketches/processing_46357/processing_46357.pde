
PImage lupin1;
PImage lupin2;
PImage lupin3;
PImage lupin4;

float xpos;
float ypos;
float drag = 30;

void setup () {
  size (200,200);
  lupin1 = loadImage ("lupin1.gif");
  lupin2 = loadImage ("lupin2.gif");
  lupin3 = loadImage ("lupin3.gif");
  lupin4 = loadImage ("lupin4.gif");
}
void draw() {
  background (255);
  //if (mousePressed == true) {
    //image(lupin4, xpos, ypos);   //aca poner imagen 1
  //} else {
    //image(lupin3,xpos,ypos);  //aca poner imagen 2
  //} else {
   // image(lupin2, xpos,ypos);
  //} else {
    //image {lupin1, xpos,ypos);
    //}
   //rect(25, 25, 50, 50);

   if (mousePressed == true) {
  image (lupin2,xpos, ypos);
}else{
  image (lupin1, xpos, ypos);
}
}
  //}  else {
    //lupin3 = loadImage ("lupin3.gif");
  //} else {
    //lupin4 = loadImage ("lupin4.gif");
  //}



