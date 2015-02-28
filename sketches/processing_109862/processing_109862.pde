
size(300, 300);
background(#BFEDEA);


int d = 100;
int x = 130;
int y = 150;

rectMode(CENTER);
fill(#8EDB8E);
rect(width / 2, height / 2, width - 50, height - 50);
fill(#D28EDB);
rect(width / 4, height * 0.75, width * 0.3, height * 0.3);
fill(#8EA4DB);
triangle(width / 2, 0, 0, height / 2, width, height / 2);

fill(#FFFFFF);
ellipse(x, y, d, d);

x = x + 100;
y = y + 100;
d = d + 100;
ellipse(x, y, d, d);

x = x / 2;
y = y / 2;
d = d / 2;
ellipse(x, y, d, d);

//ellipse(x / 2, y / 2, d / 2, d / 2);

strokeWeight(5);
line(40, 50, 40, 250);
line(50, 50, 50, 250);
line(65, 50, 65, 250);
line(85, 50, 85, 250);
line(105, 50, 105, 250);


