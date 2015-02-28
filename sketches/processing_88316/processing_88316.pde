
size(300,500);
//body
ellipse(150,100,100,100);
ellipse(150,200,100,100);

//left eye
fill(0);
ellipse(130,100,10,20);
ellipse(170,100,10,20);

//hair
line(160,20,130,50);
line(170,30,140,50);
line(180,40,150,50);
//smile
noFill();
beginShape();
curveVertex(130,110);
curveVertex(130,130);
curveVertex(140,140);
curveVertex(170,130);
curveVertex(170,110);
endShape();


//left arm
line(130,150,70,200);

//right arm
line(170,150,220,200);
line(220,200,190,200);

//right hand
noFill();
ellipse(210,200,20,30);

//left hand
fill(0);
ellipse(90,200,20,30);

//pants
line(150,200,150,250);//vertical line
line(100,200,200,200);//horozontal line

//legs
line(140,250,140,300);
line(160,250,160,300);

//shoes
noFill();
ellipse (130,309,30,20);//left
ellipse (170,309,30,20);//right
