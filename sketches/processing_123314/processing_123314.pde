
void draw(){

size(400,400);
background(#15E5D2);

//square
stroke(#E84D15);
strokeWeight(10);
fill(#3AED18);
rect(93,93,215,215,10);

//face
stroke(#FF00DE);
strokeWeight(10);
fill(#181DDB);
ellipse(200,200,200,200);

//mouth
stroke(#E51919);
line(150,250,250,250);

//eyes
stroke(#580CA5);
fill(#7809E8);
ellipse(160,175,50,50);
fill(#7809E8);
ellipse(240,175,50,50);

//nose
stroke(#E8E109);
point(200,220);

//rectangles
beginShape();
vertex(10, 300);
vertex(50, 300);
vertex(50, 350);
vertex(100, 350);
vertex(100, 390);
vertex(10, 390);
endShape(CLOSE);

}
