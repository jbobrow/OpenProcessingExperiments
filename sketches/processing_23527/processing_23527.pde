
size (500,700);
smooth();
strokeWeight(3);
background(255);


int x = 250;
int y = 230;
int bodyCenterX = x;
int bodyCenterY = y+150;
//body
fill(238,240,186);
beginShape();
curveVertex(bodyCenterX-50,bodyCenterY-82);
curveVertex(bodyCenterX-50,bodyCenterY-82);
curveVertex(bodyCenterX-150,bodyCenterY-85);
curveVertex(bodyCenterX-150,bodyCenterY-30);
curveVertex(bodyCenterX-70,bodyCenterY-20);
curveVertex(bodyCenterX-100,bodyCenterY+170);
curveVertex(bodyCenterX-30,bodyCenterY+170);
curveVertex(bodyCenterX-30,bodyCenterY+90);
curveVertex(bodyCenterX,bodyCenterY+90);
curveVertex(bodyCenterX-5,bodyCenterY+170);
curveVertex(bodyCenterX+60,bodyCenterY+170);
curveVertex(bodyCenterX+70,bodyCenterY-20);
curveVertex(bodyCenterX+150,bodyCenterY-60);
curveVertex(bodyCenterX+150,bodyCenterY-130);
curveVertex(bodyCenterX+50,bodyCenterY-82);
curveVertex(bodyCenterX+50,bodyCenterY-82);
endShape(CLOSE);


fill(255);
ellipse(bodyCenterX,bodyCenterY,90,120); //belly


//ears
fill(238,240,186);
ellipse(x+100,y-100,100,80);
fill(250,207,223);
ellipse(x+100,y-90,80,60);

fill(238,240,186);
ellipse(x-100,y-100,100,80);
fill(250,207,223);
ellipse(x-100,y-90,80,60);


//head

fill(238,240,186);
ellipse(x,y-30,250,210);
fill(0);
ellipse( x-55,y-50,20,20); // left eye
ellipse( x+55,y-50,20,20); //  right eye
fill(255);
ellipse( x,y+10,90,60);
fill(0);
ellipse(x,y,25,25); //nose
noFill();
arc(x+18,y+12,35,30,0,PI); // right lip
arc(x-18,y+12,35,30,0,PI); // left lip

stroke(240,63,63);
for (int i=x-80; i < x-64; i+=5) {
  line(i,220,i-5,240);
}

for (int i=x+75; i < x+86; i+=5) {
  line(i,220,i-5,240);
}

/*
line(175,220,170,240);
line(180,220,175,240);
line(185,220,180,240);

line(325,220,320,240);
line(330,220,325,240);
line(335,220,330,240);
*/



