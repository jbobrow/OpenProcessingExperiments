
//Combining transformations
float angle = 0.0;
float fish=10;
int space= 10;
int move= 1;
void setup()
{
  size(500,500);
 background(0);
  smooth();
}

void draw()
{
stroke(30,130,10);
 fill(255,0);
 ellipse(250,250,fish+random(-50,50),fish+random(-50,50));
fish=fish+random(0,20);
if (fish> 500)
fish=(250);

  pushMatrix();
  
  translate(250,250);

  rotate(angle);
  noFill();
  stroke(10,255,255);
  line(25,25,75,75);
  stroke(1);
  rect(0,0,25,25);
  fill(167,73,0,10);
  angle+=500;

  popMatrix();

  pushMatrix();
  translate(250,250);
  rotate(angle);
  ellipse(100,100,25,25);
  strokeWeight(0);


  


  popMatrix();
  pushMatrix();
  translate(250,250);
  rotate(angle);
  rect(100,100,25,25);
  strokeWeight(0);





  popMatrix();
  stroke(255);



  
 

}


