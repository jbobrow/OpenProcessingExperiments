
size (600, 900);
background(#5A5A5A);


colorMode(HSB, 360, 100, 100);
ellipseMode(RADIUS);
smooth();
noFill();


for (int i=10; i <1000; i++) {
  ellipse(random(width), random(height), random(width/100), random(height/10));
  float myhue=random (#FFD500);
  stroke(myhue, 255, 0);
  strokeWeight(1);
}

fill(27, 0, 99, 50);
for (int i=10; i <1000; i++) {
  rect(random(width), random (height), random(width/10), random (height/10));
  float myhue=random (#FFD500);
  stroke(myhue, 255, 0);
  strokeWeight(1);
}


colorMode(RGB);

PFont TriplexSerifExtrabold = loadFont ("TriplexSerifExtrabold-48.vlw");
textFont(TriplexSerifExtrabold);
textAlign(LEFT);

fill(#FFFFFF); //first paragraph
textSize(17);
textLeading(20);
text("Pork hamburger andouille pork chop leberkas short loin salami. Frankfurter jowl tongue strip steak, ribeye drumstick rump tri-tip. Ball tip ham hock short loin chuck pork chop jowl ground round turkey swine meatball t-bone hamburger tongue drumstick. Pastrami fatback ground round filet mignon beef salami beef ribs.", 50, 60, 500, 600);

fill(250, 110, 45); //center paragraph
textSize(21); 
textLeading(35);
text("Ground round jerky shank, pork loin corned beef jowl andouille. Turducken cow rump andouille, corned beef prosciutto spare ribs drumstick fatback meatball tri-tip filet mignon. Boudin fatback cow spare ribs t-bone shoulder short ribs meatloaf pig frankfurter capicola short loin hamburger. Pork shoulder t-bone ball tip tri-tip short ribs leberkas pig meatball pancetta beef ribs jerky brisket chicken. Spare ribs kielbasa ribeye turducken pork meatball venison strip steak filet mignon jowl bacon tail rump. Leberkas tail pork belly bresaola.", 125, 205, 430, 600);

textSize(70); // vertical bacon
textLeading(98);
fill(#FA7100);
text ("BACON", 50, 200, 50, 900);

fill(#FFFFFF); // last paragraph
textSize(17);
textLeading(20);
text("Boudin corned beef fatback hamburger, capicola jowl drumstick chicken rump meatloaf prosciutto swine pastrami pig flank. Hamburger ham kielbasa frankfurter jowl short loin tenderloin corned beef fatback drumstick pork ribeye tail turducken. Strip steak shankle prosciutto meatball beef ribs. Pig cow shoulder fatback, chuck turkey ham pork loin. Short loin frankfurter meatball pig venison cow t-bone pork loin prosciutto shank. Strip steak pastrami pork chop, drumstick corned beef pancetta capicola pork belly tail t-bone bresaola turkey pork loin meatball turducken.", 50, 675, 500, 900);

colorMode(HSB, 360, 100, 100);
noFill();


