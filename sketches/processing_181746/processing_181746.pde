

void setup () {
  size(800,530);
}

void draw () {
  fill(#000000);
  strokeWeight(7); 
  stroke(#ffffff);
  background(#000000);
  triangle (252, 285, 358, 130, 456, 285);
  ellipse(358,230,105.5,105.5);
  line(358, 285, 358, 130);


  strokeWeight(3);
  line(0,300,310,195);
    
  noStroke();
  fill(#ed1c24);
  quad (800, 265, 800, 245, 387, 170, 394, 180);
  fill(#fff200);
  quad (800, 285, 800, 265, 394, 180, 399, 190);
  fill(#00a651);
  quad (800, 305, 800, 285, 399, 190, 405.5, 200);
  fill(#0055a5);
  quad (800, 325, 800, 305, 405.5, 200, 412, 210);
 }


