
;float x ;
float y ;
 float speed=4.5 ;

void setup () {
  size (400, 400 ) ;
  smooth () ;

 x= width/2 ;
 y= height/2 ;
}


void draw (){
  background (150 ) ;
 x+=random (-speed, speed ) ;
 y+=random (-speed, speed ) ;
  ellipse (x,y, 100, 100 ) ;
   }
  


