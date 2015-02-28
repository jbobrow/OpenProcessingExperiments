
size(500,500);
smooth();

background(0);
fill(255);
strokeWeight(4);
stroke(255);
fill(255);
ellipse(400, 190, 60,60);

fill(255);
ellipse(100, 190, 60,60);

rect(95, 105, 300, 200);
fill(0);
noStroke();


rect(105, 110,282 ,190);
//left eye
fill(254,241,62);
stroke(255);
strokeWeight(8);
ellipse( 150, 195, 60, 60);
//right eye
ellipse( 345, 195, 60, 60);
noFill();
strokeWeight(17);
stroke(255);
int d= 100;
float xpos=250; // wight/2;
float ypos=250; //height/2;

float startAngle= radians (20);
float stopAngles = radians (90);

arc( xpos, ypos, 75, 75, 0.25, 2.75); // star, stop//

arc( xpos, ypos, 75, 75, radians (20), radians (90));
strokeWeight(6);
fill(255);
 triangle(250, 155, 200, 110, 300, 110);
//nose
strokeWeight(6);
stroke(255);
fill(254,241,62);



 rect( 215, 180, 70, 30);
 strokeWeight(5);
 rect( 240, 110, 20,70);
 
 rect( 115, 120, 4, 20);
 rect( 115, 120, 20, 4);
 
 rect( 370, 120, 4, 20);
 rect( 350, 120, 20, 4);
 
 
 


