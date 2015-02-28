
float x=100;
float y=100;
float a=50;
float b=50;
float c=0;

void setup(){
background(255);  
size(600, 600, P2D);
}

void draw(){ 

  
pushMatrix();
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(50,50);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(100,100);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,-50);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-100,-100);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,-100);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,150);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,350);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();


pushMatrix();
translate(-50,500);
stroke(c);
noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();



pushMatrix();

translate(350,0);

pushMatrix();
translate(50,50);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(100,100);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,-50);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-100,-100);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,-100);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,150);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

pushMatrix();
translate(-50,350);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();


pushMatrix();
translate(-50,500);

noFill();
rect(x,y,a,b);
x=x+0.1;
y=y+0.2;
b=b+0.05;
c=c+0.2;
popMatrix();

popMatrix();




}




