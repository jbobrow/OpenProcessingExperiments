
ParticleEngine pe;

void setup(){
  size(680, 480, P2D);
  //frameRate(1500);
  background(32);
  pe = new ParticleEngine();
  pe.createExplosion(width/2, mouseY);
}

void draw(){
  int bg = 8;
  background(bg);
  pe.update();
  
  //alpha-gradient at the fron
  for (int i=0; i < width; i++) {
    if(i <= width/2){
      stroke(bg, bg, bg, 255 - (i) + 200);
    }else{
      stroke(bg, bg, bg, (i) - width/3);
    }
    line (i, 0, i, height);
  }
  
}

void mouseClicked(){
  //pe.createExplosion(width/2, mouseY);
}


