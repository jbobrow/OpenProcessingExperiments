
size(400,400);
background(255);



//head
noFill();
arc(150,80, 100,100, 3.2, 6.3);

//ears
//left
ellipse(40,140, 120,120);
  //inside
  ellipse(40,140, 70,70);
//right
ellipse(260,140, 120,120);
  //inside
  ellipse(260,140, 70,70);
  
//eyes 
//left
fill(255);
ellipse(100,100, 80,80);
fill(0);
ellipse(100,100,30,30);
//right
fill(255);
ellipse(200, 100, 80,80);
fill(0);
ellipse(200,100,30,30);
  
//bottom face
fill(255);
stroke(0,0,0);
strokeWeight(1);
ellipse(150,200, 250,150);

//nostrils
//left
ellipse(135,180, 30,30);
noFill();
arc(134,165, 30,22, 3.0, 6.3);
//right
ellipse(165, 180, 30,30);
noFill();
arc(165,165, 30,22, 3.0, 6.3);


//mouth
ellipse(150, 240, 50,50);
noFill();
arc(150,220, 100,100,0.8, 2.3);


