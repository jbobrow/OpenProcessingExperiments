
size(400,400);
background(66,92,47);
stroke(75,140,25);strokeWeight(2);
for (int i=0;i<900;i=i+30)
{
  line(0,i-15,400,i+i);
}

 
noStroke();
 
rectMode(CENTER);
//first rect
pushMatrix();
translate(100,100);
fill(85,0,150,230);
rotate(radians(45));
rect(200,150,250,250);
popMatrix();
//second rect
pushMatrix();
translate(100,100);
rectMode(CENTER);
fill(150,0,140,180);
rect(122,160,175,175);
popMatrix();
//third rectangle
pushMatrix();
translate(200,100);
rectMode(CENTER);
fill(85,0,150,160);
rotate(radians(45));
rect(130,10,70,70);
popMatrix();
