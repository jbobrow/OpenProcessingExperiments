
//Nicole Del Senno
//N00211488
//Recreation of Kandinsky’s Transverse Line

size(580,400);
background(255,228,181);

//center triangle
fill(238,220,130);
noStroke();
triangle(180,2,468,180,252,360);

//main quadrilateral
fill(92,64,51);
beginShape();
  vertex(144,144);
  vertex(252,160);
  vertex(72,390);
  vertex(15,200);
endShape(CLOSE);

//circle at right
noFill();
stroke(0,0,0);
strokeWeight(3);
ellipseMode(CORNER);
ellipse(360,72,200,200);

//orange circle in gray
noStroke();
fill(200,200,200);
ellipseMode(CENTER);
ellipse(472,27,50,50);
fill(255,127,0);
ellipse(472,27,36,36);

stroke(0,0,0);
line(40,390,504,2);
strokeWeight(6);
line(460,5,480,60);

//curves
noFill();
strokeWeight(5);
bezier(340, 380, 300, 260, 396, 360, 400, 252);
bezier(400,252,400,252,410,200,560,300);
fill(0,0,0);
bezier(400,252,255,100,504,10,550,130);

//quadrilateral within other
fill(255,228,181);
noStroke();
beginShape();
  vertex(72,180);
  vertex(180,182);
  vertex(120,324);
  vertex(36,270);
endShape(CLOSE);

strokeWeight(6);
stroke(0,0,0);
noFill();
bezier(252,360,180,252,180,180,180,72);

strokeWeight(2);
line(396,360,180,95);

//blue ellipse
noStroke();
fill(66,66,111);
ellipseMode(CENTER);
ellipse(90,120,80,70);

//top quadrilateral
stroke(0,0,0);
strokeWeight(1.25);
fill(253,245,230);
beginShape();
  vertex(120,3);
  vertex(190,30);
  vertex(120,90);
  vertex(100,30);
endShape(CLOSE);

strokeWeight(2);
line(36,75,340,10);

//green ellipse
fill(0,100,0);
stroke(255,127,0);
strokeWeight(1);
ellipse(90,245,50,60);

//orange trianlge
fill(205,55,0);
noStroke();
triangle(270,36,324,72, 270,72);

//black and white ellipses
fill(145,145,145);
ellipse(240,110,50,50);
fill(0,0,0);
ellipse(240,110,35,35);
fill(255,255,255);
ellipse(240,110,20,20);
fill(0,0,0);
ellipse(240,110,9,9);

strokeWeight(3);
line(460,1,480,50);

//copyright note at bottom
PFont mono;
mono = loadFont("Monospaced-48.vlw"); 
textFont(mono, 10); 
text("Copyright Wassily Kandinksy", 385, 385);









