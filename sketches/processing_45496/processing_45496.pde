
//dana gloria 
//9 November 2011
//Translations & Rotations 

void setup ()
{
  size(600, 600);
background (0);
smooth();


stroke(255);
strokeWeight(6);
strokeJoin(MITER);
strokeCap(PROJECT);
  


  // draw the original position in gray
  fill(255,242,8,128);
  rect(20, 20, 80, 80);
  
  // draw a translucent red rectangle by changing the coordinates
  fill(255, 0, 0, 128);
  rect(20 + 100, 20 + 100, 100, 100);
 
  
    fill(255,243,3,128);
  rect(20 + 170, 20 + 170, 130, 130);
  
   fill(255);
  rect(20 + 150, 20 + 150, 60, 60);
  
    fill(10,8,250,128);
  rect(20 + 230, 20 + 230, 150, 150);

  
 
  fill(255,0,0,110);
  rect(20 +260, 20 + 260, 70,70);
  
    fill(255);
  rect(20 +300, 20 + 300, 80,80);
  
    fill(255,243,3,120);
  rect(20 +350, 20 + 350, 60,60);
  
    fill(10,8,250,130);
  rect(20 +390, 20 + 390, 80,80);

  
    fill(255,0,0,110);
  rect(20 +430, 20 + 430, 100,100);
  
   fill(255,243,3,120); 
  rect (20 + 535, 20 + 535, 30,30); 
  
    fill(255);
  rect(20 +500, 20 + 500, 50,50);
  
 
 
 
  
  // draw a translucent blue rectangle by translating the grid
  fill(10,8,250,180);
  pushMatrix();
  translate(60, 80);
  rect(0, 5, 60, 60);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (185,185,185); 
  rect (25,15,30,30);
  popMatrix();
  
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,243,8); 
  rect (55,45,50,50);
  popMatrix();
  
  pushMatrix ();
  translate (70,70); 
  rotate (radians (45)); 
  fill (0,0,255); 
  rect (75,92,70,70);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255); 
  rect (190,80,60,60);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,0,0); 
  rect (175,160,80,80);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,243,8); 
  rect (270,105,100,100);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (0,0,255); 
  rect (280,220,120,120);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255); 
  rect (400,120,90,90);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,0,0); 
  rect (320,180,80,80);
  popMatrix();
  
  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,243,8); 
  rect (460,60,60,60);
  popMatrix();
  
   pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (0,0,255); 
  rect (520,100,60,60);
  popMatrix();
  
   pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255,0,0); 
  rect (580,90,40,40);
  popMatrix();
  
   pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
  fill (255); 
  rect (620,80,30,30);
  popMatrix();

  pushMatrix ();
  translate (50,50); 
  rotate (radians (45)); 
 fill(255,243,3);
   rect (650,70,25,25);
  popMatrix();
}



