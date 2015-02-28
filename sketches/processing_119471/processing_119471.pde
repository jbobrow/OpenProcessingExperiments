
void setup(){

size(500,500);
background(255);


}

void draw(){
frameRate(1);
translate(width/2,height/2);
 strokeWeight(20);
 stroke(0);
  ellipse(0,0,450,450);
 
 
  

float sec = map(second(),0,60,0,360);
float min = map(minute(),0,60,0,360);
float std = map(hour(),0,12,0,360);



strokeWeight(5);
for (int i=0; i<360; i+=30) {
pushMatrix();
rotate(radians(i));
translate(0, 200);
line(0, 0, 0.00001, 20);
popMatrix();
}



pushMatrix();
strokeWeight(2);
rotate(radians(sec));
translate(0, -170);
rect(0, 0,1, 170);
rectMode(LEFT);
popMatrix();



pushMatrix();
strokeWeight(4);
rotate(radians(min));
translate(0, -150);
rect(0, 0,1, 150);
rectMode(LEFT);
popMatrix();

pushMatrix();
strokeWeight(7);
rotate(radians(std));
translate(0, -70);
rect(0, 0,1, 70);
rectMode(LEFT);
popMatrix();

 stroke (random (255),0,0);
  strokeWeight(10);
  ellipse(0,0,10,10);

}
