
int n=400,g=25;float f=9;void setup(){size(n,n);}void draw(){background(0);translate(n/2,n/2);t(1);f=f+.01;if(mousePressed)g=mouseX;}void t(int d){if(d<n){rect(n*sin(d/f)/3,n*cos(g*d)/3,9,9);t(d+1);}}

