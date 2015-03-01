
void setup()
{
size(200,600);

noLoop();
}
void draw()
{
background(0);
stroke(255,100);
noFill();


//loop();

for(int y = 0; y < height;y+=150)
{
for(int x = 0; x< width;x+=150)
{
  pushMatrix();
  translate(width/2, height/2);
  scale(random(.5,1.5));
stroke(random(205),random(90),random(50),50);
fill(12,237,235,20);
for(int i = 0; i <360;i+=30)
{
pushMatrix();
//move to the middle of the screen.
//translate(width/2,height/2);
rotate(   radians(i)  );

beginShape();
vertex(60,-150);
vertex(20,200);
vertex(-30,20);
endShape();
line(60,-150,20,200);
line(20,200,-30,20);
popMatrix();
}
popMatrix();
}
}
fill(100,0,0,50);


strokeWeight(2);
stroke(43,34,26);
fill(78,67,89,70);







for (int j =0 ;j<500; j++)
{
pushMatrix();
translate(width/2, height/2);
float l= random(.5,3);
rotate(random(radians(360)));
beginShape();
for (int i=0; i<200; i++)
{
  
  
  float n= noise(i*.02,j)*60;
  vertex(i*l,n);
  
  
}
endShape();

popMatrix();
}
noStroke(0);
strokeWeight(0);
fill(252,209,68,50);
triangle(0,0,200,0,100,300);

noStroke(0);
strokeWeight(0);
fill(252,56,67,50)
triangle(0,600,200,600,100,300);
}
