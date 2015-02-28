
//left eyes x coordinate
int leye= 141;
int w=64;
int h= 64;





//right eye coordinates
int reye=365;


void setup()
{
  size(500, 500);
}



void draw()
{



  float c= map(mouseX, 0, width, 0, 255);  //white eyes

  float sc= map(mouseX, 0, width, 255, 0); // small black to white eyes

  float sw= map(mouseX, 0, height, 1, 6);          //strokeweight

  float lc= map(mouseX, 0, width, 255, 0); // stroke color



  background(0);

float step= map(mouseX, 0,width, 8,20);
 
  for (int i=111; i<173; i+=step)
// for (int i=111; i<173; i+=10)
  {
    smooth();
    stroke(255);
    strokeWeight(sw);
    fill(c);

    line(i, 0, i, 373);
  }
  for (int r=332;r<393; r+=step)
  {

    stroke(255);
    line(r, 0, r, 373);
  }

  float be= map( mouseX, 0, height, 300, 350); //bottome eyes


  //left eyes

  //MIDDLE EYES
  float me= map( mouseX, 0, height, 175, 240);
  stroke(lc);
  ellipse( leye, me, w, h); //m eye
  ellipse(reye, me, w, h);   //m  reye



  //Bottom EYES
  ellipse(leye, be, w, h);   // b eye
  ellipse(reye, be, w, h);   //b reye


  float le= map(mouseX, 0, height, 80, 110); //top eyes
  ellipse( leye, le, w, h);   //t eye
  ellipse(reye, le, w, h);   //t  reye








  //SMALL LEFT EYES


  float se= map (mouseX, 0, width, 358, 380); //LITTLE EYES
  {
    fill(sc);
    ellipse(se, le, 18, 18);  //little rt
  }

  float bl= map(mouseX, 0, height, 125, 160);

  smooth();
  fill(sc);
  ellipse( se, be, 18, 18);// small bottom eyes r
  ellipse( bl, be, 18, 18); //small bottom left
  ellipse(bl, me, 18, 18); //small lEFT Middle
  ellipse(se, me, 18, 18); //smallrm
  ellipse(bl, le, 18, 18); //Little lefttop
  fill(0);




  //mouth lines
  // float lm= map(mouseY,0, height, 376,500);

  fill(c);
  line(109, 376, 395, 376);
  line(124, 383, 374, 383 );
  line(148, 391, 351, 391 );
  line(168, 398, 325, 398 );
  line(189, 405, 311, 406);
  line(225, 413, 290, 413); 
  line(243, 421, 276, 421);
  
  
  

// { strokeWeight(5);
  //line(0,0,173,0);
  //line(0,373,173,373);
  //line(500,0,255,0);

   
  //MOUTH ellipse

  float m= map( mouseX, 0, width, 10, 200);
  float n= map (mouseX, 0, height, 20, 100); 




  ellipse( 260, 430, m, n );
}



