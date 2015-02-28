
float counter=0;

void setup(){
size(500,500);

// background(255);

if(hour()>6 && hour()<=19) {
background(255); 
}

}
void draw() {

noStroke();
fill(200);
ellipse(width/2,height/2,300,300);
fill(200);
noStroke();
ellipse(420,80,140,140);
ellipse(80,420,140,140);
if (hour()>= 20 && hour()<= 23) {
background(0);}
if(hour()>=1 && hour()<=6){
background(0);}

float sec = map(second(),0,60,0,360);
float min = map(minute(),0,60,0,360);
float std = map(hour(),0,12,0,360);


if(hour()>6 && hour()<=19) {
fill(100); 
}


colorMode(HSB,360,100,100);
float h = map(sin(counter),-1,1,100,180);
if (hour()>= 20 && hour()<= 23) {
//background(0);
fill(h,100,100);
//stroke(h,100,100);
counter+=0.01;
}
if(hour()>=1 && hour()<=6){
fill(h,100,100); 
counter+= 0.01;}
//stundenzeiger
translate(width/2,height/2);

pushMatrix();
noStroke();
rotate(radians(std));
translate(0,-125);
//fill(255);
ellipse(0,0,30,30);

popMatrix();
resetMatrix();

//sekundennzeiger


pushMatrix();
translate(420,80);
//noFill();
strokeWeight(5);
//stroke(100);
//ellipse(0,0,120,120);
//fill(255);
noStroke();
rotate(radians(sec));
translate(0,-60);
ellipse(0,0,15,15);
popMatrix();

//minutenanzeige
pushMatrix();
translate(80,420);
//fill(255);
//noFill();
strokeWeight(5);
//stroke(100);
//ellipse(0,0,120,120);
//fill(255);
noStroke();
rotate(radians(min));
translate(0,-60);
ellipse(0,0,20,20);
popMatrix();








}
