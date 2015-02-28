
void setup() {
size (800, 600);
background (128,0,128);
}
void draw() {
 
stroke (255);
strokeWeight (10);
line ( width/4,0, width/4, height ) ;
rect ( width/3,0, width/3, height ) ;
fill (0);
rect ( width/2,0, width/2, height ) ;
rect ( width/20,0, width/20, height ) ;

fill (255,0,0);
rect (width , height/3,0, height/3);
rect ( height/3,0,width , height/3);

rect ( height/5,0,width , height/5);
rect ( height/10,0,width , height/10);
fill (128);
rect (400,400,40,40, height/1,0,width , height/1);
}
//void mousePressed (){
  //saveFrame ("1.JPG");


//}





