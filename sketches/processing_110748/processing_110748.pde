
size(400,400);
background(255);

//eyes 
//left
fill(255);
ellipse(100,100, 40,40);
fill(0);
ellipse(100,100,10,10);
//right
fill(255);
ellipse(200, 100, 40,40);
fill(0);
ellipse(200,100,10,10);

//head
noFill();
arc(150,80, 190,140, 2.7, 6.7);

//ears
//left
ellipse(40,140, 80,80);
  //inside
  ellipse(40,140, 30,30);
//right
ellipse(260,140, 80,80);
  //inside
  ellipse(260,140, 30,30);
//bottom face
stroke(0,0,0);
strokeWeight(1);
ellipse(150,200, 200,100);

//nostrils
//left
ellipse(135,180, 20,20);

//right
ellipse(160, 180, 20,20);

//mouth
ellipse(150, 240, 15,15);
noFill();
arc(150,200, 100,100,0.9, 2.2);


