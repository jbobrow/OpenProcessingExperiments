
//Static Alien Experiment

size(200,200);
background(255);

rectMode(CENTER);
fill(150);
rect(100,120,45,60);  //Body

fill(200);
ellipse(100,70,60,70);  //Head

fill(0);
ellipse(85,60,20,15);    //Right Eye
ellipse(115,60,20,15);   //Left Eye

ellipse(85,147,30,10);  //Right Foot
ellipse(115,147,30,10);  //Left Foot

strokeWeight(10);
stroke(150);
line(73,100,50,120); //Right Arm
line(127,100,150,120);  //Left Arm

println("Take me to your leader!");


