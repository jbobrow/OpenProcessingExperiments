
size(720,480);
smooth();
strokeWeight(1);
background(200);
ellipseMode(RADIUS);


//Antenna
line(276,155,150,150);
line(280,155,140,130);

//Head
fill(0);//set fill to black
rect(276,155,50,50);//Head
fill(80);
ellipse(280,155,10,10);
fill(255);
ellipse(280,155,3,3);
fill(80);
ellipse(300,155,10,10);
fill(255);
ellipse(300,155,3,3);
fill(255);
ellipse(300,180,3,3);

//Neck
stroke(100);
line(300,200,300,250);
line(300,200,310,250);

//Body
noStroke();//Disable stroke
fill(0);
ellipse(305,350,40,40);
fill(98);
rect(260,250,100,100);
fill(50);
rect(260,250,50,50);
fill(20);
rect(300,300,50,50);



