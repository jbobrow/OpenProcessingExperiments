
float x;
float easing = 0.03;

void setup(){
  size(600, 400);
  smooth();
  strokeWeight(12);
  smooth();
  }
  
void draw(){
 background(100, 75, 240);
 stroke(0);
 line(300, 150, mouseX, mouseY); //Left arm line
 stroke(0);
 float mx = map(mouseX, 0,width, 60, 180);
 line(280, 150, mx, mouseY); //Right arm line
 rect(280, 150, 20, 80);  //torso
 line(280, 230, 275, 350);  //left leg
 line(300, 230, 305, 350);  //right leg
 line(275, 350, 260, 350);  //left foot
 line(305, 350, 320, 350);  //right foot
 line(290, 150, 290, 125);  //neck
 ellipse(290, 110, 30, 40); //Head
 fill(0, 255, 0);
 stroke(0, 255, 0);
 rect(0, 360, 600, 90);
 
 float targetX = mouseX;
 x += (targetX - x) * easing;
 ellipse(x, 40, 12, 12);
 println(targetX + " : " + X);
}


