
size(500,500);
background(255);

stroke(0,0,255,50);

line (0,100,500,100);
line (0,200,500,200);
line (0,300,500,300);
line (0,400,500,400);

line (100,0,100,500);
line (200,0,200,500);
line (300,0,300,500);
line (400,0,400,500);

stroke (0);

// arc
fill(0,255,0,100);
arc(250,250,200,500,HALF_PI,2*PI);



//curve
//1y2 inicio bezier(curva), 3y4 punto inicial, 5y6 punto final, 7y8 final bezier (curva)
strokeWeight(10);
fill(255,0,0,100);
curve(0, 500, 100, 100, 400, 400, 200, 600);




