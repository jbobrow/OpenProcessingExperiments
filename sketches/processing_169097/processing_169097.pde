

  size (600,600);
  background(0);



  PFont f1; 
  f1 = loadFont("ChalkboardSE-Light-48.vlw");
  translate(width/2, height/2);
  for (int i=0; i<100; i++){ 
    textFont (f1);
    fill(#74F5CF);
    textSize(i+3);
    rotate (radians(10));
    text("U", i ,i);
  }
