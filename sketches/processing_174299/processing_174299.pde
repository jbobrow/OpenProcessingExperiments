
float counter = 2;
float i = random(5,30);

void setup()
{
size(500,500);
background(255);
pushMatrix();
fill(#714949);
rectMode(CENTER);
rect(150,400,10,300);
popMatrix();
pushMatrix();
noFill();
stroke(#714949);
ellipse(150,200,50,100);
popMatrix();
}

void draw()
{
 //Halterung
pushMatrix();
fill(#714949);
rectMode(CENTER);
rect(150,400,10,300);
popMatrix();
pushMatrix();
noFill();
stroke(#714949);
ellipse(150,200,50,100);
popMatrix();


if (mousePressed == true)
{



background(255);
 //Halterung
pushMatrix();
fill(#714949);
rectMode(CENTER);
rect(150,400,10,300);
popMatrix();
pushMatrix();
noFill();
stroke(#714949);
ellipse(150,200,50,100);
popMatrix();

translate(200,height/2);

for (int i=0; i<40; i+=1) {
  translate(counter/8,0);
ellipse(sin(counter/24),-40+random(-20,20),random(40,60),random(40,60));
counter +=0.03;
stroke(#283C9D);
}


}
else
{

}
}



