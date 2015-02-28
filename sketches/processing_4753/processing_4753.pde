
int a=500;void setup(){size(a,a);frameRate(15);ellipseMode(CORNER);}void draw(){for(int i=0;i<a/10;i++){for(int k=0;k<a/10;k++){noStroke();fill(int(random(0,1.99))*255);ellipse(i*10,k*10,10,10);}}}

