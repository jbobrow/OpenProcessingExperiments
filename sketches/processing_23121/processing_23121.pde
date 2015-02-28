
/**********CLASS***********/
 
  class Web {
 /***Variables*****/
 float wFactor;
 float hFactor;
 boolean minus=false;
 float ellipseX=.5*width;
 float ellipseY=.5*height;
 float t;
 float ptCurve=0;
 int webCurve=0;



 Web(float _wFactor, float _hFactor) {
  wFactor=_wFactor;
  hFactor=_hFactor;
}
  
 void weave(float ptIncrement)
{  
  
//resets stroke and fill for web
noFill();
stroke(255, 255, 255);
 strokeWeight(1.5);
 
 //adds to the 5th variable of the bezier point function
 ptCurve+=ptIncrement;
 
  //cleans the matrix
    pushMatrix();
  
  //Draws series of webs
 
 //Create series of 10 web rings 
 for(int i=0; i<10; i++){

  noFill(); 
   //0-1: side bottom left
    bezier(0, .5*height,  wFactor, (.5*height+hFactor), wFactor, (height-hFactor),  0, height);
    
  
  //1-2side top left
  bezier(0, 0,  wFactor, hFactor, wFactor, (.5*height-hFactor),  0, .5*height);
  
   //2-3: top left
   bezier(0,0, wFactor, hFactor,.5*width-wFactor, hFactor, .5*width,0);
   
   //3-4: top right
   bezier(.5*width, 0, .5*width+wFactor, hFactor ,width-wFactor, hFactor,width,0);
   
  //4-5: side top right
  bezier(width, 0,  width-wFactor, hFactor, width-wFactor, (.5*height-hFactor),  width, .5*height);
  
  //5-6: side bottom right
    bezier(width, .5*height,  width-wFactor, (.5*height+hFactor), width-wFactor, (height-hFactor),  width, height);
   
  //6-7: bottom right
   bezier(width, height, width-wFactor, height-hFactor, .5*width+wFactor, height-hFactor, .5*width, height);
   
   //7-8: bottom left
   bezier(.5*width, height, .5*width-wFactor, height-hFactor, wFactor, height-hFactor, 0,height);
   
   //scale the web ring and move down and to left
   scale(.75);
   translate(.25*height,.25*width);
   
 }
 
 //resets the matrix
  popMatrix();//resets the matrix
}




int followWeb(float ptIncrement){


int ringCounter=0;
ptCurve+=ptIncrement;

//Follow curve 0-1 if the curve is 0

if(webCurve==0){
  ellipseX=bezierPoint(0, wFactor, wFactor,0, ptCurve);
  ellipseY=bezierPoint(height, (height-hFactor), (.5*height+hFactor), .5*height, ptCurve);
  fill(255,255,0,155);
  ellipse(ellipseX, ellipseY, random(3,7), random(3,7));
  makeSpider();
  
  //if curve has reached end point within 1 of 0, half of height: increment webCurve to go on to next
  if ((ellipseX<=1 && ellipseX>=-1) && (ellipseY<=.5*height+1 && ellipseY>=.5*height-1))
  {
    webCurve+=1;
    ptCurve=0;
  }
 
}


//Follow curve 1-2
  else if (webCurve==1) {
    ellipseX=bezierPoint(0, wFactor, wFactor, 0, ptCurve);
    ellipseY=bezierPoint(.5*height, (.5*height-hFactor), hFactor, 0, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (0,0): increment webCurve to go on to next
      if ((ellipseX<=1 && ellipseX>=-1) && (ellipseY<=1 && ellipseY>=-1)){
        webCurve+=1;
        ptCurve=0;
      }
      
  }
 
//Follow curve 2-3
else if (webCurve==2) {
    ellipseX=bezierPoint(0, wFactor, .5*width-wFactor, .5*width, ptCurve);
    ellipseY=bezierPoint(0, hFactor, hFactor, 0, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (.5*width, 0): increment webCurve to go on to next
      if ((ellipseX<=.5*width+1 && ellipseX>=.5*width-1) && (ellipseY<=1 && ellipseY>=-1)){
        webCurve+=1;
        ptCurve=0;
      }
      
  }

   //bezier(.5*width, 0, .5*width+wFactor, hFactor ,width-wFactor, hFactor,width,0);
//Follow curve 3-4
else if (webCurve==3) {
    ellipseX=bezierPoint(.5*width, .5*width+wFactor, width-wFactor, width, ptCurve);
    ellipseY=bezierPoint(0, hFactor, hFactor, 0, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (width,0): increment webCurve to go on to next
      if ((ellipseX<=width+1 && ellipseX>=width-1) && (ellipseY<=1 && ellipseY>=-1)){
        webCurve+=1;
        ptCurve=0;
      }
    
  }

  //Follow curve 4-5

else if (webCurve==4) {
    ellipseX=bezierPoint(width, width-wFactor, width-wFactor, width, ptCurve);
    ellipseY=bezierPoint(0, hFactor, (.5*height-hFactor), .5*height, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (width,.5*height): increment webCurve to go on to next
      if ((ellipseX<=width+1 && ellipseX>=width-1) && (ellipseY<=.5*height+1 && ellipseY>=.5*height-1)){
        webCurve+=1;
        ptCurve=0;
      }
  }
    //     bezier(width, .5*height,  width-wFactor, (.5*height+hFactor), width-wFactor, (height-hFactor),  width, height);
//Follow curve 5-6
else if (webCurve==5) {
    ellipseX=bezierPoint(width, width-wFactor, width-wFactor, width, ptCurve);
    ellipseY=bezierPoint(.5*height, (.5*height+hFactor), (height-hFactor), height, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (width,height): increment webCurve to go on to next
      if ((ellipseX<=width+1 && ellipseX>=width-1) && (ellipseY<=height+1 && ellipseY>=height-1)){
        webCurve+=1;
        ptCurve=0;
      }
    
  }
  

  //Follow curve 6-7
else if (webCurve==6) {
    ellipseX=bezierPoint(width, width-wFactor, .5*width+wFactor, .5*width, ptCurve);
    ellipseY=bezierPoint(height, (height-hFactor), height-hFactor, height, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (.5*width, height): increment webCurve to go on to next
      if ((ellipseX<=.5*width+1 && ellipseX>=.5*width-1) && (ellipseY<=height+1 && ellipseY>=height-1)){
        webCurve+=1;
        ptCurve=0;
      }
      
  }
     
   //  bezier(.5*width, height, .5*width-wFactor, height-hFactor, wFactor, height-hFactor, 0,height);
  //Follow curve 7-8
else if (webCurve==7) {
    ellipseX=bezierPoint(.5*width, .5*width-wFactor, wFactor, 0, ptCurve);
    ellipseY=bezierPoint(height, (height-hFactor), height-hFactor, height, ptCurve);
    fill(255,255,0,155);
    ellipse(ellipseX, ellipseY, random(3,7),random(3,7));
    makeSpider();
    
    //if curve has reached end point within 1 of (0, height): increment webCurve to go on to next
      if ((ellipseX<=1 && ellipseX>=-1) && (ellipseY<=height+1 && ellipseY>=height-1)){
        webCurve+=1;
        ptCurve=0;
      }
      
  }//what to do once web is drawn
else if(webCurve==8){
  webCurve=0; 
  return 8;
  //webCurve=0; 
  
  
   

}


return 0;

}
  
 
 
 void moveWeb() {
   
   if(minus==false) {
   hFactor=hFactor-10;
   wFactor=wFactor-10;
   minus=true;
   }
   
   else if(minus==true){
   hFactor=hFactor+10;
   wFactor=wFactor+10;
   minus=false;
   }
//ends moveWeb  
}
  

void makeSpider(){
//fill(255,255,255,random(55,190));
//for(int z=0; z<3; z++){
  //ellipse(ellipseX+random(-25,25), ellipseY+random(-25,25), random(3,10), random(3,10));
//}
}

 //ends class  

  }

