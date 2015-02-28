
boolean woops=true;
float ran=random(255);
void setup() {
  size(1000, 1000);
  background(255, 244, 219);
  //background(0,0,0);

  rectMode(CENTER);
  ellipseMode(CENTER);

}
void draw() {


  for (int r =500;r>0;r=r-4) {
    //strokeWeight(2);
    fill(ran, ran+20, ran+80);
    
    int x=1000-r;//xdirection increasing
    int y=1000-r;//yincreasing 5oo-1000
    arc(r, r, r, r, HALF_PI, PI);
    arc(x, r, r, r, HALF_PI, PI);
    arc(r, y, r, r, HALF_PI, PI);
    arc(x, y, r, r, HALF_PI, PI);
    arc(width/2, r, r, r, HALF_PI, PI);
    arc(r, height/2, r, r, HALF_PI, PI);
    arc(width/2, y, r, r, HALF_PI, PI);
    arc(x, height/2, r, r, HALF_PI, PI);
    
    fill(255, 244, 219, 20);
    stroke(216, 0, 0);
    rect(r, r, r, r, .25);//topleftxdirectionsmaller,y direction smalle
    stroke(0, 216, 196);
    rect(x, r, r, r, .25);//toprightx direction gets bigger, ydirection gets smaller
    stroke(13, 216, 0);
    rect(r, y, r, r, .25);//bottomleftx direction smaller, y bigger
    stroke(250, 255, 0);
    rect(x, y, r, r, .25);//borromrightxdirection bigger, y bigger
    stroke(202, 10, 206);
    rect(width/2, r, r, r, .25);//topmiddle
    stroke(10, 18, 206);
    rect(r, height/2, r, r, .25);//sideleft
    stroke(255, 153, 0);
    rect(x, height/2, r, r, .25);//sideright
    stroke(183, 85, 255);
    rect(width/2, y, r, r, .25);//bottommiddle
  }
}
void mousePressed() {
  woops ^= true;

  println(woops);
  if (woops==true) {
    colorMode(HSB, 100);
  } 
  else {
    colorMode (RGB, 255);
  }
}
