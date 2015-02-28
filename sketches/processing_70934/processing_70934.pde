
size (500,500);
noStroke ();
smooth ();
background (0);

color white = color(255);
color grey = color (200);
color mint = color (#94FCC9);


 
fill (grey); // graey shape
beginShape ();
  vertex (250, 0);
  vertex (175, 250);
  vertex (250, 300);
  vertex (325, 250);
endShape();


fill (mint); // mint green shape
beginShape ();
  vertex (250, 500);
  vertex (175, 250);
  vertex (250, 300);
  vertex (325, 250);
endShape();

fill (white); //white triangle left
beginShape ();
  vertex (0, 250);
  vertex (250, 500);
  vertex (0, 0);
  vertex (0, 250);
endShape();


fill (white); //white triangle right
beginShape ();
  vertex (250, 500);
  vertex (500, 250);
  vertex (500, 0);
  vertex (250, 500);
endShape();



for (int i = 0; i<= width; i++){
  stroke (i*20.0 / width);
 
  line (0, i, width, height);
  line (i, 0, width, height);
  line (500, i, width, height);

  PImage blockHead = loadImage("blockhead.jpg");
  image (blockHead, 0, i, width, height);

  

  
 
  

}  



