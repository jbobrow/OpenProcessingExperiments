
float mx;
float my;
float easing = 0.05;
int i = 10;

void setup() {
size(640, 480);

}

void draw() {
  
noStroke();
smooth();

background(255);
frameRate = 24;
float d = dist(width/2, height/2, mouseX, mouseY);
d = constrain(d, 0, 150);



//iris
int timer = frameCount;
float dx = mouseX - pmouseX;
float dy = mouseY - pmouseY;



if  (timer%10 == 0) {
if (dx == 0 && dy == 0) {

  float r = random(0, 400);
    mx = mx + (r - mx) * easing;
    my = my + (r - my) * easing;

}}
else



  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }


  mx = constrain(mx, 230, width - 270);
  my = constrain(my, 170, height - 220);


    
    fill(0);
  ellipse(mx + (mouseX - mx) * .02, my + (mouseY- my) * .02, 125, 125);
  
  fill(40);
  ellipse(mx+ (mouseX - mx) * .03, my + (mouseY- my) * .03, 110-d/50, 110-d/50);
  
  fill(0);
  ellipse(mx + (mouseX - mx) * .04, my+ (mouseY- my) * .04, 100-d/20, 100-d/20);
  
  fill(40);
  ellipse(mx + (mouseX - mx) * .05, my+ (mouseY- my) * .05, 90-d/30, 90-d/30);
  
  fill(0);
  ellipse(mx + (mouseX - mx) * .06, my + (mouseY- my) * .06, 75-d/50, 75-d/50);
  
  fill(40);
  ellipse(mx + (mouseX - mx) * .07, my + (mouseY- my) * .07, 65-d/50, 65-d/50);
  
  noFill();
  stroke(90);
  strokeWeight(3);
  strokeCap(ROUND);
  ellipse(mx + (mouseX - mx) * .06, my + (mouseY- my) * .06, 60-d/50, 60-d/50);
  
  noStroke();
  fill(0);
  ellipse(mx + (mouseX - mx) * .08, my + (mouseY- my) * .08, 20+d/20, 20+d/20);
  
  fill(255);
  
  PShape lid1;
  lid1 = loadShape("lid1.svg");
  lid1.disableStyle();
  shape(lid1, 130, -80+d/6);
  
  PShape lid2;
  lid2 = loadShape("lid2.svg");
  lid2.disableStyle();
  shape(lid2, 170, 250-d/6);
  
  PShape det1;
  det1 = loadShape("det1.svg");
  det1.enableStyle();
  shape(det1, 170, 250-d/4.5);

  PShape det2;
  det2 = loadShape("det2.svg");
  det2.enableStyle();
  shape(det2, 130, -20-d/12);
}



