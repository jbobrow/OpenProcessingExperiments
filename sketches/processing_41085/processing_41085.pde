
void setup () {
  
  size(510,510);
  noStroke ();
  smooth ();

}

void draw () {

   background(mouseX/2);
   int alfa=height/2;
  int b=height/4;
  int c=height/8;
  int w=40;
  fill (mouseX/2,mouseY/2,100);
  

               ////////////////////

  int a=height/2;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
  a=height/4;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
  a=height/8;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
 a=height/8*3;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
   a=height/8*5;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
 a=height/8*6;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
   a=height/8*7;
  ellipse(a,alfa,w,w);
  ellipse(a,b,w,w);
  ellipse(a,c,w,w);
  ellipse(a,b*3,w,w);
  ellipse(a,c*3,w,w);
  ellipse(a,c*5,w,w);
  ellipse(a,c*7,w,w);
  
                        //////////
                        
  fill (mouseX/2,mouseY/2,100,70);
  ellipse(mouseX,mouseY,mouseX/2,mouseY/2);
  ellipse(mouseY,mouseX,mouseY/2,mouseX/2);
  ellipse(width-mouseX,height-mouseY,mouseX/2,mouseY/2);
  ellipse(height-mouseY,width-mouseX,mouseY/2,mouseX/2);
 ellipse(width-mouseX,height-mouseY,width-mouseX/2,height-mouseY/2);
 ellipse(height-mouseY,width-mouseX,height-mouseY/2,width-mouseX/2);
 ellipse(mouseX,mouseY,width-mouseX/2,height-mouseY/2);
 ellipse(mouseY,mouseX,height-mouseY/2,width-mouseX/2);
  
}

