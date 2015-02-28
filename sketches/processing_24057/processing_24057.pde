
void setup() {
  background(255, 228, 225);
  size(400,400); //the size of the canvas by 1000,1000
  smooth(); //smooth the shape
  fill (0,26); //color in blak with alpha 26
  noStroke(); //don't outline the object 

for (int y =0; y < height; y= y+60) {
for (int x=0; x < width; x= x+60) {
fill (255, 255, 238);  
  rect(x, y, 55, 55);
}
}

stroke(153);
fill (204, 255, 255); 
ellipse(200, 350, width/1.6, height/1.6);

stroke(153);
fill (204, 255, 255); 
ellipse(200, 150, width/2, height/2);


//left ear

beginShape();
fill (255, 102, 102); 
curveVertex(194,  191);
curveVertex(120,  92);
curveVertex(68,  69);
curveVertex(81,  99);
curveVertex(103, 130);
curveVertex(120, 150);
endShape();

beginShape();
fill (204, 255, 255); 
curveVertex(494,  191);
curveVertex(120,  92);
curveVertex(68,  69);
curveVertex(81,  99);
curveVertex(103, 130);
curveVertex(120, 150);
endShape();

//right ear

beginShape();
fill (255, 102, 102); 
curveVertex(25,  201);
curveVertex(280,  92);
curveVertex(328,  69);
curveVertex(321,  99);
curveVertex(300, 130);
curveVertex(300, 140);
endShape();

beginShape();
fill (204, 255, 255); 
curveVertex(-140,  201);
curveVertex(280,  92);
curveVertex(328,  69);
curveVertex(321,  99);
curveVertex(300, 130);
curveVertex(300, 140);
endShape();

//left eye 
stroke(153);
fill (102, 255, 102); 
ellipse(150, 120, 50, 50);

stroke(153);
fill (0, 40, 40); 
ellipse(150, 120, 30, 50);

//right eye 
stroke(153);
fill (102, 255, 102); 
ellipse(240, 120, 50, 50);

stroke(153);
fill (0, 40, 40); 
ellipse(240, 120, 30, 50);

//mouth nose join 
stroke(193);
line(200, 170, 200, 210);

//mouth
noStroke();
fill (255, 102, 102); 
ellipse(200, 210, 90, 10);

//nose
}
void draw () {
  smooth();
  stroke(255, 102, 102);
ellipse(200, 175, 20, 20);  
if (mousePressed) {
   fill (255); 
}
else {
  stroke(255, 102, 102);
  fill (255, 102, 102);
}
}

