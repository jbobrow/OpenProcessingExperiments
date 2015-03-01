
size(500,500);
background(255);
fill(0);



rectMode(CENTER);
//main
ellipse(250,250,150,150);
pushMatrix();
fill(255);
ellipse(250,250,110,110);
popMatrix();

fill(0);
//top
ellipse(250,180,75,75);

//left
ellipse(190,290,75,75);

//right
ellipse(310,290,75,75);

pushMatrix();

  translate(230,150);
  rotate(-PI/5.0);
  rect(0,0,65,90);


  rotate(-PI/4.0);
  translate(-125,140);
  rect(0,0,65,90);


  translate(-65,-165);
  rotate(PI/1.8);
  rect(0,0,65,90);

popMatrix();

ellipse(202,112,65,65);

ellipse(161,377,65,65);

ellipse(398,303,65,65);

triangle(188,82,188,130,100,103);

triangle(188,382,230,450,140,401);

triangle(425,320,400,275,465,230);



