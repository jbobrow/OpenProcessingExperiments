
//Miró Part 8

size(187, 175);
background(250,247,232);
smooth();

//Shapes
//Black
noStroke();
fill(0);
ellipse(7,50,25,20);
ellipse(100,35,17,12);
ellipse(170,135,15,10);
curve(-250,700,41,165,20,163,-100,500);
stroke(0);
bezier(90,60,94,84,123,73,90,165);

//Red
noStroke();
fill(237,57,6);
ellipse(1,53,15,11);
stroke(0);
strokeWeight(2);
bezier(90,60,90,102,60,70,90,165);

//Lines
strokeWeight(2);
noFill();
curve(75,30,5,40,40,0,10,75);
bezier(15,50,25,10,50,50,55,25);
bezier(100,10,87,84,165,45,110,0);
line(140,0,140,6);
curve(219,61,162,26,160,0,214,19);
curve(209,165,172,-5,195,45,187,119);
curve(-250,700,33,175,15,175,-100,500);
bezier(85,149,110,141,159,210,173,119);
bezier(85,149,41,153,67,180,-1,153);
curve(171,256,155,165,154,217,236,113);


