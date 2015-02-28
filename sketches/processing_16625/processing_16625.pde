
void setup(){
  size(screen.width,screen.height);
  smooth();
  background (180,random(9),100);
}

void draw(){

  fill(random(35),random(130),random(247));
  for (int i = 0; i < 700; i++) {
    ellipse(mouseX/1000*i,mouseY/2*i, millis()/0.1,i/1);  
    //varia:espaçamento, cores, tamanhos.
  }
  rect(0,0,screen.width,20);
}

void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}

