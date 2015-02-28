
size(400,300);
smooth();
background(#FF0000);
rectMode(CENTER);
for(int i = 0;i<100000;i++){
  fill(#FF0000);
  rect(random(width), random(height), random(width/2), random(width/2));
  }
  


randomSeed(1001);
strokeWeight(10);
stroke(0,140);
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));
line(0,random(400), 400, random(300));

PFont typewriter = loadFont("AmericanTypewriter-Bold-48.vlw");
textFont(typewriter);
fill(255);
textSize(60);
strokeWeight(4);
textAlign(LEFT);
text("Shannon",10,50);

textFont(typewriter);
fill(255);
textSize(60);
strokeWeight(4);
textAlign(LEFT);
text("Cervasio",135,290);

