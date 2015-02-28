
void setup() {
  size(400, 400);
  background(174,219,240);
}

int e = 400;
int a = 20;
int b = 10;
int c = 15;

void draw() {
  noStroke();
  fill(206,29,174);
  ellipse(200,e,a,a);
  noStroke();
  fill(29,116,206);
  ellipse(120,e,b,b);
  noStroke();
  fill(206,192,29);
  ellipse(275,e,c,c);
  e--;
  a++;
  b++;
  c++;
}


