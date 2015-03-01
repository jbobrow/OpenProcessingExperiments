
size(400,200);
background(0,0,153);
noStroke();

fill(255)
noStroke();
int x=4;
if(x>5){
point(40,50);
}
else
{
quad(-50,50,500,420,280,420,0,-50);
}
if(x<4){
line(20,20,10,10)
}
else
{
quad(0,-550,450,420,450,420,0,-300);
}
quad(850,-550,950,-300,350,250,450,260);
stroke(0);
{
  translate(50,50);
  rotate(radians(30));
  rectMode(CENTER);
   rect(0,0,20,20);
   rect(50,10,20,20);
   rect(80,0,10,10);
rect(30,30,10,10);
popMatrix();
}
