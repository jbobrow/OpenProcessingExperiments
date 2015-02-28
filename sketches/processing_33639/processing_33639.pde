
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
 float webCurve=0;
 
 int r;
int L=800;
float A,x,y;



 Web(float _wFactor, float _hFactor) {
  wFactor=_wFactor;
  hFactor=_hFactor;
}

  

/***************************************************
****Function: Creates web one circle at a time*****
***************************************************/


int followWeb(float ptIncrement) { 

  //variable to track how many rings of web have been made
  int ringCounter=0;
  float blurInc=.05;

  //Follow curve 0-1 if the curve is 0
  if(webCurve==0)
  {
   curveCreate(0, wFactor, wFactor, 0, height, (height-hFactor), (.5*height+hFactor), .5*height, 0, .5*height);
  }

 //Follow curve 1-2
  else if (webCurve==1) 
  {
    curveCreate(0, wFactor, wFactor, 0, .5*height, (.5*height-hFactor), hFactor, 0, 0, 0);
  }
    
//Follow curve 2-3
  else if (webCurve==2) 
  {
    curveCreate(0, wFactor, .5*width-wFactor, .5*width, 0, hFactor, hFactor, 0, .5*width, 0);  
  }

//Follow curve 3-4
  else if (webCurve==3) 
  {
   curveCreate(.5*width, .5*width+wFactor, width-wFactor, width, 0, hFactor, hFactor, 0, width, 0);
  }

  //Follow curve 4-5
  else if (webCurve==4) 
  {
    curveCreate(width, width-wFactor, width-wFactor, width, 0, hFactor, (.5*height-hFactor), .5*height, width, .5*height);
  }
   
//Follow curve 5-6
  else if (webCurve==5)
  {
    curveCreate(width, width-wFactor, width-wFactor, width, .5*height, (.5*height+hFactor), (height-hFactor), height, width, height);
  }
  
  //Follow curve 6-7
  else if (webCurve==6) 
  {
    curveCreate(width, width-wFactor, .5*width+wFactor, .5*width, height, (height-hFactor), height-hFactor, height, .5*width, height);
  }
     
   
  //Follow curve 7-8
  else if (webCurve==7) 
  {
    curveCreate(.5*width, .5*width-wFactor, wFactor, 0, height, (height-hFactor), height-hFactor, height, 0, height);
   }
      
//once web is drawn
  else if(webCurve==8){
  webCurve=0; 
  return 8;
  }

//if hasn't reached end, returns 0
  return 0;
}


  
/***************************************************
****Function: Create spider to make the web *******
/***************************************************
void makeSpider(){
  
  /*
  fill(255,255,255,55);
  ellipse(cos(ellipseX)+ellipseX+width/40, ellipseY+height/80, height/80, width/75);
  ellipse(cos(ellipseX)+ellipseX+width/40.2, ellipseY+height/78.3, height/80, width/75);
  

}*/




/***************************************************
****Function: create each curve based on inputs ****
***************************************************/
void curveCreate(float bpx1, float bpx2, float bpx3, float bpx4, float bpy1, float bpy2, float bpy3, float bpy4, float curveEndX, float curveEndY)
{
  
  float blurInc=.005;
  float dotWidth;
  float dotHeight;
  
  //if on left or right side of web, position dots to be horizontal
  if (webCurve==0 || webCurve==1 || webCurve==4 || webCurve==5)
  {
   dotWidth=height/72.72;
   dotHeight=height/114;
  }
  
  
  //if on top or bottom of web, position dots to be vertical
  else
  {
    dotWidth=height/114;
    dotHeight=height/72.72;
  }

  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve);
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve);
  fill(255,255,255,255);
  
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
 
  
//if curve has reached end point within 1 of 0, half of height: increment webCurve to go on to next
  if (ptCurve>=.999)
  {
    
    webCurve+=1;
    ptCurve=0;
    
  }
 else if(ptCurve<.999)
 {
  //Motion blur 1
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+blurInc);
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+blurInc);
  fill(255,255,255,230);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //Motion blur 2
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(2*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(2*blurInc));
  fill(255,255,255,205);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //Motion blur 3
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(3*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(3*blurInc));
  fill(255,255,255, 180);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
   
   
  //Motion blur 4
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(4*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(4*blurInc));
  fill(255,255,255,155);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
   
  //Motion blur 5
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(5*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(5*blurInc));
  fill(255,255,255, 130);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //Motion blur 6
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(6*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(6*blurInc));
  fill(255,255,255,105);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //Motion blur 7
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(7*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(7*blurInc));
  fill(255,255,255,80);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //Motion blur 8
  ellipseX=bezierPoint(bpx1, bpx2, bpx3, bpx4, ptCurve+(8*blurInc));
  ellipseY=bezierPoint(bpy1, bpy2, bpy3, bpy4, ptCurve+(8*blurInc));
  fill(255,255,255, 55);
  ellipse(ellipseX, ellipseY, dotWidth, dotHeight);
  
  //increase place along curve
  ptCurve=ptCurve+ptIncrement;  
   
   
 }
 
 
  
  }

 
 //ends class  

  }

