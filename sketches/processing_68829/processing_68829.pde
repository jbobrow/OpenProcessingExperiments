
boolean isCarrot;

void setup() {
  setupAudio();
  size(700, 800);
}

void draw() {
  background(#9BEFFA); 

  // Draw the mouth.
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0, 100, 2, 50);  // now we can use it for something!

  noStroke();

  if(Y < 38) {
    textSize(40);
    textAlign(CENTER);
    fill(255);
    text("Shhh... be very, very quiet.", 350, 50); 
    fill(0, 102, 153);
  
    fill(#FFD9ED);
    bezier(200, 135,  30, 45, 230, 20,  240, 130);
    bezier(470, 130,  630, 20, 670, 175,  430, 135);
    ellipse(350, 200, 400, 250);
    ellipse(350, 450, 400, 450);
    ellipse(200, 650, 200, 100);
    ellipse(500, 650, 200, 100);  
  
    fill(#E8ACCB);
    if(isCarrot) {
      int xAdd = mouseX/30;
      int yAdd = mouseY/30;
      if(mouseY < 400) {
        yAdd = -mouseY/30;
      }
      else {
        yAdd = mouseY/30;
      }
      ellipse(140+xAdd, 400+yAdd, 100, 90);
      ellipse(440-xAdd, 400+yAdd, 100, 90);
      
//    float ex = 300;
//    float ey = 100;
//    float dx = constrain((mouseX-ex)/20, -14, 14);
//    float dy = constrain((mouseY-ey)/20, -14, 14);
//    
//    ellipse(300+dx, 200+dy, Y+30, Y+30);
//    ellipse(400+dx, 200+dy, Y+30, Y+30); 

    }
    else{
      ellipse(140, 400, 100, 90);
      ellipse(440, 400, 100, 90);    
    } 
  
    fill(255);
    ellipse(300, 200, 90, 90);
    ellipse(400, 200, 90, 90);

    stroke(0);
    strokeWeight(4);
    line(350, 264, 350, 280);
    noStroke();
    
    fill(0);
    triangle(344, 280, 358, 275, 354, 280);

    

  
    fill(#E8ACCB);
    triangle(340, 250, 360, 250, 350, 270);
    
  
    // The rest of the code just draws the Eye:
    float ex = 300;
    float ey = 100;
    float dx = constrain((mouseX-ex)/20, -14, 14);
    float dy = constrain((mouseY-ey)/20, -14, 14);
    
    fill(0);
    if(isCarrot) {
      ellipse(300+dx, 200+dy, Y+30, Y+30);
      ellipse(400+dx, 200+dy, Y+30, Y+30); 
    }
    else {
      ellipse(300, 200, Y+30, Y+30);
      ellipse(400, 200, Y+30, Y+30); 
    }
    
  }
  
  else {
    background(#940700);
    fill(255, 0, 3);
    textSize(50);
    textAlign(CENTER);
    text("I SAID BE QUIET, DAMNIT!", 350, 70); 
    
    fill(#FFD9ED);
    bezier(200, 235,  30, 145, 230, 120,  240, 230);
    bezier(470, 230,  630, 120, 670, 275,  430, 235);
    ellipse(350, 250, 400, 250);
    ellipse(350, 450, 450, 450);
    ellipse(220, 640, 200, 120);
    ellipse(480, 640, 200, 120);  
    
    stroke(0);
    strokeWeight(7);
    line(250, 210, 300, 240);
    line(440, 220, 390, 240);
    noStroke();
   
    
    fill(#E8ACCB);
    triangle(340, 260, 360, 260, 350, 275);
    
    ellipse(190, 210, 100, 90);
    ellipse(460, 200, 100, 90);
   
  }
  
  drawCarrot();

}

void mouseClicked() {
  isCarrot = !isCarrot;
}

void drawCarrot() {
  if(isCarrot) {
    fill(#FFC64A);
    triangle(mouseX-30, mouseY-30, mouseX+30, mouseY-30, mouseX, mouseY+70); 
  
    fill(#57D63E);
    triangle(mouseX-30, mouseY-30, mouseX-40, mouseY-90, mouseX-20, mouseY-30);
    triangle(mouseX-20, mouseY-30, mouseX-32, mouseY-90, mouseX-10, mouseY-30);
    triangle(mouseX-10, mouseY-30, mouseX-18, mouseY-90, mouseX-00, mouseY-30);
    triangle(mouseX-00, mouseY-30, mouseX-02, mouseY-90, mouseX+00, mouseY-30);
    triangle(mouseX+10, mouseY-30, mouseX+15, mouseY-90, mouseX+00, mouseY-30);
    triangle(mouseX+20, mouseY-30, mouseX+27, mouseY-90, mouseX+10, mouseY-30);
    triangle(mouseX+30, mouseY-30, mouseX+40, mouseY-90, mouseX+20, mouseY-30);
  }
}
