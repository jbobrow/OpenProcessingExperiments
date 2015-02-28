
//Victória Yumi Shimakawa
 size (200,200);
 background (38,245,12);
 
 int x;// arco
 for( x= -200; x<200; x+=20){
  strokeWeight (6);
  stroke(255);
   point (x+100, x*x/100+100);

if ( x<150 && x>30) { //bolinhas
noStroke ();
  fill (14,140,12,92);
  ellipse (( x+5* 2), 60,30,30);
}
 }
