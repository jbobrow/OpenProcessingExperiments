
//Wenda Lewis Teh
//Class Assignment 5
//Feb 26

void setup() {
  size (575, 575);
}

void draw() {
  background(0);
  for (int grid=0; grid<width; grid+=25) {
    stroke(93);
    line (grid, 0, grid, height);
    line (0, grid, width, grid);
  }
  fill(0);
  noStroke();
  rect(100, 50, 375, 100);
  textSize(32);
  fill(255);
  text("ALL TOGETHER NOW!", 125, 100);
  textSize(15);
  text("(ALL TOGETHER NOW)", 215, 120);


  cubethree();
  cubetwo();
  cubeone();
}

void cubeone () {
  if (mouseX<250 && mouseX>150 && mouseY>450 || mouseY<175) {
    for (int cube=550; cube>random(100,450); cube= cube -5) {
      stroke(255, 0, 239);
      line(250, cube, 150, cube); //front
      stroke(193, 8, 181);
      line(150, cube, 50, cube-100); //left
      stroke(203, 187, 0);
      line(250, cube, 150, cube-100); //right
      stroke(250, 230, 0);
      line(150, cube-100, 50, cube-100); //back
    }
  } 
  else {
    for (int cube=550; cube>450; cube= cube-5) {
      stroke(255, 0, 239);
      line(250, cube, 150, cube); //front
      stroke(193, 8, 181);
      line(150, cube, 50, cube-100); //left
      stroke(203, 187, 0);
      line(250, cube, 150, cube-100); //right
      stroke(250, 230, 0);
      line(150, cube-100, 50, cube-100); //back
    }
  }
}
void cubetwo () {
  if (mouseX>300 && mouseX<400 && mouseY>450 || mouseY<175) {
    for (int cube=550; cube>random(0,250); cube= cube -5) {
      stroke(255, 83, 3);
      line(400, cube, 300, cube); //front
      stroke(196, 89, 2);
      line(300, cube, 200, cube-100); //left
      stroke(2, 168, 216);
      line(400, cube, 300, cube-100); //right
      stroke(3, 198, 255);
      line(300, cube-100, 200, cube-100); //back
    }
  }
  else {
    for (int cube=550; cube>450; cube= cube-5) {
      stroke(255, 83, 3);
      line(400, cube, 300, cube); //front
      stroke(196, 89, 2);
      line(300, cube, 200, cube-100); //left
      stroke(2, 168, 216);
      line(400, cube, 300, cube-100); //right
      stroke(3, 198, 255);
      line(300, cube-100, 200, cube-100); //back
    }
  }
}

void cubethree () {  
  if (mouseX>450 && mouseX<550 && mouseY>450 || mouseY<175) {
    for (int cube=550; cube>random(10,400); cube= cube -5) {
      stroke(0, 23, 255);
      line(550, cube, 450, cube); //front
      stroke(12, 56, 229);
      line(450, cube, 350, cube-100); //left
      stroke(5, 170, 36);//
      line(550, cube, 450, cube-100); //right
      stroke(7, 229, 16);//
      line(450, cube-100, 350, cube-100); //back
    }
  } 
  else {
    for (int cube=550; cube>450; cube= cube-5) {
      stroke(0, 23, 255);
      line(550, cube, 450, cube); //front
      stroke(12, 56, 229);
      line(450, cube, 350, cube-100); //left
      stroke(5, 170, 36);//
      line(550, cube, 450, cube-100); //right
      stroke(7, 229, 16);//
      line(450, cube-100, 350, cube-100); //back
    }
  }
}
