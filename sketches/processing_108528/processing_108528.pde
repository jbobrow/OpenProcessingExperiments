
//Nintendo's Boo by Meghan Grisham 2013
void setup(){
  size(500,500);
  smooth();
  background(255);
  noCursor();
}
void draw(){
  size(500,500);
  smooth();
  background(255);
  ellipseMode(CENTER);

  //his left arm
stroke(0);
strokeWeight(1);
fill(0,mouseY,mouseX);
ellipse(mouseX+50,mouseY,30,20);
  //body
fill(0,mouseY,mouseX);
ellipse(mouseX,mouseY,100,100);
  //eyes
fill(0);
ellipse(mouseX+20,mouseY-10,10,20);
ellipse(mouseX,mouseY-10,10,20);
fill(250);
ellipse(mouseX+20,mouseY-14,6,10);
ellipse(mouseX,mouseY-14,6,10);
noFill();
  //eyebrows
arc(mouseX+20,mouseY-25,20,10,0,PI);
arc(mouseX,mouseY-25,20,10,0,PI);
  //mouth
fill(#D60606);
arc(mouseX+10,mouseY+10,30,60,0,PI);
  //tongue
noFill();
arc(mouseX-45,mouseY+35,120,35,-QUARTER_PI,0);
  //fangs
fill(255);
triangle(mouseX-5,mouseY+10,mouseX,mouseY+20,mouseX+5,mouseY+10);
triangle(mouseX+5,mouseY+10,mouseX+7.5,mouseY+17,mouseX+10,mouseY+10);
triangle(mouseX+10,mouseY+10,mouseX+12,mouseY+17,mouseX+15,mouseY+10);
triangle(mouseX+15,mouseY+10,mouseX+20,mouseY+20,mouseX+25,mouseY+10);
  //tail
fill(0,mouseY,mouseX);
curve(mouseX+100,mouseY+100,mouseX-30,mouseY+40,mouseX-45,mouseY+20,mouseX+150,mouseY+100);
  //his right arm
ellipse(mouseX-40,mouseY+10,20,30);
noStroke();
rect(mouseX-48,mouseY-10,20,10);

    //MOUSE CLICK
if (mousePressed==true){
fill(0,mouseY,mouseX);
 //clean slate
ellipse(mouseX+10,mouseY,50,90);
  //eye brows
stroke(0);
arc(mouseX+20,mouseY-17,20,10,0,PI);
arc(mouseX,mouseY-17,20,10,0,PI);
  //blush
fill(#D60606);
noStroke();
ellipse(mouseX+10,mouseY-2,25,12);
  //closed right eye
stroke(0);
line(mouseX-10,mouseY-10,mouseX+5,mouseY-5);
line(mouseX-10,mouseY,mouseX+5,mouseY-5);
  //closed left eye
line(mouseX+30,mouseY-10,mouseX+15,mouseY-5);
line(mouseX+30,mouseY,mouseX+15,mouseY-5);
  //fangs
fill(255);
triangle(mouseX-5,mouseY+10,mouseX,mouseY+20,mouseX+5,mouseY+10);
triangle(mouseX+15,mouseY+10,mouseX+20,mouseY+20,mouseX+25,mouseY+10);
  //mouth
noFill();
strokeWeight(1.5);
arc(mouseX+10,mouseY+13,35,10,PI,TWO_PI);

}else{
noFill();
}}


