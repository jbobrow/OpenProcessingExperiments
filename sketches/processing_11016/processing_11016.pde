


PImage torre, pena, falaGalileu, falaNewton, falaAristoteles;
float y,x, speed, speed2, gravidade, pX, pY, resAr;

void setup(){
  torre = loadImage("colagemok.jpg");
  pena = loadImage("penaMini.png");
  falaGalileu=loadImage("falaGalileu.png");
  falaNewton=loadImage("falaNewton.png");
  falaAristoteles=loadImage("falaAristoteles.png");
  size(torre.width, torre.height, P2D);
  y = height/2;
  pY= height/2;
  resAr=0.1;


}
void draw(){

  float pmX=mouseX;
  float pmY=mouseY;
  println(pmX +" "+ pmY);


  image(torre, 0, 0);
  ellipseMode(TOP);
  speed = 1 + gravidade;
  speed2= 0.1+gravidade*resAr;
  gravidade=0;

  fill(60);
  ellipse(width/5, y,20,20);
  fill(20);
  ellipse (width/5+35, y-40,60,60);
  pX=width/3;

  //tint(255,127);
  image(pena,pX, pY);
  pY=pY+speed2;
  pY= constrain(pY,height/2, height-30);
  //while(pY<height-30){
  // pX=random(width/2-2,width/2+2);
  //}
  gravidade = 0.4*y/30;
  y=y+speed;
  y = constrain(y, height/3,height-30);
  if (y>height-30){
    y=height-30;
    gravidade = 0;

  }
  else if(mousePressed||keyPressed){
    y = height/2;
    pY= height/2;
    //println("denovo");
  }
  else if(mouseX>95&&mouseX<164 && mouseY>245&&mouseY<295){
    image(falaGalileu,175,258-falaGalileu.height);

  }
  else if(mouseX>609&&mouseX<787 && mouseY>218&&mouseY<401){
    image(falaNewton,614-falaNewton.width,324-falaNewton.height);
  }else if(mouseX>619&&mouseX<681 && mouseY>521&&mouseY<665){
    image(falaAristoteles,614-falaAristoteles.width,
    624-falaNewton.height);
  }

}




