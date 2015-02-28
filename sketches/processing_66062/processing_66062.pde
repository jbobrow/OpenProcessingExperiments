
//Mondrian by Decho.

size(300, 331);
background(255);

smooth();
noStroke();
fill(213, 37, 14);
rect(0, 0 ,21 ,71); //Red Square 1
rect(0, 175, 21, 20); //Red Square 2

fill(31, 75, 172);
rect(92, 0, 40, 32); //Blue Square 1

fill(248, 201, 10); //Yello Square
rect(92, 120, 40, 75);

fill(213, 37, 14); //Red Square 3
rect(259, 152, 34, 27);

fill(31, 75, 172);//Blue Square 2
rect(259, 321, 45, 10);

fill(204, 204, 204);//Gray Square 2
rect(204, 316, 50, 20);


strokeWeight(7); 
stroke(0);
strokeCap(SQUARE);
line(21, 0, 21, 195); //stroke 1


line(91, 0, 91, 331); //stroke 2
line(132, 0, 132, 196); //stroke 3
line(206, 0, 206, 331); //stroke 4
line(217, 0, 217, 331); //stroke 5
line(230, 0, 230, 317); //stroke 6


strokeWeight(7);
line(256, 0, 256, 332); //stroke 7


strokeWeight(6); 
line(291, 0, 291, 196); //stroke 8


strokeWeight(8);
line(0, 33, 291, 33); //stroke horizontal 1 
line(22, 116, 291, 119); //stroke horizontal 2 
line(0, 198, 300, 199); //stroke horizontal 3
line(204, 251, 300, 251); //stroke horizontal 4
line(93, 317, 300, 317); //stroke horizontal 5

//End.

