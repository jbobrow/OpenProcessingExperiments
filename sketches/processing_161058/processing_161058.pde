
size (500, 500); 
background(150, 250, 10);

int a = 7;
int b = min(14, 70);
int c = max(28, 10);
int d = max(35, 20);

smooth(); 
stroke(40, 40, 50);
line(a, 10*b, 10+c, 16+d);
strokeWeight(2);

stroke(60, 60, 70);
line(2*a,20*b,100+c,25+d);
strokeWeight(3);

stroke(80, 80, 90);
line(3*a,30*b,200+c,36+d);
strokeWeight(4);

stroke(100, 100, 110);
line(a*4, 40*b, 300+c, 49+d);
strokeWeight(5);



