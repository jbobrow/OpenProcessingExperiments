
float x,y;
void setup(){

  size(750,600);
  smooth();
  translate(375,300);
  noStroke();
  background(255);
  x= 2;
}

void draw(){



  //coração grande batendo
  // background(255,255,255);
  fill(random(255),0,0);
  translate(375,300);
  scale(random(0,1));
  cor();

  /*
  // background(255,255,255);
   fill(random(255),random (255),0);
   translate(100,300);
   scale(random(0,1));
   cor();
   */

  //corações ao redor
  fill(random(255),random (0),90);
  translate(-375,-300);
  translate(random(750),random(600));
  scale(random(0,0.8));
  cor();
  

  if (x>750){
    x=1;
  }

}
// fim do draw



// *******************************
// cor(): comando que desenha o coracao
// *******************************
void cor() {
  ellipse (-75,-50,199,199);
  ellipse (75,-50,199,199);
  triangle(-162,0,162,0,0,200);  
}


void mouseClicked() {
  save(random(1000)+".png");
}




