
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  
float sekunde_1 = map(second(),0,59,0,2*PI);

pushMatrix();
translate(width/2, height/2);
noStroke();
fill(millis()/1000.0,150,255-millis()/500.0);
rotate(sekunde_1);
ellipse(150,150,50,50);
popMatrix();

float sekunde_2 =map(second(),0,59,0,2*PI);

pushMatrix();
translate(width/2, height/2);
//stroke(0);
smooth();
fill(millis()/1000.0,150,255-millis()/100.0);
rotate(-sekunde_1);
ellipseMode(CENTER);
ellipse(150,150,-50,50);
popMatrix();


float minute_1 = map(minute(),0,59,0,2*PI);

pushMatrix();
translate(width/2,height/2);
stroke(150,48,95,120);
smooth();
//fill(150,45,90,250);
rotate(minute_1);
line(0,0,50,-150);
popMatrix();



float stunde_1=map(hour(),0,24,0,4*PI);

pushMatrix();
translate(width/2, height/2);
stroke(45,96,150,30);
smooth();
//fill(45,96,150,30);
rotate(stunde_1);
line(0,0,0,-100);
popMatrix();

}
  
  
  
  
  

