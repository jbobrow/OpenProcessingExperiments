

float bolita = 1;
void setup(){
  size(600,600);
}

void draw(){
  println(mousePressed);
  fill(0,5);
  rect(0,0,width,height);
  fill(255);

  if (mousePressed) {
    ellipse(mouseX, mouseY,50,50);

  }
  

  //ellipse( bolita , 300 ,10,10);


}
