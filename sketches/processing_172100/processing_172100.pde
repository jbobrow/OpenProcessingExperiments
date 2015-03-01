
int currentScene = 0;
PImage img;
int counter = 1;

void setup() {
  size(730, 400);
  smooth();
  sceneOne();
  
  }

void draw(){ 

}

void sceneOne() {
  currentScene = 1;
  background(216, 240, 231);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  noStroke();
  fill(255, 0, 0);
  ellipse(40, 40, 20, 20);
  fill(0);
  ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  
  fill(255);
  noStroke;
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  stroke();
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  textSize(30);
  fill(20, 20, 160);
  text("Click on the button of the treble clef red note", 70,250);
  textSize(12);
  }
 void sceneTwo() {
  currentScene = 2;
  background(216, 240, 231);
  stroke(0);
  for (int i = 1; i < 6; i++) { 
   fill(0, 0, 0); 
  line( 0, i*20, 800, i*20);
  }
  noStroke();
  fill(0);
  ellipse(40, 40, 20, 20);
  fill(255,0,0);
  ellipse (110, 80, 20, 20);
  fill(0);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("time",350, 235);
  fill(255);
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  
 }
   
  void sceneThree() {
    currentScene = 3;
  background(216, 240, 231);
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  fill(0);
  noStroke();
  ellipse(40, 40, 20, 20);
  ellipse (110, 80, 20, 20);
  fill(255, 0,0);
  ellipse (180, 30, 20, 20);
  fill(0);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  noStroke();
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }
   void sceneFour() {
  currentScene = 4;
  background(216, 240, 231);
  strokeWeight(2);
  stroke(0);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  noStroke();
  fill(0);
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
   fill(255,0,0);
  ellipse(250, 60, 20, 20);
  fill(0);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  noStroke();
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }
 
 void sceneFive() {
  currentScene = 5;
  background(216, 240, 231);
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  noStroke();
  fill(0);
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  fill(255,0,0);
  ellipse( 320, 100, 20, 20);
  fill(0);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  noStroke();
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
 text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }
   
void sceneSix() {
  currentScene = 6;
  background(216, 240, 231);
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  fill(0);
  noStroke();
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  fill(255,0,0);
  ellipse( 390, 50, 20, 20);
  fill(0);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  noStroke();
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
   text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }   
  void sceneNine() {
  currentScene = 9;
  stroke(0);
  strokeWeight(2);
  background(216, 240, 231);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  fill(0);
  noStroke();
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  fill(255,0,0);
  ellipse (600, 70, 20, 20);
  fill(0);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  noStroke();
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }   
void sceneEight() {
  currentScene = 8;
  stroke(0);
  strokeWeight(2);
  background(216, 240, 231);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  noStroke();
  fill(0);
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  fill(255,0,0);
  ellipse (530, 90, 20, 20);
  fill(0);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  }   

void sceneSeven() {
  currentScene = 7;
  background(216, 240, 231);
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  fill(0);
  noStroke();
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  fill(255,0,0);
  ellipse (460, 20, 20, 20);
  fill(0);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  fill(255);
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
 text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  } 
  
  void sceneTen() {
  currentScene = 10;
  background(216, 240, 231);
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 6; i++) { 
  line( 0, i*20, 800, i*20);
  }
  fill(0);
  noStroke();
  ellipse(40, 40, 20, 20);
   ellipse (110, 80, 20, 20);
  ellipse (180, 30, 20, 20);
  ellipse(250, 60, 20, 20);
  ellipse( 320, 100, 20, 20);
  ellipse( 390, 50, 20, 20);
  ellipse (460, 20, 20, 20);
  ellipse (530, 90, 20, 20);
  ellipse (600, 70, 20, 20);
  fill(255,0,0);
  ellipse (690, 110, 20, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 105, 105);
  fill(255);
  ellipse(360, 200, 95, 95);
  fill(0);
  textSize(12);
  text("You tried", 340, 180);
  text("times",350, 235);
  
  fill(255);
  for(int j = 0; j<10; j++) {
    
    rect(40+j*70, 300, 38, 38);
  }
  fill(0);
  text("space", 41, 310);
  text("E", 50, 330);
  text("A", 120, 320);
  text("C", 190, 320);
  text("line", 255, 310);
  text("D", 260, 330);
  text("G", 330, 320);
  text ("line", 395, 310);
  text("F", 400, 330);
  text("B", 470, 320);
  text("space", 530, 310);
  text("F", 540, 330);
  text("space", 600, 310);
  text("D", 610, 330);
  text("line", 675, 310);
  text("E", 680, 330);
  } 

