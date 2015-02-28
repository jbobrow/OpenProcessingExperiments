


void setup() {
size(600,500);
smooth();
}

void draw () {
background(255);

ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(150);



//body

stroke(0);
fill(mouseX,mouseY,260,80); //changes color see threw
smooth();
rect(150,190,100,160);
 
 //face
stroke(0) ;
fill(mouseX,mouseY,268,99); //chages color and makes see threw
rect(150,69,222,98);

 //eyes nose
fill(400,98,59);
ellipse(82,64,30,39); //moves eyes
ellipse(160,67,30,39);
ellipse(119,79,7,32);
triangle(mouseX,mouseY,149,90,200,100);

 //feet left leg 1 right leg 2

fill(700,233,89);
rect(100,300,20,89);
rect(200,300,20,89);
rect(95,348,10,90);
rect(207,350,10,90);
rect(99,399,80,10);
rect(200,400,80,10);
 

 

 


//hands 1st one left arm 2nd one right arm 2nd 2 are hands//fingers 3rd
fill(700,233,89);
rect(249,142,100,10);
rect(54,142,89,10);
rect(9,150,10,89);
rect(280,150,10,89);
rect(290,143,30,40);
rect(90,143,20,20);
rect(209,140,20,20);

//legs
stroke(0);
fill(600,200,13);
rect(120,39,100,20); }

  



