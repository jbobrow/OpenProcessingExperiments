
void setup() {
  size(800,600);
}

void draw() {
  background(0);
  translate(400,300);
  scale(random(1,3));
  coracao();
}


void coracao() {
  fill(250,13,13);
  noStroke();
  translate(-140,-100);
  ellipse(100,100,100,100);
  ellipse(175,100,100,100);
  triangle(135,220,63,135,215,130);

}
void mouseClicked(){
save("tela" + hour()+second()+ ".jpg"); 
}




