
size(400,600);
background(202,225,255);

rectMode(CENTER);//phone
noStroke();//white
rect(200,300,300,500,50);
noStroke();//black
fill(0);
rect(200,300,250,380);

stroke(5);//home button
fill(255);
ellipse(200,520,40,40); 
stroke(2);
rectMode(CENTER);
rect(200,520,20,20,5);

fill(0);//camera and speaker
rectMode(CENTER);
rect(200,85,50,10,5);
ellipseMode(CENTER);
ellipse(200,67,10,10);
ellipse(165,85,7,7);

fill(205,197,191);
noStroke();
rectMode(CENTER);//onOff
rect(290,50,40,5);
rect(50,130,5,20);//Ringer
rect(50,160,5,10);//volume up
rect(50,175,5,10);//volume down
