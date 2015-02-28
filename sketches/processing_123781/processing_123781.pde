
void setup () {
size (400,400);}

void draw () {
translate (width/2,height/2);

for (int j=0;j<1000;j++){
  stroke (255,random(50,255));
  strokeWeight (4);
  point (random(-200,200),random(-200,200));
}

int n=6;

for (int i=0;i<n;i++) {
  
  rotate (2*PI/n);
  strokeWeight (7);
  stroke (255);
  line (0,0,150,0);
  
  stroke (255);
  line (125,0,150,40);
  scale (1,-1);
  line (125,0,150,40);
  
  scale (1,1);
  fill (201,234,237);
  ellipse (100,25,25,25);
  stroke (255);
  fill (142,187,191);
  ellipse (155,10,5,5);
  scale (1,-1);
  fill (201,234,237);
  ellipse (100,25,25,25);
  stroke (255);
  fill (142,187,191);
  ellipse (155,10,5,5);
  
  scale (1,1);
  stroke (255);
  fill (142,187,191);
  ellipse (0,25,5,5);
  strokeWeight (4);
  ellipse (150,40,10,10);
  scale (1,-1);
  strokeWeight (4);
  ellipse (150,40,10,10);

  scale (1,-1);
  strokeWeight (7);
  stroke (255);
  line (50,10,50,-10);

}
}
