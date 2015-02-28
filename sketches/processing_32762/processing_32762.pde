
size(500, 500);
background(255, 0, 127);
smooth();

int rad = 60;

float centerX, centerY;
centerX = random(50, width-50);
centerY = random(50, height-50);

//or
//int centerX, centerY;
//centerX = round(random(0, 100));

//quadrants
stroke(0);
strokeWeight(5);
line(width/2, 0, width/2, height);
line(0, height/2, width, height/2);

//if the ball is on the right sideof the screen
//change color to green
//first, where is the circle

if(centerX > width/2 && centerY < height/2){
  fill(0);
  noStroke();
  ellipse(centerX, centerY, rad, rad);
}
if(centerX < width/2 && centerY > height/2){
  fill(8, 255, 203);
  noStroke();
  ellipse(centerX, centerY, rad*2, rad*2);
}
if(centerX > width/2 && centerY > height/2){
  fill(255, 231, 8);
  noStroke();
  ellipse(centerX, centerY, rad, rad);
}
if(centerX < width/2 && centerY < height/2){
  fill(255);
  noStroke();
  rect(0, 0, 248, 248);
  fill(255, 0, 0);
  noStroke();
  ellipse(centerX, centerY, rad, rad);
}
