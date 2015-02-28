
//Use these backslashes to comment without effecting the code
size(300,300);
background(255,255,255);

//Head
translate(150,100);
noStroke();
fill(144,210,185);
ellipse(0,0,130,110);

//Chin
fill(144,210,185);
rect(-35,30,70,55);

//Right Eye
fill(250,244,178);
ellipse(18,30,30,40);

//Left Eye
fill(250,244,178);
ellipse(-18,30,30,40);

//Nose
fill(144,215,180);
translate(0,40);
pushMatrix();
triangle(0,-10,-10,40,20,40); 
popMatrix();

//Mouth
fill(144,210,185);
ellipse(0,50,110,30);

translate(-46,50);
pushMatrix();
stroke(0,0,0);
line(0,0,90,0);
popMatrix();



