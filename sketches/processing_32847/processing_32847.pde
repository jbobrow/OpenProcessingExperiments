
background(40,0,200);
smooth();
 
int rad = 60;
 
float centerX, centerY;
centerX = random(100, width-50);
centerY = random(100, height-50);
 

 
if(centerX > width/2 && centerY < height/2){
  fill(0);
  noStroke();
  ellipse(centerX, centerY, rad, rad);
}
if(centerX < width/2 && centerY > height/2){
  fill(5, 40, 80);
  strokeWeight(2);
  stroke(255);
  rect(centerX, centerY, rad*2, rad*2);
}

if(centerX > width/2 && centerY > height/2){
  fill(200,0,2);
  noStroke();
  rect(centerX, centerY, rad, rad);
}
if(centerX < width/2 && centerY < height/2){
  fill(255);
  noStroke();
  rect(0, 0, 248, 248);
 
}

                
                
