
float angle=0;
void setup() {
size (700,300);
ellipseMode(CENTER);
}


void draw() {
background(175);
noStroke();

float seconds=map(second(),0,59,0,width);

pushMatrix();
translate(width/2,height/2);
rotate(seconds);
fill(0,255,121,50);
ellipse(0,0,10,50);
fill(0,255,121,50);
ellipse(0,0,50,10);
popMatrix();


float minutes=map(minute(),0,59,0,width);

fill(161,255,3,75);
rect(0,225,minutes,20);



float hours=map(hour(),0,23,0,width);

fill(255,144,144,75);
rect(0,225,hours,20);


}
