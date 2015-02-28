
PImage nuvem;

void setup(){
  size(800,800);
  background(0,0,0);
  nuvem = loadImage("cloud.jpg");
}
void draw(){
  background(0,0,0);
  fill(0,0,0,10);
  rect(0,0,800,800);
  for (int i = 0; i < nuvem.width; i+=5) {
    for (int j = 0; j < nuvem.height; j+=5) {
      color cor = nuvem.get(i,j);
      float tamanho = dist(mouseX,mouseY, i*2, j*2)/10.0;
       
      stroke(cor);
      noFill();
     
    rect(2*i, 2*j, tamanho, tamanho);
    }
  }
}
void mouseDragged(){
  fill(random(5), random(4), random(80, 0), 8);
  ellipse(mouseX,mouseY,400,400);
}


