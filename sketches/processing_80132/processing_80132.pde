
PFont font;

void setup (){
  size (600,600);
 font= loadFont ("SegoePrint-Bold-48.vlw");
}



void draw (){
  
  background (80,0,126);
    smooth();
  
  
  float s= map (second(),0,60,0,600);
  float m= map (minute (),0,60,0,600);
  float h=map (hour(),0,24,0,600);
  
  float d=map (day (),1,31,0,600);
  float mh=map (month (),1,12,0,600);
  float y= map (year (),1950,2049,0,600);
  
  

textFont (font);
 textSize (25);
 text (year(),y,y);

 
 for ( int i= 0; i<width ; i+=10){
    
  strokeWeight (random(1,5));
  stroke (250,255,3,random (0,80));
  beginShape ();
  curveVertex ( y,y);
  curveVertex (y,y);
  curveVertex (i,0);
  curveVertex (y,y);
  curveVertex(y,y);
  endShape();
 }

  

text (month (),mh,mh);
 for ( int i= 0; i<width ; i+=10){
  

  strokeWeight (random(1,5));
  stroke (250,0,3,random (0,80));
  beginShape ();
  curveVertex ( mh,mh);
  curveVertex (mh,mh);
  curveVertex (i,0);
  curveVertex (mh,mh);
  curveVertex(mh,mh);
  endShape();
 }

  

text (day(),d,d);
 for ( int i= 0; i<width ; i+=10){
  

  strokeWeight (random(1,5));
  stroke (0,255,3,random (0,80));
  beginShape ();
  curveVertex ( d,d);
  curveVertex (d,d);
  curveVertex (i,0);
  curveVertex (d,d);
  curveVertex(d,d);
  endShape();
 }



text (hour(),h,h);
for ( int i= 0; i<width ; i+=10){
  
  
  
  strokeWeight (random(1,5));
  stroke (250,255,3,random (0,80));
  beginShape ();
  curveVertex ( h,h);
  curveVertex (h,h);
  curveVertex (i,height);
  curveVertex (h,h);
  curveVertex(h,h);
  endShape();
 }

  

text (minute (),m,m);
 for ( int i= 0; i<width ; i+=10){
  
  
  strokeWeight (random(1,5));
  stroke (250,0,3,random (0,80));
  beginShape ();
  curveVertex ( m,m);
  curveVertex (m,m);
  curveVertex (i,height);
  curveVertex (m,m);
  curveVertex(m,m);
  endShape();
 }

  

text (second(),s,s);
 for ( int i= 0; i<width ; i+=10){
  
  
  strokeWeight (random(1,5));
  stroke (0,255,3,random (0,80));
  beginShape ();
  curveVertex ( s,s);
  curveVertex (s,s);
  curveVertex (i,height);
  curveVertex (s,s);
  curveVertex(s,s);
  endShape();
 }

  for (int i=0; i<height;i+=10){
    stroke (255);
    strokeWeight (0.2);
    line(0,i,width,i);
    
//    text ( second(),0,i)
  }

  
}



 

 


