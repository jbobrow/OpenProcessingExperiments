
size(600,600);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//First Layer
  //Lower Torso
strokeJoin(BEVEL);
fill(126,9,125);
rect(270,360,120,60);
  //Middle torso
fill(193,57,191);
ellipse(330,310,60,60);
strokeWeight(6);
  //Neck
fill(255);
line(330,205,330,160);
line(310,205,315,160);
line(350,205,345,160);

//Second Layer
  //Upper Torso
strokeWeight(2);
fill(126,9,125);
rect(235,200,190,80);
  //Left arm
strokeWeight(10);
fill(255);
line(235,205,150,310);
line(150,305,90,175);
  //Left fingers
strokeWeight(7);
line(95,175,85,130);
line(95,178,60,145);
line(95,177,130,160);
line(95,176,50,172);
  //Right arm
strokeWeight(10);
line(420,205,455,330);
line(455,330,505,460);
  //Right fingers
strokeWeight(7);
line(505,455,480,483);
  //Left leg
strokeWeight(13);
line(270,420,245,599);
  //Right leg
line(390,420,435,599);

//Third Layer
  //Shoulders
strokeWeight(2);
fill(34,42,242);
ellipse(240,205,25,25);
ellipse(420,205,25,25);
  //Left elbow
ellipse(150,305,15,15);
  //left palm
ellipse(95,175,15,17);
  //Right elbow
ellipse(455,330,15,15);
  //Right palm
ellipse(505,460,15,17);
  //Left hip joint
ellipse(270,420,25,25);
  //Left knee
ellipse(245,595,15,15);
  //Right hip joint
ellipse(390,420,25,25);
  //Right knee
ellipse(435,595,15,15);

//Fourth Layer
  //Head
fill(201,55,187);
ellipse(330,100,65,65);
  //Left thigh cover
fill(193,57,191);
quad(275,460,270,550,220,570,255,460);
  //Right thigh cover
quad(390,460,405,550,455,570,410,460);
