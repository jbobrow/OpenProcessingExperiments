
int forehead = 250;
int spine = 200;
int ground = 425;



size(400, 600);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
background(166, 107, 56);


for (int i = 10; i<320; i+= 10){
  line(i, i+20, i+80, i+180);
}

fill(76, 56, 89);
rect(spine - 50, forehead, 100, 50);
fill(217, 197, 173);
ellipse(spine - 50, forehead, 15, 15);
ellipse(spine + 50, forehead, 20, 20);
fill(76, 56, 89);
rect(spine, 300, 10, 30);
line(spine - 10, 370, spine - 10, ground);
line(spine + 10, 370, spine + 10, ground);
fill(59, 41, 64);
rect(203, 330, 60, 5);
rect(143, 330, 60, 5);
fill(76, 56, 89);
ellipse(203, 340, 25, 20);
fill(59, 41, 64);
ellipse(202, 370, 40, 32);
fill(20);
rect(180, ground - 5, 10, 5);
rect(210, ground - 5, 10, 5);
ellipse(150, forehead, 5, 5);
ellipse(250, forehead, 5, 5);
line (0, ground, 400, ground);



