
void back() {

  noFill();
  int r,g,b,r1,g1,b1,r2,g2,b2,cX,cY,c4;
  //different red, green and blue variables to make several transtions from color to color in the same loop  
  strokeWeight (2);
  int loopRadius=width/2;
  cX=width/2; //cX and cY are the center of the color change
  cY=height/2;
  c4=0;
  while (c4<loopRadius){
    
    r=255;
    g=255-130*c4/loopRadius;
    b=0+130*c4/loopRadius;
   stroke(r,g,b);
   ellipse(cX,cY,c4,c4);
   
   r1=255-80*c4/loopRadius;
   g1=125-100*c4/loopRadius;
   b1=130+50*c4/loopRadius;
   stroke(r1,g1,b1);
   ellipse(cX,cY,c4+loopRadius,c4+loopRadius);
   
   r2=175-25*c4/loopRadius;
   g2=25-25*c4/loopRadius;
   b2=180+20*c4/loopRadius;
   stroke(r2,g2,b2);
   ellipse(cX,cY,c4+2*loopRadius,c4+2*loopRadius);
   
    c4++;
  }
  
}

