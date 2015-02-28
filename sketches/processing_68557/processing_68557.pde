
size(500,500);
background(255,255,255);
int x,y;
noStroke();
smooth();
background(#673C13);
//for(x=-100; x<100; x++){
//  y=int(1*sq(x)+250);
//  line(int(x+100),y,int(x+100),500);
//}

//background
//fill(#342212);
//beginShape();
//vertex(390, 0);
//bezierVertex(450, 100, 400, 75, 470, 200);
//bezierVertex(400, 180, 350, 100, 290, 120);
//bezierVertex(300, 120, 310, 110, 340, 160);
//bezierVertex(310, 115, 300, 125, 285, 125);
//vertex(-100,-100);
//endShape();


//dark
fill(#342212);
beginShape();
vertex(390, 0);
bezierVertex(450, 100, 400, 75, 470, 200);
bezierVertex(400, 180, 350, 100, 290, 120);
bezierVertex(300, 120, 310, 110, 340, 160);
bezierVertex(310, 115, 300, 125, 285, 125);
bezierVertex(290, 170, 304, 190, 305, 200);
bezierVertex(301, 190, 275, 140, 270, 140);
bezierVertex(200, 140, 210, 150, 220, 200);
bezierVertex(200, 140, 210, 150, 240, 240);
bezierVertex(220, 280, 270, 315, 280, 320);
bezierVertex(280, 320, 310, 360, 310, 370);
bezierVertex(330, 350, 345, 310, 370, 305);
bezierVertex(380, 310, 385, 340, 385, 345);
bezierVertex(400, 360, 390, 410, 410, 440);
bezierVertex(415, 438, 430, 470, 420, 500);
vertex(-100,500);
vertex(-100,-100);
endShape();

//dark eye
beginShape();
vertex(260, 260);
bezierVertex(240, 245, 260, 250, 305, 240);
bezierVertex(240, 245, 260, 250, 305, 240);
bezierVertex(305, 245, 307, 250, 310, 248);
bezierVertex(312, 245, 350, 280, 360, 278);
bezierVertex(355, 285, 350, 290, 350, 290);
bezierVertex(330, 300, 320, 290, 320, 290);
bezierVertex(300, 285, 325, 280, 330, 280);
bezierVertex(317, 265, 317, 267, 310, 262);
vertex(260,260);
endShape();

//gradient
for(x=0,y=255; y>0; y--, x++){
  stroke(19,103,98,y);
  line(x,0,x,500);
}

//guide grid

stroke(#673C13);
textSize(7);
fill(255,255,255);
for(x=20; x<500; x=x+20){
  line(x,0,x,500);
 // text(x,x,490);
}
fill(0,0,0);
for(y=20; y<500; y=y+20){
  line(0,y,500,y);
  //text(y,480,y);
}


textSize(25);
fill(#291706,150);
text("DREAMING OF FALL", 8,452);
fill(#291706);
text("DREAMING OF FALL", 10,450);
