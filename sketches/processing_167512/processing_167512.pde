
size (500,500);
background(0);
fill(255);



//reihe 1,3,5

pushMatrix();
translate(50,10);

//Reihe 1
pushMatrix();
rect(0,0,5,80);
rect(40,40,80,5);
rect(160,0,5,80);
rect(200,40,80,5);
rect(320,0,5,80);
rect(360,40,80,5);
popMatrix();


//Reihe 3
translate(0,160);
pushMatrix();
translate(-5,0);
rect(0,0,15,80);
rect(160,0,15,80);
rect(320,0,15,80);
popMatrix();

pushMatrix();
//translate();
rect(40,30,80,15);
rect(200,30,80,15);
rect(360,30,80,15);
popMatrix();


//Reihe 5
translate(0,160);
pushMatrix();
translate(-10,0);
rect(0,0,25,80);
rect(160,0,25,80);
rect(320,0,25,80);
popMatrix();

pushMatrix();
translate(0,-5);
rect(40,30,80,25);
rect(200,30,80,25);
rect(360,30,80,25);
popMatrix();

popMatrix();


//Reihen 2,4,6

pushMatrix();

//Reihe 2
translate(0,90);
pushMatrix();
rect(10,35,80,10);
rect(125,0,10,80);
rect(170,35,80,10);
rect(285,0,10,80);
rect(330,35,80,10);
rect(445,0,10,80);
popMatrix();


//Reihe 4
translate(0,160);
pushMatrix();
translate(0,-5);
rect(10,35,80,20);
rect(170,35,80,20);
rect(330,35,80,20);
popMatrix();

pushMatrix();
translate(-5,0);
rect(125,0,20,80);
rect(285,0,20,80);
rect(445,0,20,80);
popMatrix();


//Reihe 6
translate(0,160);
pushMatrix();
translate(0,-10);
rect(10,35,80,30);
rect(170,35,80,30);
rect(330,35,80,30);
popMatrix();

pushMatrix();
translate(-10,0);
rect(125,0,30,80);
rect(285,0,30,80);
rect(445,0,30,80);
popMatrix();


popMatrix();
