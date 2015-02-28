
class huevo{
  float piX, piY, piW;
  
  huevo(float piX_,float piY_,float piW_){
    piX = piX_ ;
  piY = piY_ ;
  piW = piW_;
  }
  
  void draw(){
//huevo
fill(255, 252, 148);
stroke (20);
ellipse (piX,piY ,piW*3/4,piW);
// reflejo
fill(252,250,212);
noStroke();
ellipse( piX,piY,piW/16, piW/4);
ellipse( piX,piY,piW/4, piW/16);

// lo mueve
piX = piX + 1;

}
}

