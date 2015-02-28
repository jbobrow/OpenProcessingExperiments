

void setup () { 
  size (500, 500); 
  background (220, 30, 50); 
  smooth();
} 

void draw () {
}

void mouseDragged () {
  pacman ();
} 

void pacman() {

  ellipseMode (CENTER);  
  color from = color(random(255), random(255), random(255), random(255));
  color to = color(random(255), random(150), random(105));
  color dadah1 = lerpColor(from, to, .30);
  color dadah2 =lerpColor(from, to, .10);
  fill(dadah1);
  stroke(dadah2);
  strokeWeight(3); 
  arc(mouseX, mouseY, 200, 200, -PI, 2.3);
  fill(0); 
  arc(mouseX-20, mouseY-23, 10, 20, -PI, 2.8);

}










