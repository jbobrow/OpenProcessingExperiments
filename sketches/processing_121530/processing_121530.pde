
//Nicholas Kiray, 09/11/2013
//This is my completed Mondrian

size (1022, 1047);
background (240,240,240);
stroke (0);
strokeCap (SQUARE);
strokeWeight (18);

 
  //top-right yellow box
  noStroke();
  fill (237,213,88);
  rectMode(CORNERS);
  rect (650,0, 980, 400);
  
  //yellow box bottom corner
 
  fill (237, 213, 78);
  rectMode (CORNERS);
  rect(0, 772, 130, 1080);
  
  //bottom-right hidden red
  fill (225, 25, 25);
  rectMode (CORNERS);
  rect(961, 780, 1022, 1047);
  
  //bottom-right blue box
  fill (20, 40, 200);
  rectMode (CORNERS);
  rect(650, 780, 980, 980);
  
  
  //re-doing stroke
  stroke (0);
  strokeWeight (18);
  
  
    //these are the horizontal lines from the top
    line (20, 120, 975, 120);
    line (20, 400, 975, 400);
    line (120, 650, 965, 650);
    line (20, 780, 1080, 775);
    line (400, 980, 975, 980);
    
    //these are the vertical lines in order from the left
    
    line (120, 120, 120, 1000);
    line (250, 20, 250, 120);
    line (400, 500, 400, 1047);
    line (650, 0, 650, 980);
    line (810, 400, 810, 650);
    line (970, 20, 970, 1020);
  
  //shapes
  fill (225, 25, 25);
  rectMode (CORNERS);
  rect(120, 120, 650, 650);
  
  fill (0, 0, 0);
  rectMode (CORNERS);
  rect(120, 650, 400, 900);
  
  fill (0,0,0);
  rectMode (CORNERS);
  rect (400, 900, 650, 980);
  
 



