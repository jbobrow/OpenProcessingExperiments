
void setup(){
  size(400,400);
  background(75, 55, 251);  
}

void draw(){
    smooth();
  
  //snowman's body
  stroke(1);
  noStroke();
  strokeWeight(2);
  fill(249);
  ellipse(width/2, height-75, 200, 200);
  ellipse(width/2, height-175, 150, 150);
  ellipse(width/2, height-275, 100, 100);
  
  //eyes
  fill(0);
  ellipse(176,116,21,21);
  ellipse(224,116, 21, 21);
  
  //nose
  fill(#FF9408);
  triangle(192, 159, 253, 139, 191, 135);
  
  //buttons
   frameRate(5);
  fill(random(255),0,0);
  ellipse(width/2, height-202, 15, 15);
  ellipse(width/2, height-164, 15, 15);
  ellipse(width/2, height-126, 15, 15);
  
  //arms
  noStroke();
  fill(#795802);
  triangle(77,199, 34, 150, 156, 200);
  triangle(323,199, 366, 150, 244, 200);
  
    //snow in front of snowman
    noStroke();
  fill(255,255,255);
  rect(0,(400-frameCount/5), width, (frameCount/5));
  
  //words
  frameRate(5);
  fill(random (255),0,0);
  textAlign(CENTER);
  textSize(26);
  text("MERRY CHRISTMAS!", width/2, height/8);
  
//Snow
stroke(255);
strokeWeight(1);

for (int i = 0; i < 10; i = i+1)
{
  for (int j = 0; j < 10; j = j+1)
  {
    point(random(i*40, (i+1)*40), random(height));
    }
  
  }
  
}

