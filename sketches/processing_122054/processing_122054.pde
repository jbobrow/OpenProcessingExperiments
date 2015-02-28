
void MyMode4() {

/*
  //background mouse  conditional
  if (mouseX>300) {
    fill(0, 0, 255, 20);
  } 
  else {
    fill(255, 0, 0, 20);
  }
  rect(0, 0, 600, 600);

  //background mouse  conditional
  if (mouseY>300) {
    fill(0, 0, 255, 20);
  } 
  else {
    fill(255, 0, 0, 20);
  }
  rect(130, 10, 700, 600);
  */



  strokeWeight(1);
  stroke(255);
  line(mouseX/3, mouseY/3, 600, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 600, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 600, 600);

  stroke(255);
  line(mouseX/3, mouseY/3, 0, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 0, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 0, 600);

  //triangle starting from top 2 corners
  strokeWeight(100);
  stroke(255);
  line(mouseX/3, mouseY/3, 600, 0);
  stroke(255);
  line(mouseX/9, mouseY/9, 600, 0);
  stroke(255);
  line(mouseX/18, mouseY/18, 600, 0);

  stroke(255);
  line(mouseX/3, mouseY/3, 0, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 0, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 0, 600);






  //coordinate shapes and colors:
  y = mouseX;
  z = mouseY;
  noStroke();
  fill(0, mouseY, 0, 80);  
  triangle(100, 500, 500, 100, y, z);
  fill(mouseY, 0, 0, 80);
  triangle(600, 30, 30, 600, z, z);
  fill(0, 0, mouseX, 80);
  triangle(0, 125, 125, 0, z, y);
  fill(0, mouseX, 0, 80);
  triangle(450, 150, 150, 450, z, z);
  fill(mouseX, 0, 0, 80);
  triangle(150, 150, 200, 200, y, y);

  //variables and loops
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j+=10) {

      if (mouseX > i && mouseX < i+10 && 
        mouseY > j && mouseY < j+10) {
        fill(255);
      } 
      else {
        noFill();
      }
      rect(i, j, 10, 10);
    }
  }
      //WHITE BOXES HIDING EXCESS
 strokeWeight(0);
  fill(255);
  rect(680, 0, 200, 800);
  rect(0, 600, 800, 200);
  rect(0, 0, 830, 200);
}


