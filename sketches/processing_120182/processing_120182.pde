
void setup(){
  size(500,500);
  

}
void draw() {
  background(255);
    noStroke();
  fill(#A2F27A);
  ellipse(width/2,height/2,300,300);
  fill(200);
  noStroke();
  ellipse(420,80,140,140);
  ellipse(80,420,140,140);
  fill(255);
  pushMatrix();
  
  translate(width/2,height/2);
  float sec = map(second(),0,60,0,360);
 float min = map(minute(),0,60,0,360);
float std = map(hour(),0,12,0,360);

 stroke(0);

//stundenzeiger
rotate(radians(std));
translate(0,-150);
rectMode(CENTER);
fill(200);
rect(0,0,30,30);
popMatrix();


 //sekundennzeiger
 fill(#A2F27A);
 
pushMatrix();
translate(420,80);
rotate(radians(sec));
translate(0,-70);
ellipse(0,0,10,10);
popMatrix();

//minutenanzeige
pushMatrix();
stroke(0);
translate(80,420);
rotate(radians(min));
translate(0,-70);
ellipse(0,0,20,20);
popMatrix();




  
  
}
