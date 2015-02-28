
void setup(){
size(400,400);
}

void draw(){
    background(0,0,255);
translate(width/2,height/2);
rectMode(CENTER);

/*
for (int i=-200;i<200;i+=25){
    stroke(100);
    line(i,-200,i,200);
    line(-200,i,200,i);
    }
    */


fill(0,200,0);

noStroke();


//triangle(0,-150,-50,-75,50,-75);
triangle(0,-100,-75,-25,75,-25);
triangle(0,-60,-75,25,75,25);
triangle(0,-25,-75,75,75,75);
triangle(0,25,-75,125,75,125);
fill(#AD7C33);
rect(0,137,50,25);
beginShape();

pushMatrix();
translate(0,-110);
rotate(PI/5);
fill(255,255,0);
for (int i=0;i<5;i++){
    triangle(-10,0,10,0,0,20);
    rotate(2*PI/5);
    }

popMatrix();

strokeWeight(15);
stroke(255,0,0);
point(-25,-50);
point (25,0);
point(-10,40);
point(25,100);
point(30,-46);
point(-45,5);
point(45,60);
point(-51,110);
point(-16,86);
strokeWeight(1);
noStroke();

stroke(0,0,375);
line(-18,-115,18,-115);

/*
fill(0,0,255);
textSize(20);
int newX=mouseX-200;
int newY=mouseY-200;
text("("+newX+", "+newY+")",mouseX-200,mouseY-200);
*/
}

