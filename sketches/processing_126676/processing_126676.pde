
void setup() {
  size(500,500);
}

int i = 0;
void draw() {
  i++;
  if (i >= 256) i = 0;
  background(i);
}
 


