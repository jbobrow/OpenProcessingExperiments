
// Ben Turner
// NYU-ITP, Intro to Computational Media

// Self-portrait.

// sets screen params
size(400, 400);
background(160,252,33);
smooth();

// circles coming from left side
noFill();
stroke(28,85,29);
strokeWeight(1);
for (int i=0;i<1000;i=i+10) {
  ellipse(0,200,i,i);
}

noStroke();

// green back
fill(0,100,1);
rect(80,200,300,300);

// purple back
fill(101,10,193,210);
rect(40,300,350,350);

// makes boxes for representing different colors for stages in my life
stroke(0);
strokeWeight(1);
int j = 0;
for (int i=0;i<400;i=i+50) {
  switch(j) {
    case 0:
      fill(148,0,255);
      break;
    case 1:
      fill(255,38,0);
      break;
    case 2:
      fill(53,100,227);
      break;
    case 3:
      fill(17,126,15);
      break;
    case 4:
      fill(255,190,8);
      break;
    default:
      fill(255);
      break;
  }
  j=j+1;
  if (j==6) {
    fill(255);
  }
  rect(i,110,50,50); 
  if (j==6) {
    PImage bodyImage;
    bodyImage = loadImage("txflag.jpg");
    image(bodyImage,276,111,49,49);
  }
  i=i+5;
}

stroke(0);
strokeWeight(6);

// sets font params and draws various text on upper part of image
PFont fontPortrait;
fontPortrait = loadFont("Helvetica-48.vlw");
textFont(fontPortrait, 160);
fill(0);
text("BENTURNER", -20, 100);
textFont(fontPortrait,30);
fill(255);
text("VICTORBENJAMINTURNER",100,50);
fill(0);
textFont(fontPortrait,25);
text("nyutsigeorgetownarmylonghornstexas",0,140);

// shoulders & body
PImage bodyImage;
bodyImage = loadImage("flag.jpg");
image(bodyImage,100,350,200,100);
noFill();
beginShape();
  vertex(100,400);
  vertex(110,350);
  vertex(290,350);
  vertex(300,400);
endShape(CLOSE);

// head background
noStroke();
fill(255,255,0);
rect(120,170,150,150);

// head background opacity
noStroke();
fill(250,150,0,150);
rect(150,160,150,200);

// left ear background
noStroke();
fill(105,220,232);
beginShape();
  vertex(255,230);
  vertex(295,225);
  vertex(290,300);
  vertex(260,295);
endShape(CLOSE);

// right ear background
noStroke();
fill(255,194,39);
beginShape();
  vertex(138,230);
  vertex(115,225);
  vertex(105,235);
  vertex(108,300);
  vertex(140,295);
endShape(CLOSE);

// left ear
strokeWeight(6);
stroke(0);
noFill();
beginShape();
  vertex(265,240);
  vertex(285,235);
  vertex(280,290);
  vertex(270,285);
endShape(CLOSE);

// head
stroke(0);
noFill();
ellipse(220, 270, 150, 200);

// right ear
beginShape();
  vertex(138,240);
  vertex(115,230);
  vertex(110,235);
  vertex(117,290);
  vertex(135,285);
endShape(CLOSE);

// nose
beginShape();
  vertex(205,245);
  vertex(215,270);
  vertex(195,270);
endShape();

// right eyebrow
line(150,200,190,210);

// right eye
ellipse(170,230,30,15);

// left eyebrow
line(210,210,240,200);

// left eye
ellipse(230,230,30,15);

// mouth
beginShape();
  vertex(180,300);
  vertex(220,300);
endShape(CLOSE);

