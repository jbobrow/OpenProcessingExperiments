
//53078019 Lau Yik Kiu
void setup(){
  size(400, 400); //indicate the window size
  frameRate(5); // indicate the speed of the programme
}

void draw(){
  //for structures
  for (int x = 0; x <= 400; x = x + 20){ //for-loop 1
    for(int y = 0; y <= 400; y = y + 20){ //for-loop 2
      fill((int)250, random(200), random(250));
      strokeWeight(1);
      stroke(255);
      rect((int)x , y, x+100, y+100);
      
      //if-else structure
      if(mousePressed){//condition of pressing the mouse
          strokeWeight(3);
          stroke(150);
          line(200, 0, 200, 150);
          smooth();
          fill((int)random(200, 255));
          noStroke();
          ellipse(200, 150, 200, 200);
          //text part
          textSize(50);
          fill((int)random(200, 255),random(200, 255), random(200, 255), random(255));
          text("PARTY TIME!!", 40, 350);
        }else{//when the mouse was not pressed
          //black background
          background(0);
          //text part
          fill(70);
          textSize(20);
          text("switch on the light please", 80, 350);
          //the light switch
          fill(255);
          strokeWeight(2);
          stroke(100);
          rect(mouseX, mouseY, 80, 120);
          rect(mouseX + 20, mouseY + 20, 40, 80);
          strokeWeight(3);
          stroke(255, 200, 0);
          line(mouseX + 40, mouseY + 40, mouseX + 40, mouseY + 50);
          ellipse(mouseX + 40, mouseY + 75, 10, 15);
      }
  }
}
}
