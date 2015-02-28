
void setup() {
size(600,600);
background(0,168,255);

stroke(255);
fill(100);
rect(0,600,100,400);

}

void draw() {
//background(random(255));

//background(random(255));
stroke(255);
fill(0,0,255);
line(random(600),random(600),random(600),random(600));

stroke(255);
fill(255,85,0,50);
ellipse(300,300,random(-300,300),random(-300,300));

/*fill(random(255));
ellipse(random(600),random(600),mouseX,mouseY);
*/
}

