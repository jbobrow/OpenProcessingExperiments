
size(500, 500);
int endLegs = 400;
int x = 0;
int y = 0;
int spacing = 4;
//int spacing = 4;

stroke(10);
while (x <= endLegs) {
 line(x, y, x, y + endLegs);
 x = x + spacing; 
}
