

//start 1°draw the background with bianco
size(950, 950);
background(255);
//2°start draw the circle like the watercolor
for(float positionX_circle = 0; positionX_circle <= width; positionX_circle +=120) {
  for(float positionY_circle = 0; positionY_circle <= height; positionY_circle += 120) { 
    for (int i = 0; i <= 70; i++) { //sure how much possibly circle we will draw and make sure that the loop of i is more than the draw loop 
      float changecolor = norm(i, 0, 70);
      color left = color(217, 197, 147);
      color right = color(237, 237, 185);
      color fill_circle = lerpColor(left, right, changecolor);
      fill(fill_circle);
      noStroke();
      float size_circle = random(50, 80);
      ellipseMode(CENTER);
      ellipse(positionX_circle + random(-100, 100), positionY_circle + random(-100, 100), size_circle, size_circle);
    }
  }
}
filter(BLUR);
//3°start draw the rhombic with the loop lines
strokeWeight(1); 
stroke(255); 

for(float positionY_rhomblc1 = 0; positionY_rhomblc1 <= 1130; positionY_rhomblc1 +=9) {  
  for(int w = 0; w <= 26; w++) {
    if(positionY_rhomblc1 == 72 + 45*w || positionY_rhomblc1 == 81+45*w) {
      continue;
    }
      line(0, positionY_rhomblc1, width, positionY_rhomblc1 - 180); 
      smooth();  
  }
}
for(float positionY_rhomblc2 = 909; positionY_rhomblc2 >= -180; positionY_rhomblc2 -=9) {  
  for(int w = 0; w <= 26; w++) {
    if(positionY_rhomblc2 == 882 - 45*w || positionY_rhomblc2 == 873 + 45*w) {
      continue;
    }
      line(0, positionY_rhomblc2, width, positionY_rhomblc2 + 180); 
      smooth(4);
  }
}

//4°start draw the cloud random
PImage cloud = loadImage("cloud.png");
for(int i=1; i<30; i++){
  float positionX_cloud = random(-50, 1000);
  float positionY_cloud = random(-50, 1000);
  image(cloud, positionX_cloud, positionY_cloud);
}

//5°start draw the white point random
  color A = color(255, 255, 122, 200);
  color B = color(79, 196, 123, 175);
  color fill_point = lerpColor(A, B, random(0,1));
for(int i2=1;i2<9000; i2++){
  float positionX_point = random(0, 950);
  float positionY_point = random(0, 950);
  fill(fill_point);
  noStroke();
  ellipse(positionX_point, positionY_point, 3, 3);
}


