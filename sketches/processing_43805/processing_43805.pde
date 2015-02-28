
void setup(){
  size(400, 400);
  background(20, 30, 200);
  smooth();
}

void draw(){
  noStroke();
  
  for (int i = 10; i < 390; i = i + 15){
    fill(255);
    ellipse(i, 10, 7, 7);
    ellipse(i-5, 20, 7, 7);
    ellipse(i, 30, 7, 7);
    ellipse(i-5, 40, 7, 7);
    ellipse(i, 50, 7, 7);
    ellipse(i-5, 60, 7, 7);
    ellipse(i, 70, 7, 7);
    ellipse(i-5, 80, 7, 7);
    ellipse(i, 90, 7, 7);
    ellipse(i-5, 100, 7, 7);
  }
  
  //yellow bigger triangle
  for(int i = 85; i < 270; i = i + 35){
    fill(255, 205, 3);
    triangle(i, 400, i + 50, 400, i + 25, 290);
  } 
  //yellow smaller triangle
  for(int i = 67; i < 300; i = i + 35){
    noStroke();
    fill(255, 205, 3);
    triangle(i, 400, i + 50, 400, i + 25, 300);
  }
  //orange bigger triangle
  for(int i = 85; i < 280; i = i + 35){
    noStroke();
    fill(193, 85, 2);
    triangle(i, 400, i + 50, 400, i + 25, 320);
  }
  
  //orange smaller triangle
  for(int i = 100; i < 250; i = i + 35){
    noStroke();
    fill(193, 85, 2);
    triangle(i, 400, i + 50, 400, i + 25, 340);
  }
  
  //red triangle
  for(int i = 100; i < 250; i = i + 35){
    noStroke();
    fill(155, 8, 0);
    triangle(i, 400, i + 50, 400, i + 25, 350);
  }
}


