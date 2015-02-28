
//P111
void setup(){
  size(570,200);
  background(255);

}
void draw(){
  for(int x=0; x<5;x++){
    pushMatrix();
    translate(x*100, 0);
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
}

