
//rotating star with random scaling
//try to use left click,right click
//PRESS S TO SAVE IMAGE, PRESS OTHER KEYS TO CLEAR ALL
//by KokFu Lok


float theta1=0;
void setup()
{
  size(800,600);
  background(0);
  smooth();
} 

void polygon(int n, float cx, float cy, float r)//define polygon
{
float angle = (360.0 / n);
beginShape();
vertex(cx + r * cos(radians(angle * 0-18)), cy + r * sin(radians(angle * 0-18)));
vertex(cx + r * cos(radians(angle * 2-18)), cy + r * sin(radians(angle * 2-18)));
vertex(cx + r * cos(radians(angle * 4-18)), cy + r * sin(radians(angle * 4-18)));
vertex(cx + r * cos(radians(angle * 1-18)), cy + r * sin(radians(angle * 1-18)));   
vertex(cx + r * cos(radians(angle * 3-18)), cy + r * sin(radians(angle * 3-18)));
endShape(CLOSE);
}

void draw(){
   if (mousePressed && (mouseButton == LEFT)) {
    fill(random(255),mouseX,mouseY,30);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(mouseY,noise(255),mouseX,80);
  } else {
 noFill();  
  }

  stroke(pmouseY,pmouseX,random(255));
 translate(pmouseX,pmouseY);
// rotate(millis() * 0.001 * TWO_PI / 10.0); //this is rotate define by time
 rotate(theta1);
polygon(5,0,0,cos(mouseX)*random(100-400));
   theta1 +=0.02;
}

void keyPressed() {
  if (key == 's' || key == 'S'){
saveFrame("screen-####.png");}
else{
  fill(0);
  noStroke();
  rect(0,0,width,height);}
}




