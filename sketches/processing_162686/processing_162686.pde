
size(200,200);
background(255);

int x = 50;
int y = 75;
int diam = 20;
int spacing = 30;

stroke(0);

while (x <= 150) { 
  ellipse (x,y,diam,diam);
  x = x + spacing;
}


