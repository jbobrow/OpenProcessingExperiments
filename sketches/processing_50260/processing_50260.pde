
//left eyes x coordinate
int leye= 141;
int w=64;
int h= 64;


 
 
//right eye coordinates
int reye=365;
 
 
void setup()
{
  size(500, 500);
  background(0);
}
 
 
void draw()
{
  

  background(0);
  
  float sw= map(mouseX,0,height, 1,4);          //strokeweight
 
  for (int i=111; i<173; i+=10)
  {
    smooth();
    stroke(255);
    strokeWeight(sw);
 
    line(i, 0, i, 373);
  }
  for (int r=332;r<393; r+=10)
  {
   
    stroke(255);
    line(r, 0, r, 373);
    
  }
 
  float be= map( mouseY, 0, height, 300, 350); //bottome eyes
 
 
  //left eyes
  
    //MIDDLE EYES
  float me= map( mouseY, 0, height, 175, 240);
  ellipse( leye, me, w, h); //m eye
  ellipse(reye, me, w, h);   //m  reye
 
 
 
  //Bottom EYES
  ellipse(leye, be, w, h);   // b eye
  ellipse(reye, be, w, h);   //b reye
 
 
  float le= map(mouseY, 0, height, 80, 110); //top eyes
  ellipse( leye, le, w, h);   //t eye
  ellipse(reye, le, w, h);   //t  reye
 

  

 
 

 
 
  //SMALL LEFT EYES
  
   
  float se= map (mouseX, 0, width, 358, 380); //LITTLE EYES
  {
    fill(255);
  ellipse(se, le, 18, 18);  //little rt
  }
 
  float bl= map(mouseX, 0, height, 125, 160);
 
   fill(255);
  ellipse( se, be, 18, 18);// small bottom eyes r
  ellipse( bl, be, 18, 18); //small bottom left
  ellipse(bl, me, 18, 18); //small lEFT Middle
  ellipse(se, me, 18, 18); //smallrm
  ellipse(bl, le, 18, 18); //Little lefttop
  fill(0);
 
// float lm= map(mouseY,0, height, 376,500);

  line(109, 376, 395, 376);
  line(124, 383, 374, 383 );
  line(148, 391, 351, 391 );
  line(168, 398, 325, 398 );
  line(189, 405, 311, 406);
  line(225, 413, 290, 413); 
  line(243, 421, 276, 421);
 
 //MOUTH

float m= map( mouseY, 0, width, 10, 200);
  float n= map (mouseX, 0, height, 20, 100); 
  

  ellipse( 260, 430, m, n );
  

}
  



