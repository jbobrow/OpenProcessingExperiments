
void setup() {
 size(700, 700);
 noStroke();
  
}
 
void draw() {
  smooth();
  background(10,0,30);
  //orbits
noFill();
stroke(255,30);
strokeWeight(1);
ellipse(350,350,150,150);
ellipse(350,350,300,300);
ellipse(350,350,600,600);
ellipse(350,350,800,800);
//stars
  for(int i = 0; i < 4; i++) {
    float stars = random(3, 10);
    fill(255, random(180, 255));
    ellipse(random(0, 700), random(0,700), stars, stars);
  }
//sun
noStroke();
  fill(250, 215, 0);
  ellipse(width/2, height/2, 50, 50);
//earth
  fill(61,89,171);
  ellipse(mouseX,mouseY,20,20);
 //mars
 fill(220, 20, 60);
 ellipse(mouseY+50,mouseX+50,35,35);
  }


