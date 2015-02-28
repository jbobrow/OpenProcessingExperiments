
//hw02
//copyright Risa Hiyama
//1.16.2014

//////////////////////////////////////////////////////

//change mode
//setup
  size(800,800);
  background (100);
  smooth();
  
//parameters
  float x = 100;
  float y = 200;
  float wd = 500;
  float ht = 400;
  float d = 2;
 
//draw the guide line
//strokeWeight( d/2 );
//noFill();
//rect (x,y,wd,ht);


//face line
  fill(255, 255, 240);
  strokeWeight (d*2);
  beginShape();
  curveVertex(x + wd/5*0.5 , y+ht/4*0.5); //a contole point
  curveVertex(x + wd/5     , y+ht/4/5  ); 
  curveVertex(x + wd/5*2   , y         ); 
  curveVertex(x + wd/5*4   , y+ht/4/2  ); 
  curveVertex(x + wd/5*4.3 , y+ht/4/4  ); 
  curveVertex(x + wd/5*4.5 , y+ht/4    ); 
  curveVertex(x + wd       , y+ht/4*2  ); 
  curveVertex(x + wd/5*4.5 , y+ht/4*3.5); 
  curveVertex(x + wd/5*3   , y+ht      ); 
  curveVertex(x + wd/5*1   , y+ht/4*3.8); 
  curveVertex(x + wd/5*0.2 , y+ht/4*3  ); 
  curveVertex(x            , y+ht/4*2  ); 
  curveVertex(x + wd/5*0.5 , y+ht/4*0.8); 
  curveVertex(x + wd/5     , y+ht/4/5  );
   curveVertex(x + wd/5*2   , y         ); 
  endShape ();

//nose
  noFill();
  strokeWeight (d*2);
  beginShape();
  vertex(x+wd/5*2  ,y+ht/4*1.4);
  vertex(x+wd/5*2  ,y+ht/4*2.4);
  vertex(x+wd/5*2.5,y+ht/4*2.4);
  endShape ();
 
rectMode(CORNERS);  // Set rectMode to CORNERS

//R right and left horizontal
  fill(250); //color black
  strokeWeight (d*2);
  rect(x+wd/5*.8 , y+ht/4*1.1, x+wd/5*1.7, y+ht/4*1.1 );
  rect(x+wd/5*2.6, y+ht/4*1.1, x+wd/5*3.5  , y+ht/4*1.1 );
  
//R arc
  fill(0); 
  ellipseMode(CORNER);  // Set ellipseMode is CORNER
  strokeWeight (d*2);
  arc(x+wd/5*1.292, y+ht/4*.9 , wd/12, ht/9, 0, PI);
  arc(x+wd/5*2.63 , y+ht/4*.9 , wd/12, ht/9, 0, PI);
  
//R line
  noFill();
  strokeWeight (d*2);
  beginShape();
  vertex(x+wd/5*1.4, y+ht/4*1.2);
  vertex(x+wd/5    , y+ht/4*1.5);
  endShape();
  beginShape();
  vertex(x+wd/5*2.9, y+ht/4*1.2);
  vertex(x+wd/5*3.3, y+ht/4*1.5); 
  endShape();
  
//mushtash
  strokeWeight (d*2);
  fill(0);
  beginShape();
  vertex(x+wd/5*1.6 ,y+ht/4*2.6);
  vertex(x+wd/5*1.5 ,y+ht/4*2.9);
  vertex(x+wd/5*3.2 ,y+ht/4*2.9);
  vertex(x+wd/5*3 ,y+ht/4*2.6);
  vertex(x+wd/5*1.6 ,y+ht/4*2.6);
  endShape ();
  

fill(255, 69, 0);
strokeWeight (d*0);
ellipse(x+wd/5*.3 , y+ht/4*1.7, wd/4, ht/5);  
ellipse(x+wd/5*3, y+ht/4*1.7, wd/4, ht/5);


//saveFrame( "theta.jpg" );


