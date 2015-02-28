
size(200,200);
background(255);
fill(0);

float a=0;

for (b=0; b<100; b=b+0.01){
    ellipse(100+a*cos(b), 100+-a*sin(b), 15, 15);
    a=a+0.05;
}               
