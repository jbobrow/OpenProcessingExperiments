

void setup(){
  size(screen.width,screen.height);
  background(34,255,14);
}

void draw(){

  smooth();
  for(int j=0; j<50; j++){
    for(int i=0; i<50; i++){
      float d=dist(50*i,50*j,mouseX,mouseY)/10;
      fill(random(255),random(39),random(15));
      ellipse(80*i,80*j,2-d,2-d);
    }    
  }
}

void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}



