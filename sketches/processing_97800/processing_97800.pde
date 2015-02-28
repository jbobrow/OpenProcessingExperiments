
size(600,600);

background(50,150,150,150);

noFill();

for(int x = 0; x<1000; x=x+20){ ellipse(x,x,50,50);}



noFill();

for(int i = 10; i <=300; i+=10){for(int j=10;j<=300;j+=10)ellipse(i,j,2*i,2*j);}



noStroke();

fill(25,50,255,10);

for (int i=500; i>0; i=i-5)

{

  ellipse(300,325,i,i);

}
