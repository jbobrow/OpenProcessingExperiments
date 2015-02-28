
void setup () {
  size(300, 300);
  ellipseMode(CENTER);
  rectMode(CORNER);
}

int moonDiameter = 90;
int starDiameter = 2;
int starDiameter1 = 1;

void draw () {
  if (mousePressed == true) {
    background(1, 5, 26);
    fill(252, 238, 186, 15);
    noStroke();
    ellipse(width-75, height-240, moonDiameter+10, moonDiameter+10);
    fill(252, 238, 186, 30);
    noStroke();
    ellipse(width-75, height-240, moonDiameter+7, moonDiameter+7);
    fill(255, 231, 142, mouseX);
    stroke(255, 255, 200, mouseX-40); 
    ellipse(width-75, height-240, moonDiameter, moonDiameter);
    fill(1, 5, 26);
    noStroke();
    ellipse(mouseX, height-243, moonDiameter+20, moonDiameter+20);
    rect(mouseX, (height-243)-((moonDiameter+5)/2), -(moonDiameter*2), moonDiameter+10);
    
    fill(252, 246, 224, mouseX-175); //star color and Alpha
    ellipse(width-290, height-200, starDiameter1, starDiameter1); //stars
    ellipse(width-280, height-190, starDiameter, starDiameter);
    ellipse(width-250, height-170, starDiameter1, starDiameter1);
    ellipse(width-200, height-160, starDiameter, starDiameter);
    
    ellipse(width-10, height-250, starDiameter1, starDiameter1);
    ellipse(width-25, height-235, starDiameter, starDiameter);
    ellipse(width-50, height-170, starDiameter1, starDiameter1);
    ellipse(width-100, height-180, starDiameter, starDiameter);
    
    ellipse(width-100, height-255, starDiameter1, starDiameter1);
    ellipse(width-125, height-245, starDiameter, starDiameter);
    ellipse(width-150, height-190, starDiameter1, starDiameter1);
    ellipse(width-155, height-220, starDiameter, starDiameter);
    
    ellipse(width-250, height-290, starDiameter1, starDiameter1);
    ellipse(width-275, height-285, starDiameter1, starDiameter1);
    ellipse(width-270, height-275, starDiameter1, starDiameter1);
    ellipse(width-272, height-272, starDiameter, starDiameter);
    
    ellipse(width-200, height-270, starDiameter1, starDiameter1);
    ellipse(width-235, height-265, starDiameter1, starDiameter1);
    ellipse(width-240, height-285, starDiameter1, starDiameter1);
    ellipse(width-252, height-282, starDiameter, starDiameter);
    
    ellipse(width-50, height-270, starDiameter1, starDiameter1);
    ellipse(width-120, height-265, starDiameter1, starDiameter1);
    ellipse(width-140, height-285, starDiameter1, starDiameter1);
    ellipse(width-135, height-282, starDiameter1, starDiameter1);
    
    ellipse(width-240, height-190, starDiameter1, starDiameter1);
    ellipse(width-235, height-185, starDiameter1, starDiameter1);
    ellipse(width-230, height-145, starDiameter1, starDiameter1);
    ellipse(width-242, height-22, starDiameter1, starDiameter1);
  }
}


