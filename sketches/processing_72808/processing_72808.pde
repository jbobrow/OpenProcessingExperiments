
size (500, 800);
background(#08FC88);


colorMode(HSB);
ellipseMode(RADIUS);
smooth();
noFill();

for (int i=70; i <170; i++) {
  ellipse(random(width), random(height), random(width), random(height));
  float myhue=random (#CF08FC);
  stroke(myhue, 255, 255);
  strokeWeight(1);
}


PFont font;
font = loadFont("Apercu-Medium-72.vlw");
textFont(font, 72);
fill(#025558);
text("jigsaw",50,160);
fill(#025558);
text("sketch",50,240);
fill(#025558);
text("rome",50,320);
fill(#025558);
text("orthopedic",50,400);
fill(#025558);
text("aggression",50,480);
fill(#025558);
text("celluar",50,560);
fill(#025558);
text("bravado",50,640);


