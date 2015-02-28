
//Kandinsky section 12

size(400,500);
background(235,233,220);
smooth();

//green shape
noStroke();
fill(55,98,45);
beginShape();
  vertex(0,100);
  vertex(30,100);
  vertex(70,250);
  vertex(0,350);
endShape(CLOSE);

//yellow shape
noStroke();
fill(253,231,128);
beginShape();
  vertex(20,0);
  vertex(width,0);
  vertex(width,90);
  vertex(90,370);
endShape(CLOSE);

//blue shape
noStroke();
fill(91,100,99);
beginShape();
  vertex(100,0);
  vertex(150,0);
  vertex(230,100);
  vertex(70,250);
  vertex(0,90);
endShape(CLOSE);


//black left curve
stroke(0);
fill(0);
beginShape();
  vertex(0,80);
  vertex(0,150);
  bezierVertex(0,150,50,250,270,360);
  bezierVertex(50,250,0,80,0,80);
endShape(CLOSE);


//black ellipse (I cheated with functions you haven't learned yet ;)
pushMatrix();
  translate(350,-270);
  rotate(radians(45));
  stroke(0);
  strokeWeight(30);
  noFill();
  ellipse(500,height/2,600,350);
popMatrix();


//black lines
strokeWeight(10);
line(350,0,340,200);
line(370,0,360,205);
                
                
