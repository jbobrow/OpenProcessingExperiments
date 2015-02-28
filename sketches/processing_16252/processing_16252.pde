

void setup() {
  size(screen.width, screen.height);
  background(0);
  smooth();
}

void draw() {
}

void keyPressed () {

  fill(random(255),random(255),random(255));
  translate(random(width),0);

  for (int i = 0; i < 100; i++) {
  ellipse(random(-10,10),i*10,  random(50,500),random(500,100));
 }
}
void mousePressed(){
    fill(random(255),random(255),random(255));
  translate(random(width),0);
for (int j = 0; j < 100; j++) {
  rect(random(-10,10),j*10,  random(150,300),random(200,300));
}
}
void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}

