
/*This is a self portrait!*/

size(100,100);

fill(240,210,165); //color face
ellipse(50,50,60,70);//draw a circle, face


fill(100,70,30); //make hair brown
stroke(100,70,30); //make hair brown
quad(20,25, 40,17, 50,14, 60,18); //draw hair
fill(110,60,25); //make hair brown
quad(20,38, 45,33, 40,20, 25,22); //draw hair
fill(90,50,3); //make hair brown
quad(25,30, 40,17, 50,14, 60,18); //draw hair
fill(80,30,10); //make hair brown
quad(45,30, 40,17, 50,14, 70,20); //draw hair
fill(130,70,20); //make hair brown
quad(65,30, 40,17, 50,14, 75,25); //draw hair
fill(65,35,4); //make hair brown
quad(70,27, 75,20, 75,24, 80,30); //draw hair
fill(65,35,4); //make hair brown
quad(65,20, 75,35, 77,45, 80,30); //draw hair


fill(255,255,255); //color eyes white
ellipse(40,45,13,15); // draw left eye
ellipse(60,45,13,15); // draw right eye
fill(78,106,222); //make eyes blue
ellipse(40,45,5,5); // draw left iris
ellipse(60,45,5,5); // draw right iris

noFill(); //don't color nose
strokeWeight(2); //set stroke
arc(50,59,10,13,0,PI+HALF_PI, OPEN); //draw nose

strokeWeight(3);
stroke(165,85,85);
arc(50,75,15,3,0,PI+QUARTER_PI, OPEN); //draw mouth

stroke(1);
strokeWeight(3);
line(33,35,45,32); //draw left eyebrow
line(55,33,67,35); //draw right eyebrow

strokeWeight(1);
//left
line(35,33,35,36); //make em thick
line(37,32,35,36); //make em thick
line(39,31,35,36); //make em thick
line(41,30,35,36); //make em thick
//right
line(57,31,35,33); //make em thick
line(59,30,35,33); //make em thick
line(61,29,35,33); //make em thick
line(63,28,35,33); //make em thick




