
size(600, 400);
background(#FFFFFF);
smooth();
noStroke();
colorMode(HSB, 360, 100, 100);

for (int i=0; i<1000; i+=10) {
  ellipse(random(width), random(height), 50, 50);
  float myHue=random(200, 360);
  fill(myHue, 50, 100);
  noStroke();
}


PFont times= loadFont("Times-Italic-48.vlw");
textFont(times);
fill(#FF00D1);
text("Bacon ipsum dolor sit amet shoulder venison corned beef pork chop pork loin biltong short ribs pork belly ham hock. Flank tri-tip pancetta, biltong pastrami short ribs leberkas turducken turkey ham hock brisket ball tip. Meatball venison filet mignon pork hamburger pork chop. Turducken andouille meatloaf ham hock cow brisket corned beef, shankle tongue sirloin rump short loin.", random(width/2), random(height/2), 500, 600);


PFont treb= loadFont("Trebuchet-BoldItalic-48.vlw");
textFont(treb);
fill(#0BFA00);
textSize(20);
text("Tenderloin hamburger drumstick beef ribs, pastrami short ribs pork loin. Turkey meatball sirloin, rump flank kielbasa pork andouille brisket sausage cow hamburger. Drumstick boudin ham hock, corned beef venison rump jerky jowl shank tenderloin chuck tongue strip steak leberkas shankle. Brisket sausage shankle pork belly swine jowl.", 50, 60, random(width), 300);

for (int i=0; i<500; i+=50) {
  fill(#F25100);
  rect(random(width), random (height), 60, 60);
  float myHue=random(0, 255);
  stroke(myHue, 50, 100);
}


