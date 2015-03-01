
void setup()
{
size(500,500);
background(0);
stroke(0);
}

void draw()
{
  
//Kreis
background(0);
translate(width/2,height/2);
background(0);
noFill();
ellipse(0,0,400,400);
stroke(0);
strokeWeight(1);



//Variablen
float msekunde = map(second(),0,60,0,2*PI);
println(msekunde);
float mminute = map(minute(),0,59,0,2*PI);
println(mminute);
float mstunde = map(hour(),0,12,0,2*PI);
println(mstunde);

//Sekundenzeiger
pushMatrix();
rotate(msekunde);
stroke(255);
strokeWeight(1);
line(0,0,0,-150);
popMatrix();

//Minutenzeiger
pushMatrix();
rotate(mminute);
stroke(255);
strokeWeight(2);
line(0,0,0,-200);
popMatrix();

//Stundenzeiger
pushMatrix();
rotate(mstunde);
stroke(255);
strokeWeight(5);
line(0,0,0,-150);
popMatrix();
}
