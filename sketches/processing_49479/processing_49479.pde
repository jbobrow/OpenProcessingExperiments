


void ufo() { 

//******************************************************************************************************************         PUSHPUSH
 pushMatrix();

 translate(width/2,0);
rot += 1; 
  rotate(radians(rot));
  if (maxUfoLife>0){
    fill (0,0,255,25); 
   ellipse (0,0,425,425); 
   noFill();
  }
    image (UfoIm, 0, 0, 400, 400);
    image (UfoIm, -250, 0, 40, 40);
    image (UfoIm, 250, 0, 40, 40);
    image (UfoIm, 0, 250, 40, 40);
    image (UfoIm, 0, -250, 40, 40);
   

popMatrix();
//******************************************************************************************************************         POP POP
}
//******************************************************************************************************************       LIFE MINE
void lifeIndic (){
  stroke (255,0,0);
  strokeWeight(3);

 rect (width/2,height-50,100,15); 
  noStroke();
  fill (255,0,0,191);
  rect (width/2,height-50,maxLife,15); 
 noFill(); 
  
}
//******************************************************************************************************************       LIFE UFO
void lifeIUFO (){
  stroke (0,0,255);
  strokeWeight(3);

 rect (width/2,25,100,15); 
  noStroke();
  fill (0,0,255,191);
  rect (width/2,25,maxUfoLife,15); 
 noFill(); 
  
}

void hitTest(){
  //this part is completely deleted as I did not manage to make it work (I believe simply becasue of the rotation/pushmatrix stuff...sorry
  
  
}

