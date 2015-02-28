

PImage foto;

void setup(){
  size(screen.width,screen.height);

  foto= loadImage("0.jpg");

}

void draw(){
  image(foto,0,0,width,height);
  smooth();
  for(int j=0; j<50; j++){
    for(int i=0; i<50; i++){
      float d=dist(50*i,50*j,mouseX,mouseY)/10;
      fill(random(240),random(25),random(40));
      ellipse(80*i,80*j,80-d,80-d);
    }    
  }
}

void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}


