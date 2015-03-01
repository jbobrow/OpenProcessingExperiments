
void setup()
{
  size(500,500);
  background(0);
  
}
void draw ()
{
background(255);
translate(width/2,height/2);
fill(10,20,30);
ellipse(0,0,350,350);



pushMatrix();
noFill();
stroke(10,20,30);
ellipse(0,0,400,400);
popMatrix();


pushMatrix();
float sec=map(second(),0,60,0,360); 
  println(sec);
  rotate(radians(sec));
  fill(10,20,30);
  ellipse(0,200,30,30);
  popMatrix();
  
 
 
pushMatrix();
float min=map(minute(),0,60,0,360);
println(min);
rotate(radians(min));
 translate(0,-140);
stroke(255);
strokeWeight(6);
line(0,0,0,140);
popMatrix();

pushMatrix();
float h=map(hour(),0,12,0,360);
println(h);
rotate(radians(h));
 translate(0, -100);
stroke(255);
strokeWeight(6);
line(0,0,0,100);
popMatrix();






pushMatrix();
ellipse(0,170,20,20);
popMatrix();

pushMatrix();
ellipse(0,-170,20,20);
popMatrix();

pushMatrix();
ellipse(170,0,20,20);;
popMatrix();

pushMatrix();
ellipse(-170,0,20,20);
popMatrix();

pushMatrix();
ellipse(0,0,20,20);
popMatrix();


}
