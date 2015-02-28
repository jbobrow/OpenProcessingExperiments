

void setup(){
   size(640, 480);
}

void draw(){
  float l = map(mouseX, 0, 640, 143, 190);
  float r = map(mouseX, 0, 640, 437, 485);
  float u = map(mouseY, 0, 480, 170, 235);
  smooth();
  if(mousePressed == false){
    background(220);
    noStroke();
    fill(179, 146, 111);
    quad(150, 0, 490, 0, 390, 420, 240, 420);
    //left eye
    fill(255, 0, 0);
    ellipse(95, 200, 50, 10);
    ellipse(235, 200, 50, 10);
    fill(255, 192, 0);
    stroke(255, 0, 0);
    strokeWeight(2);
    ellipse(165, 200, 150, 150);
    //right eye
    noStroke();
    fill(255, 0, 0);
    ellipse(390, 200, 50, 10);
    ellipse(530, 200, 50, 10);
    fill(255, 192, 0);
    stroke(255, 0, 0);
    strokeWeight(2);
    ellipse(460, 200, 150, 150);
    
    //left iris
    if(pmouseX > l && pmouseX < 220 && pmouseY > 175 && pmouseY < 225){
       stroke(255, 0, 0);
       strokeWeight(2);
       fill(92, 222, 255);
       ellipse(l, u, 80, 45);
       noStroke();
       fill(255, 0, 252);
       ellipse(l, u, 10, 30);
       ellipse(l, u, 60, 10);
       fill(255);
       ellipse(185, 180, 20, 20);
      }
     else{
       stroke(0);
       strokeWeight(2);
       fill(0);
       ellipse(l, u, 80, 45);
       noStroke();
       fill(255);
       ellipse(185, 180, 20, 20);
     }
     
     //right iris
    if(pmouseX > r && pmouseX < 505 && pmouseY > 175 && pmouseY < 225){
       stroke(255, 0, 0);
       strokeWeight(2);
       fill(92, 222, 255);
       ellipse(r, u, 80, 45);
       noStroke();
       fill(255, 0, 252);
       ellipse(r, u, 10, 30);
       ellipse(r, u, 60, 10);
       fill(255);
       ellipse(480, 180, 20, 20);
      }
     else{
       stroke(0);
       strokeWeight(2);
       fill(0);
       ellipse(r, u, 80, 45);
       noStroke();
       fill(255);
       ellipse(480, 180, 20, 20);
     }
  }
  else{
    if(pmouseX > 75 && pmouseX < 225 && pmouseY > 125 && pmouseY < 275){
      //left eye
      background(220);
      noStroke();
      fill(179, 146, 111);
      quad(150, 0, 490, 0, 390, 420, 240, 420);
      fill(255, 0, 0);
      ellipse(95, 200, 50, 10);
      ellipse(235, 200, 50, 10);
      stroke(255, 0, 0);
      strokeWeight(8);
      line(95, 200, 230, 200);
      
      //right eyeris
      noStroke();
      fill(255, 0, 0);
      ellipse(390, 200, 50, 10);
      ellipse(530, 200, 50, 10);
      fill(255, 192, 0);
      stroke(255, 0, 0);
      strokeWeight(2);
      ellipse(460, 200, 150, 150);
      stroke(0);
      strokeWeight(2);
      fill(0);
      ellipse(r, u, 80, 45);
      noStroke();
      fill(255);
      ellipse(480, 180, 20, 20);
    }
    else if(pmouseX > 375 && pmouseX < 530 && pmouseY > 125 && pmouseY < 275){
      //right eye
      background(220);
      noStroke();
      fill(179, 146, 111);
      quad(150, 0, 490, 0, 390, 420, 240, 420);
      fill(255, 0, 0);
      ellipse(390, 200, 50, 10);
      ellipse(530, 200, 50, 10);
      stroke(255, 0, 0);
      strokeWeight(8);
      line(390, 200, 530, 200);
      
      //left eyeris
      noStroke();
      fill(255, 0, 0);
      ellipse(95, 200, 50, 10);
      ellipse(235, 200, 50, 10);
      fill(255, 192, 0);
      stroke(255, 0, 0);
      strokeWeight(2);
      ellipse(165, 200, 150, 150);
      stroke(0);
      strokeWeight(2);
      fill(0);
      ellipse(l, u, 80, 45);
      noStroke();
      fill(255);
      ellipse(185, 180, 20, 20);
    }
    
    else if(pmouseX < 360 && pmouseX > 280 && pmouseY > 200 && pmouseY < 280){
      background(220);
      noStroke();
      fill(179, 146, 111);
      quad(150, 0, 490, 0, 390, 420, 240, 420);
      stroke(255, 0, 0);
      strokeWeight(6);
      line(135, 135, 250, 205);
      line(135, 265, 250, 205);
      line(495, 135, 375, 205);
      line(495, 265, 375, 205);
    }
  }
}

