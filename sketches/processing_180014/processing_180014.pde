
/*
Self Portrait
*/

size(100,100); //set window size
background(90,130,180); //change background color

/*
bezier(point,handle,handle,point)
*/

noFill();
stroke(255,255,0);
bezier(10,15, 15,10,  20,10, 25,20); //left fireworks bottom
bezier(15,3, 20,0,  23,5, 28,20); //left fireworks top
bezier(40,10, 35,3,  30,5, 25,20); //right fireworks middle

stroke(0,255,0);
bezier(10,10, 15,3,  20,5, 25,20); //left fireworks middle
bezier(40,15, 35,7,  30,10, 25,20); //right fireworks bottom

stroke(255, 100, 0);
bezier(40,3, 35,0,  30,-10, 25,20); //right fireworks top

stroke(0,255,0);

bezier(90,15, 85,10,  80,10, 75,20); //left fireworks bottom
bezier(85,3, 80,0,  77,5, 72,20); //left fireworks top
bezier(60,10, 65,3,  70,5, 75,20); //right fireworks middle

stroke(255,100,0);
bezier(90,10, 85,3, 80,5, 75,20); //left fireworks middle
bezier(60,15, 65,7, 70,10, 75,20); //right fireworks bottom

stroke(255,255,0);
bezier(60,3, 65,0, 70,-10, 75,20); //right fireworks top

fill(0,200,255, 255); //fill body
noStroke();

ellipse(50,100,60,50); //body

quad(3,30, 15,25, 35,80, 18,120); //left arm
quad(98,30, 86,25, 65,80, 82,120); //right arm

fill(240,240,220); //fill face

ellipse(50,50,50,60); //create face shape
ellipse(8,25,20,20); //left hand
ellipse(93,25,20,20); //right hand

strokeWeight(18);
stroke(50,40,0); // hair color

line(50,20, 25,35); //right hair top
line(25,35, 25,80); //right hair bottom
line(50,20, 75,35); //left hair top
line(75,35, 75,80); //left hair bottom

strokeWeight(.1);

triangle(50,55, 53,61, 47,61); //nose triangle (x1, y1, x2, y2, x3, y3)

fill(255,255,255); //fill eyes white
strokeWeight(.1);

ellipse(40,50,10,12); //left eye
ellipse(60,50,10,12); //right eye

fill(90,60,10); //fill eyes Brown
noStroke();

ellipse(40,50,7,8); //left eye
ellipse(60,50,7,8); //right eye

fill(180,0,0);
arc(50,65,25,23,0,PI, OPEN); //mouth arc (x,y origin,w,h,start,stop,OPEN/CHORD)








