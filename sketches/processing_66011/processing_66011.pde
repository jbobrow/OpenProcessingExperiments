
size(271, 300);
background(255);
int p1 = 20;
int p2 = 83;
int p3 = 120;
int p4 = 186;
int p5 = 197;
int p6 = 212;
int p7 = 233;
int p8 = 263;

int c1 = 28;
int c2 = 107;
int c3 = 180;
int c4 = 227;
int c5 = 287;

int s1 = 62;
int s2 = 135;
int s3 = 158;

smooth();

noStroke();
fill(5, 24, 227);
rect (p2, 0, p3-p2, c1);
rect (p7, c5, width-p7, height-c5);


fill(247, 12, 12);
rect (0, 0, p1, s1);
rect (p7, s2, p8-p7, s3-s2);
rect (0, s3, p1, c3-s3);

fill(255,222,31);
rect (p2, c2, p3-p2, c3-c2);

stroke(0);
strokeWeight(6);
line(p1, 0, p1, c3);
line(p2, 0, p2, height);
line(p3, 0, p3, c3);
line(p4, 0, p4, height);
line(p5, 0, p5, height);
line(p6, 0, p6, c5);
line(p7, 0, p7, height);
line(p8, 0, p8, c3);

line(0, c1, p8, c1);
line(p2, c2, p8, c2);
line(0, c3, width, c3);
line(p4, c4, width, c4);
line(p2, c5, width, c5);




