
void setup()
{
  size(400,400);
}
void draw() {
  background(0,180,30);
  noStroke();
  fill(160,73,19);
  //body
  ellipse(width/2,height/2+45, 90, 95);
  //head
  ellipse(width/2,(height/2)-10, 75,80);
  //ears
  ellipse(width/2+30, height/2-45, 30,30);
  ellipse(width/2-30, height/2-45, 30,30);
  //arms
  ellipse(width/2-50, height/2+30, 40, 20);
  ellipse(width/2+50, height/2+30, 40, 20);
  //legs
  ellipse(width/2-35, height/2+87, 40,20);
  ellipse(width/2+35, height/2+87, 40,20);
  //nose
  stroke(0);
  fill(0);
  ellipse(width/2,height/2-8,40,20);
  //left eye
  ellipse(width/2-15, height/2-25, 10,10);
  //right eye
  ellipse(width/2+15, height/2-25, 10,10);
  }

                
                                                                        
