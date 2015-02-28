
size(400, 400);
background(106, 137, 180);

//floats
float x = 200;
float y = 200;
float wd = 400;
float ht = 400;

//head
noStroke();
fill(246, 255, 209);
ellipse(x, y, wd*.5, ht*.5);



//moostache
stroke(198, 198, 198);
strokeWeight(20);
line(x-40, y + 55, x+40, y +55);

//nose or "D"
stroke(0, 40);
strokeWeight(3);
beginShape();

curveVertex(x+wd*.005, y+ht*.09);
curveVertex(x+wd*.03, y+ht*.09);
curveVertex(x, y+ht*.14);
curveVertex(x-wd*.03, y+ht*.09);
curveVertex(x-wd*.001, y+ht*.09);
curveVertex(x-200,y);

endShape();


//lips1
stroke(0,90);
strokeWeight(3);
beginShape();
curveVertex(x+30, y+70);
curveVertex(x+30, y+70);
curveVertex(x, y+68);
curveVertex(x-30, y+70);
curveVertex(x-30, y+70);
endShape();

//facial hair or "K"
stroke(0,40);
beginShape();
curveVertex(x+10, y+76);
curveVertex(x+10, y+76);
curveVertex(x-10, y+72);
curveVertex(x+10, y+72);
curveVertex(x-10, y+76);
curveVertex(x-10, y+76);
endShape();

//eyes
noStroke();
fill(0, 40);
ellipse(x-30, y +20, 30, 40);
ellipse(x+30, y +20, 30, 40);
fill(0, 70);
ellipse(x-30, y+20, 25, 35);
ellipse(x+30, y+20, 25, 35);
fill(246,255,209);
triangle(x-30, y+20, x-10, y+15, x-10, y+25);
strokeWeight(1);
triangle(x+30, y+20, x+45, y+15, x+45, y+25);

//ears
ellipse(x-100, y, 38,50);
ellipse(x+100, y, 38,50);

//eyebrows
fill(198,200);
ellipse(x-30, y-5, 40, 10);
ellipse(x+30, y-5, 40, 10);

//headhair
fill(198, 200);
ellipse(x, y-75, 150, 80);
