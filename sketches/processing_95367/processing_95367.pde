
void setup(){
  size(700,700); //size of canvas
  background(0);
}
void draw() {
  background (90,75,47);
   ellipse(300, 280, 155, 155);
  fill(225,162,152);
  ellipse(300, 280, 200, 200);
    fill (225,162,152);
     ellipse(280, 270, 300, 300);
  fill (225,162,152);
   ellipse(290, 300, 100, 100);
      fill(random(0,225),random(0,225),random(0,225));
      ellipse(230,180, 80, 80); //bigger eye left
       fill (random(0,225),random(0,225),random(0,225));
      ellipse(345,180, 80, 80); //bigger eye right
    fill(0);
    ellipse(230, 180, 20, 20); //eye
     ellipse(340, 180, 20, 20); //eye
   fill(0);
    ellipse(310, 310, 20, 20); //right nose
     ellipse(270, 310, 20, 20); //left nose 
}


