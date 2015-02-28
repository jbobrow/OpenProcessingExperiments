
//P1G1

void setup() {
  size(930,375);
  smooth();
  background(255);
}
void draw() {
 //shapes
  for(int i=0; i<3; i++){
    pushMatrix();
    translate(i*300,0);
    stroke(255);
    strokeWeight(1);
    fill(157,37,37);
    quad(60,40,40,80,80,100,80,80);
    fill(234,115,54);
    triangle(60,40,120,60,80,80);
    fill(234,205,54);
    quad(120,60,140,100,120,120,80,80);
    fill(25,155,112);
    quad(120,120,80,80,80,120,100,160);
    fill(41,101,178);
    quad(80,120,100,160,60,140,60,120);
    fill(62,66,206);
    quad(60,140,60,120,80,100,40,80);
    fill(117,43,170);
    triangle(60,120,80,100,80,120);
    popMatrix();
    }
 //glide
  for(int i =0; i <3; i++){
    pushMatrix();
    translate(i*300, 0);
    fill(157,37,37);//red
    quad(190,290,230,270,230,290,210,330);
    fill(234,115,54);//orange
    triangle(210,330,230,290,270,310);
    fill(234,205,54);//yellow
    quad(270,310,230,290,270,250,290,270);
    fill(25,155,112);//green
    quad(270,250,230,290,230,250,250,210);
    fill(41,101,178);//blue
    quad(250,210,230,250,210,250,210,230);
    fill(62,66,206);//blue-purple
    quad(210,230,210,250,230,270,190,290);
    fill(117,43,170);//purple
    triangle(210,250,230,250,230,270);
    popMatrix();
 }
}


