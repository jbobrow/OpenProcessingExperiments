
void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  
  if (mouseX <= 91) {
    background(0, 255, 0);  
    rect(0, 215, 300, 40);

    //Running Mr. Stickman
    ellipseMode(CENTER);
    ellipse(225, 235, 17, 7);
    line(200, 200, 190, 223);
    line(190, 223, 195, 233);
    line(190, 223, 187, 227);
    line(187, 227, 182, 224);
    line(193, 206, 198, 215);
    line(193, 206, 187, 208);
    line(198, 215, 203, 210);
    ellipseMode(CENTER);
    ellipse(199, 202, 10, 10);
    text("OH, PLEASE NO!", 50, 100); 

    //Bus
    rect(mouseX-50, 175, 150, 55); 
    rect(mouseX+75, 185, 20, 45);
    rect(mouseX-45, 185, 115, 20);
    ellipseMode(CENTER);
    ellipse(mouseX-15, 230, 20, 20);
    ellipse(mouseX+61, 230, 20, 20);
  }

  if (mouseX > 91) {
    background(255, 230, 0);  
    rect(0, 215, 300, 40);

    //Currently getting hit Mr. Stickman
    ellipseMode(CENTER);
    ellipse(225, 235, 17, 7);
    line(230, 205, 206, 220);
    line(206, 220, 200, 227);
    line(206, 220, 198, 218);
    ellipseMode(CENTER);
    ellipse(230, 205, 10, 10);
    line(225, 210, 235, 215);
    line(225, 210, 231, 216);
    ellipseMode(CENTER);
    text("AHHHHHH.....", 130, 100); 

    //Bus
    rect(mouseX-50, 175, 150, 55);  
    rect(mouseX+75, 185, 20, 45);
    rect(mouseX-45, 185, 115, 20);
    ellipseMode(CENTER);
    ellipse(mouseX-15, 230, 20, 20);
    ellipse(mouseX+61, 230, 20, 20);
    fill(255, 0, 0);
    noStroke();
    ellipse(mouseX+90, 200, 15, 2);
    ellipse(mouseX+90, 205, 7, 1);
    ellipse(mouseX+88, 206, 5, 2);
    stroke(1);
    fill(255);
  }

  if (mouseX > 120) {
    background(255, 0, 0);  
    rect(0, 215, 300, 40);

    //S.O.L Mr. Stickman
    ellipseMode(CENTER);
    ellipse(225, 235, 17, 7);
    line(228, 232, 216, 232);
    line(228, 232, 217, 235);
    line(255, 230, 228, 232);
    ellipseMode(CENTER);
    ellipse(255, 230, 10, 10);
    line(245, 231, 257, 235);
    text("..........", 200, 100); 

    //Bus
    rect(mouseX-50, 175, 150, 55); 
    rect(mouseX+75, 185, 20, 45);
    rect(mouseX-45, 185, 115, 20);
    ellipseMode(CENTER);
    ellipse(mouseX-15, 230, 20, 20);
    ellipse(mouseX+61, 230, 20, 20);
    fill(255, 0, 0);
    noStroke();
    ellipse(mouseX+90, 200, 15, 2);
    ellipse(mouseX+90, 205, 7, 1);
    ellipse(mouseX+88, 206, 5, 2);
    ellipse(mouseX+89, 202, 7, 2);
    ellipse(mouseX+92, 203, 5, 1.5);
    ellipse(mouseX+100, 204, 6, 2);
    ellipse(mouseX+99, 208, 10, 2);
    ellipse(mouseX+90, 220, 15, 2);
    ellipse(mouseX+90, 218, 7, 1);
    ellipse(mouseX+88, 217, 5, 2);
    ellipse(mouseX+89, 215, 7, 2);
    ellipse(mouseX+92, 213, 5, 1.5);
    ellipse(mouseX+100, 210, 6, 2);
    ellipse(mouseX+99, 212, 10, 2);
    stroke(1);
    fill(255);
  }

  if (mousePressed) {
    if (mouseX <= 91) {
      background(0, 255, 0);  
      rect(0, 215, 300, 40);

      //Running Mr. Stickman
      ellipseMode(CENTER);
      ellipse(225, 235, 17, 7);
      line(200, 200, 190, 223);
      line(190, 223, 195, 233);
      line(190, 223, 187, 227);
      line(187, 227, 182, 224);
      line(193, 206, 198, 215);
      line(193, 206, 187, 208);
      line(198, 215, 203, 210);
      ellipseMode(CENTER);
      ellipse(199, 202, 10, 10);
      text("OH, PLEASE NO!", 50, 100); 

      //Bus
      rect(mouseX-50, 175, 150, 55);  
      rect(mouseX+75, 185, 20, 45);
      rect(mouseX-45, 185, 115, 20);
      ellipseMode(CENTER);
      ellipse(mouseX-15, 230, 20, 20);
      ellipse(mouseX+61, 230, 20, 20);
    }

    if (mouseX > 91) {
      background(0, 255, 0);  
      rect(0, 215, 300, 40);

      //manhole
      fill(0);
      ellipseMode(CENTER); 
      ellipse(225, 235, 17, 7);
      fill(255);

      //Mr. Stickman disappearing through manhole
      ellipse(243, 235, 17, 7);
      ellipse(243, 233, 17, 7);
      line(221, 225, 225, 235);
      line(222, 230, 225, 218);
      ellipse(221, 225, 10, 10);
      line(222, 230, 215, 220);
      text("WOOOAAHH!!", 100, 100);

      //Bus 
      rect(mouseX-50, 175, 150, 55);
      rect(mouseX+75, 185, 20, 45);
      rect(mouseX-45, 185, 115, 20);
      ellipseMode(CENTER);
      ellipse(mouseX-15, 230, 20, 20);
      ellipse(mouseX+61, 230, 20, 20);
    }

    if (mouseX > 110) {
      background(0, 255, 0);  
      rect(0, 215, 300, 40);
      
      //manhole
      fill(0);
      ellipseMode(CENTER); 
      ellipse(225, 235, 17, 7);
      fill(255);
      ellipse(243, 235, 17, 7);
      ellipse(243, 233, 17, 7); 
      
      //Bus
      rect(mouseX-50, 175, 150, 55);  
      rect(mouseX+75, 185, 20, 45);
      rect(mouseX-45, 185, 115, 20);
      ellipseMode(CENTER);
      ellipse(mouseX-15, 230, 20, 20);
      ellipse(mouseX+61, 230, 20, 20);
    }

    if (mouseX > 280) {
      background(0, 255, 0);   
      rect(0, 215, 300, 40);
      
      //manhole
      fill(0);
      ellipseMode(CENTER); 
      ellipse(225, 235, 17, 7);
      fill(255);
      ellipse(243, 235, 17, 7);
      ellipse(243, 233, 17, 7);
      text("THAT WAS A CLOSE ONE...", 130, 100); 
      
      //Bus
      rect(mouseX-50, 175, 150, 55);  
      rect(mouseX+75, 185, 20, 45);
      rect(mouseX-45, 185, 115, 20);
      ellipseMode(CENTER);
      ellipse(mouseX-15, 230, 20, 20);
      ellipse(mouseX+61, 230, 20, 20);
      
      //Mr. Stickman's head 
      ellipse(225, 227, 10, 10);
    }
  }
}


