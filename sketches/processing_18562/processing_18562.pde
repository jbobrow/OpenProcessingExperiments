

//purple
void setup(){
  size(300,300) ;

}

float x = 120 ;

//purple figure
void draw () {
    background (255) ;
    smooth ();
     stroke (255) ;
  fill (126,57,170) ;
  rect (0,height/2,mouseX,20) ;

//red circle
fill (255,0,0) ;
ellipse (x,height/2,50,50) ;

//yellow shape x+50
fill (250,255,10) ;
rect (x+50,height/2,x+55,height/2);

//blue shape x*2
fill (0,0,255) ;
rect (x*2,height/2,7,x*2) ;

//green shape
fill (0,255,0) ;
rect (width-x,height/2,14,height/2) ;

//orange shape
fill (255,129,10) ;
rect (x/2,height/2,21,height/2) ;
}

