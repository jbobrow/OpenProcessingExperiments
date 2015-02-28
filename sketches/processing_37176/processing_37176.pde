
// Vertical Lines
int constant = 30;
int xa = constant;
int ya = constant*10;
int xb = constant;
int yb = constant;
size(500,500);

// Drawing the lines
for(int i=1; i<= 9; i++) {
  ya = ya-constant;
  line(xa, ya, xb*i, yb);
}
