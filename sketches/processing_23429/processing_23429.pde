

int y = 100;
int spacing = 11;
int len = 200;
float n = 0;
float opa = 0.9;

size(500,500);
background(255);
smooth();

for(int x = 20; x <= 330; x+= spacing){
  fill(n,n,n,n);
  stroke(n,n,n,n);
  ellipseMode(CENTER);
  ellipse(x,height/2,x,y+len);
  rect(x,0,x,height);
  n = n + opa;
}


