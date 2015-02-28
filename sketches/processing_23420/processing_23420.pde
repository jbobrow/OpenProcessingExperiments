
int y = 100;
int x = 20;
int spacing = 11;
int len = 200;
float n = 0;
float opa = 0.9;

int circulos = 300;

size(500,500);
smooth();
background(255);

while(x <= circulos){
  stroke(255,255,255,n);
  fill(n,n,n,n);
  ellipse(x,height/2,x,y+len);
  rect(x,0,x,height);
  x = x + spacing;
  n = n + opa;
}

