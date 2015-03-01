
/* @pjs preload="skull.png"; */

  size(400, 400);
  background(0);
  PImage img;
  img = loadImage("skull.png");
  image(img,0,0,400,380);
  PImage slice = get(180,0,40,370);
  tint(220,250,220,180);
  
  pushMatrix();
  rotate(PI/2);
  translate(300,-420);
  image(slice,0,-215);
  popMatrix();
  
  pushMatrix();
  rotate(-PI/2);
  translate(-300,420);
  image(slice,-40,-655);
  popMatrix();
  
  tint(200,150,150,200);
  image(slice,0,15);
  image(slice,360,15);
  
  tint(100,199,220,150);
  image(slice,320,-10);
  image(slice,40,-10);
  


