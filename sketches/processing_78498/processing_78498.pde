
PImage mortal;
float mx,my;
void setup() {
  size(600,600);
  background(12, 12, 12, 0);
  mortal=loadImage("Mortal.png");
 
}
void draw() {
   
 // background(15, 15, 15, 0);
  fill(0,0,0,10);
  rect(0,0,600,600);
  for (int i = 0; i < mortal.width; i+=5){
    for (int j = 0; j < mortal.height; j+=5) {
      color cor = mortal.get(i,j);
      float tamanho = dist(mouseX,mouseY, i*2, j*2)/10.0;
       
      stroke(cor);
      noFill();  
      ellipse(2*i, 2*j, tamanho, tamanho);
    }
  }
 
}
void mouseDragged(){
   fill(random(91), random(41), random(80), 5);
  ellipse(mouseX,mouseY,600,600);
 //mx = mouseX;
  //my = mouseY;
}



