
void draw () {
 
  
  background (12, 40, 95);
  noStroke ();
  fill (255, 255, 255);
  ellipse (130, 130, 160, 160);
  fill (12, 40, 95);
  ellipse (160, 160, 140, 140);
   if(mousePressed){
    background (84, 199, 203);
    fill (255, 239, 54);
    ellipse (500, 50, 45, 45);
  }
  fill (245, 245, 245);
  ellipse(0,
  (frameCount % height), 3, 3);
 ellipse(0,
  (frameCount % height), 2, 2);
  ellipse(width/4,
          2*(frameCount/3 % (height/3)), 3, 3);
  ellipse(width/2,
          3*(frameCount/4 % (height/2)), 3, 3);
  ellipse(3*width/4,
          4*(frameCount/4 % (height/4)),2, 2);
  ellipse(3*width/2,
          2*(frameCount/3 % (height/8)),2, 2);
  ellipse(3*width/5,
          4*(frameCount/3 % (height/6)),3, 3);
  strokeWeight (45);
  stroke (0);
  line (0, 400, 600, 400);
  noStroke ();
  fill (0,0,0);
  ellipse (450, 380, 50, 80);
  ellipse (450, 330, 35, 35);
  triangle (440, 340, 425, 310, 460, 318);
  triangle (458, 340, 477, 310, 440, 318);
  
}

void setup () {
  background (12, 40, 95);
  size (600, 400);
}
