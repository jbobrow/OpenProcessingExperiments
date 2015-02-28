
float x;
float y;
float xs;
float ys;
float ya=1;
void setup(){
size(500,500);
background(0,200,250);
}
void draw(){
background(0,200,250);
x+=xs;
y+=ys;
ys+=ya;
if (mousePressed){
x=mouseX;
y=mouseY;
xs=mouseX-pmouseX;
ys=mouseY-pmouseY;
}
if (y>=300){
xs=xs*.9;
ys=ys*.9-1;
}
if (y>=400){
ys=-abs(ys);
}
if (x>=450){
xs=-abs(xs);
}


fill(0,0,150);
rect(0,300,500,200);

fill(100,20,0);
rect(0,400,500,100);

fill(0,150,0);
rect(450,50,50,450);

fill(250,250,0);
translate(x,y);
rotate(xs);
ellipse(0,0,30,20);
}
