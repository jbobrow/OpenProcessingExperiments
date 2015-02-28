
//processing.org
size(367,549);
smooth();
background(5, 23, 134);

fill (255, 236, 21);
arc (180,150,180,180,radians(0),radians(360));

fill (0);

ellipse(140, 120, 25, 50);
ellipse(180, 100, 25, 50);
ellipse(220, 120, 25, 50);


  ellipse(110, 180, 20, 10);
  ellipse(250, 180, 20, 10);
  noFill();
  
  fill(0);
  
  bezier(110, 180, 180, 230, 180, 230, 250, 180);



PFont bayFont;
bayFont = loadFont("nice.vlw");
textFont(bayFont);

fill(255);
text("Have a nice end of the world.", 70, 330);

PFont tayFont;
tayFont = loadFont("evo.vlw");
textFont(tayFont);

fill(255);
text("EVOLUTION", 20, 440);

