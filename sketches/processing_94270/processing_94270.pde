
int x = 100;
int y = 80;
int dtelhax = 15;
int dtelhay = 9;
int ptx = 11;
int pty = 10;

stroke(255, 115, 15);
strokeWeight (3);
size(300, 300);
background(255);

for(int i = 0 ; i<10 ; i++){
line(x, y, x+dtelhax, y+dtelhay);
x = x+ptx ;
y=y+pty  ;
}


x = 90;
y = 90;
dtelhax = 15;
dtelhay = -9;
ptx = -11;
pty = 10;
for(int j = 0; j<10; j++){
line(x, y, x+dtelhax, y+dtelhay);
x=x+ptx;
y=y+pty;
}

noStroke();
fill(255, 255, 0);
ellipse(280, 0, 100, 100);
fill(255, 255, 0, 90);
ellipse(280, 0, 150, 150);

stroke(156, 156, 156);
strokeWeight (3);
line(20, 160, 20, 270);
line(187, 160, 187, 270);
line(20, 270, 187, 270);

noStroke();
fill(127, 255, 0);
rect(0, 272, 300, 272, 0, 300, 300, 300);
stroke(156, 156, 156);
strokeWeight(2);
line(30, 190, 30, 270);
line(110, 190, 110, 270);
line(68, 190, 68, 270);
line(71, 190, 71, 270);
line(30, 190, 110, 190);
line(130, 190, 130, 230);
line(180, 190, 180, 230);
line(130, 190, 180, 190);
line(130, 230, 180, 230);


