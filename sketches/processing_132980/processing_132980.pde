
println("Hallo");

size(800,400);
background(#FF9E71);
float headX = 200;

noStroke();
fill(0,0,0);
arc(headX-30, height/2-10, 200,200, radians(110),radians(290));

fill(255,255,255);
ellipse(headX, height/2, 200,200);

fill(0,0,0);
ellipse(headX-30, height/2, 20, 20); 
ellipse(headX+30, height/2, 20, 20); 

stroke(255,0,0);
noFill();
arc(headX-10, height/2+30, 50,50, 0, PI);

stroke(0,0,0);
arc(headX-46, height/2, 50,50,radians(180),radians(360));
arc(headX+14, height/2, 50,50,radians(180),radians(360));

fill(0,0,0);



