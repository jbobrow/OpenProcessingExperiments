
void jogo(){
  image(fundoJogo,0,0);
  
  
  fill(#255BCB);
   textFont(fFinal2);
  text("SCORE:",455,350);
  textFont(fMenu);
  text(pontos,530,350);
  text(lives,50,350);
  quad1();
  quad2();
  quad3();
  quad4();
  quad5();
  quad6();
  quadVerde();
  if(lives<=0){
    estado=3;  
     }
}
void gameover(){
  background(#FFFFFF);
  textFont(fFinal);
  fill(#FF0000);
  text("GAME OVER",width/2,height/2);
  textFont(fPlay);
  text("click anywhere",440,320);
  text("to play again",440,340);
  textFont(fFinal2);
  text("SCORE:",50,340);
  textFont(fMenu);
  text(pontos,130,340);
  if(mousePressed){
  estado=1;
  lives=lives+4;
  pontos=0;
  lx=20;
  ly=20;
  la=20;
  ab=20;
  temp=0;
  rax=-600;
  a=random(600);
  b=random(400);
   xi=random(600);//sorteia posição do inimigo na tela
    yi=random(400); //caso ele enconste em vc, vc morre e ele resurge
    xa=random(600);//sorteia posição do inimigo na tela
    ya=random(400);//caso ele enconste em vc, vc morre e ele resurge
    xb=random(600);//sorteia posição do inimigo na tela
    yb=random(400);//caso ele enconste em vc, vc morre e ele resurge
    xc=random(600);//sorteia posição do inimigo na tela
    yc=random(400);//caso ele enconste em vc, vc morre e ele resurge
    xd=random(600);//sorteia posição do inimigo na tela
    yd=random(400);//caso ele enconste em vc, vc morre e ele resurge
    xe=random(600);//sorteia posição do inimigo na tela
    ye=random(400);//caso ele enconste em vc, vc morre e ele resurge

  
    }
}






