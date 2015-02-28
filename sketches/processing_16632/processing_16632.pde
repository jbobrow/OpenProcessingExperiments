
void setup(){
  size(800,600);

}

void draw(){
  background(255);
  for(int j = 0; j < 180; j++) {  
    for (int i = 0; i < 180; i++) {
      fill(10,i,j,100);
      ellipse(mouseX*j,mouseY*i, 50,50);
    }
  }
}
void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}


