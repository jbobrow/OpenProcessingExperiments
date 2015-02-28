
//Emily Wobb, ewobb
//copyight Wobb, Pittsburgh

//box
size(400, 400);
smooth();
background(110,175,252);

//truck body before back wheel well
fill(184,238,252);
noStroke();
beginShape();
vertex(100, 165);
vertex(100, 120);
vertex(150, 120);
vertex(175, 80);
vertex(210, 80);
vertex(210, 120);
vertex(300, 120);
vertex(300, 165);
vertex(275, 165);
endShape();

//back wheel well
fill(110,175,252);
arc(250,165,50,50,radians(180),radians(360));

//line between wheel wells
beginShape();
 vertex(225, 165);
 vertex(170, 165);
 endShape();
 
 //front wheel well
 arc(145, 165, 50,50, radians(180), radians(360));
 
 //line between front wheel well and grill
 beginShape();
  vertex(120,165);
  vertex(100, 165);
  endShape();
  
 //window
 stroke(113,137,134);
 fill(175);
  beginShape();
  vertex(162,115);
  vertex(178,90);
  vertex(200,90);
  vertex(200,115);
  vertex(162,115);
  endShape();
  
  //front tire
  noStroke();
  fill(108,116,118);
  ellipse(132, 235, 120,120);
  
  //back tire
  fill(108,116,118);
  ellipse(263,235,120,120);
 
 //back tire teal detail 
  fill(10,53,64);
  ellipse(263,235,80,80);
 
 //front tire teal detail 
  fill(10,53,64);
  ellipse(132,235,80,80);
  
  //back tire white detail
  fill(247,249,250);
  ellipse(263,235,70,70);
  
 //front tire white detail
  fill(247,249,250);
  ellipse(132,235,70,70);
 
//w
fill(229,208,201);
PFont Helvetica;
Helvetica = loadFont("HelveticaNeue-Bold-48.vlw");
textFont(Helvetica);
textMode(MODEL);
textSize(70);
text("w",235,255);

//e
textFont(Helvetica);
textMode(MODEL);
textSize(100);
text("e",103,260);

//orange diagonal detail
fill(245,63,2);
beginShape();
vertex(175,165);
vertex(215,120);
vertex(230,120);
vertex(190,165);
vertex(175,165);
endShape();

//green diagonal detail 
fill(169,232,224);
beginShape();
vertex(190,165);
vertex(230,120);
vertex(245,120);
vertex(205,165);
vertex(190,165);
endShape();

//saveFrame("hw1.jpg");