void sceneEleven() {
background(0);
//img = loadImage("funnyPic.jpg");
//image(img, 330, 50);
fill(255);
textSize(40);
text("You made it! Great job!", 130, 60);
noStroke();
  fill(255, 0, 0);
  ellipse (360, 200, 215, 215);
  fill(255);
  ellipse(360, 200, 205, 205);
}

void mouseReleased() {
    counter = counter + 1;
  }
 
  void mouseClicked() {
    if (currentScene == 1) {
      if( mouseX>250 && mouseX< 280 && mouseY > 300 && mouseY < 330) {
      sceneTwo();
      stroke(0);
       textSize (20);
      text (counter, 350, 210);
      
       }
    loop();
    }
  
  else if (currentScene == 2) {
     if( mouseX>320 && mouseX< 350 && mouseY > 300 && mouseY < 330) {
      sceneThree();
       stroke(0);
       textSize (20);
      text (counter, 350, 210);
       }
    loop();
    }
    else if (currentScene == 3) {
      if (mouseX>40 && mouseX<70 && mouseY > 300 && mouseY < 330) {
     sceneFour();
     stroke(0);
       textSize (20);
      text (counter, 350, 210);
      }
      loop();
    }
    else if (currentScene == 4) {
      if (mouseX > 460 && mouseX < 490 && mouseY < 330 && mouseY > 300) {
        sceneFive();
        stroke(0);
       textSize (20);
      text (counter, 350, 210);
  } 
loop();  
    } 
 else if (currentScene == 5) {
    if (mouseX > 670 && mouseX < 700 && mouseY > 300 && mouseY < 330) {
   sceneSix(); 
 stroke(0);
       textSize (20);
      text (counter, 350, 210); 
  }
  loop();
 } 
else if (currentScene == 6) {
   if (mouseX > 180 && mouseX < 210 && mouseY < 330 && mouseY > 300) {
    sceneSeven(); 
    stroke(0);
       textSize (20);
      text (counter, 350, 210);
  }
  loop();
}
else if (currentScene == 7) {
    if(mouseX > 390 && mouseX < 420 && mouseY < 330 && mouseY > 300) {
      sceneEight();
      stroke(0);
       textSize (20);
      text (counter, 350, 210);
  }
loop();
}
else if (currentScene == 8) {
    if (mouseX>530 && mouseX < 560 && mouseY < 330 && mouseY > 300)
    {
      sceneNine();
      stroke(0);
       textSize (20);
      text (counter, 350, 210);
  }
  loop();
} 
else if (currentScene == 9) {
    if (mouseX>110 && mouseX < 140 && mouseY < 330 && mouseY > 300) 
     {
       sceneTen();
       textSize (20);
       text (counter, 350, 210);
    }
    loop();
  }
  else if (currentScene == 10) {
      if(mouseX>600 && mouseX<630 && mouseY<330 && mouseY> 300) {
        sceneEleven();
        textSize(25);
        fill(0);
  text(counter, 350, 140);
  textSize(15);
  text("attempts", 330, 180);
  textSize(25);
  text("10", 350, 220);
  textSize(15);
 text ("questions", 330, 260); 
      }
  }
  }
  
  


