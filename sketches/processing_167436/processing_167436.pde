
boolean b=false;
float x,y,a,c,r,g,d;
void setup()
{
  size(400,400);
  background(0);
}
void draw(){
  if (b==true){
    frameRate(15);
   fill(r,g,d);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,30);
c=random(10,30);
r=random(255);
g=random(100);
d=random(255);
  
  }
  else {
   stroke(255); 
   //confeti
   frameRate(6);
   fill(r,g,d);
   ellipse(x,y,a,c);
    x=random(width);
    y=random(height);
    a=random(5,100);
    c=random(5,100);
    r=random(25);
    g=random(110);
    d=random(25);   
}
    fill(#DE00C1);
    rect(150,300,100,50);
}
void mousePressed(){
  if(mouseX>150 && mouseX<250 && mouseY>300 && mouseY<350){
    b = !b;
    background(0);
        fill(#F7F005);
    rect(150,300,100,50);
  }
}
