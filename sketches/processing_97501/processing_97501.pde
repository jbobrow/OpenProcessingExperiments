
//Victória Yumi Shimakawa
 size (200,200);
 background (38,245,12);
  
 int x;// arco
 for( x= -200; x<200; x+=20){
  strokeWeight (6);
  stroke(255);
   point (x+100, x*x/100+100);
 }
 
 for(int y= 50; y<120; y+=10)
 {
   noStroke ();
   fill(y*60,y*60,255,y*2);
   ellipse((y+10*2), 60,30,30);
 }
