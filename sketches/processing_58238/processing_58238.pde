


float full_distance;

void setup () { 
  size (500,500);
  smooth();
  noStroke();
  full_distance = dist (0,0,width,height); //
}

void draw () {
  background (51);
  
  for (int i = 0; i <= width; i += 100) {
    for (int j = 0; j <= height; j += 100) {
      float point = dist(mouseX,mouseY,i,j);
      point = point/full_distance * 80; // 
      ellipse(i,j,point,point);
    }
  }
   for (int i = 0; i <= width; i += 50) {
    for (int j = 0; j <= height; j += 50) {
      float point = dist(mouseX,mouseY,i,j);
      point = point/full_distance * 50;
      fill (random(255),random(255),random(255));
      ellipse(i,j,point,point);
  
}
   }
   
      for (int i = 0; i <= width; i += 150) {
    for (int j = 0; j <= height; j += 150) {
      float point = dist(mouseX,mouseY,i,j);
      point = point/full_distance * 50;
      fill (random(255),random(255),random(255));
      ellipse(i,j,point,point);
  
}
   }
  
}

