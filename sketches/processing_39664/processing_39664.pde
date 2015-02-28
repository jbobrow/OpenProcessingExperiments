
class A
{
  float xspeed = 1.2;
 float x = 50;
 float y = 220;
 float yspeed = 3;
 
  void draw(){
    stroke(0);
  strokeWeight(5);
  noFill();
    beginShape();
vertex(100, 20);
vertex(140, 20);
vertex(225, 225);
vertex(170, 225);
vertex(150, 170);
vertex(95, 170);
vertex(75, 225);
vertex(20, 225);
vertex(100, 20);
endShape();
fill(255);
beginShape();
vertex(145,130);
vertex(100,130);
vertex(120,70);
vertex(145,130);
endShape();
  }
  void animate(){
    x += xspeed; 
    y -= yspeed; 
    
    if (x > 195 || x < 49) {
      xspeed *= - 1;
    }
   
    if (y > 220 || y < 40) {
      yspeed *= - 1;
    }
    if(y >= 220 && x <= 195){
    yspeed = 0;
    x = 80;
    y = 140;
    xspeed *= - 1;
}
   if(x >= 156 && y == 140){
      xspeed = 0;
    }
    noStroke();
    fill(x, y, 200);
    ellipse(x,y,10,10);
  }
}

