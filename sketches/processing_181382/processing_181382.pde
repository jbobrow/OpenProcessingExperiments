
float balX, balY, diameter;
int score=0;
float v= 0.02;
PImage cirkel;
void setup () {
  size (700, 700);
  background (10);
  balX = random (60, 640);
  balY = random (60, 640);
  diameter = random (120, 250); 
  cirkel = loadImage ("circle.png");
  
}

void draw () {
   textAlign(CENTER, CENTER);
   background (10);
   textSize (17); text("Score: "+score, 350, 60);
  imageMode (CENTER); image (cirkel,balX, balY,diameter, diameter);
   
if (diameter<=0) {background (184, 0, 0); 
 textSize (80);  
textAlign(CENTER, CENTER); text("GAME OVER", 350, 250);
textSize (21); textAlign (CENTER); text ("Your score:" + score, 350, 350);
   text ("Press enter to play again", 350, 420);}
  if (mousePressed == true) {if (dist(balX, balY, mouseX, mouseY) < diameter * 0.5){
  diameter = random (120, 250); 
  balX = random (60, 640);
  balY = random (60, 640);
    score ++;
    background (0);
  }
}

if (diameter >0) {stroke (255);
  strokeWeight(7);
  line (mouseX, 0, mouseX, 700);
  line (0, mouseY, 700, mouseY);
}
 
    
  
  diameter= diameter - 0.2 * v;
 v = v + 0.01;
  }

void keyPressed () {
  if(key == ENTER){
    v= 0.02;
    score =0;
  size (700, 700);
  background (10);
  balX = random (60, 640);
  balY = random (60, 640);
  diameter = random (120, 250); 
  cirkel = loadImage ("circle.png");
  textAlign(CENTER, CENTER);
   background (10);
   textSize (17); text("Score: "+score, 350, 60);
  imageMode (CENTER); image (cirkel,balX, balY,diameter, diameter);
if (diameter<=0) {background (184, 0, 0); 
 textSize (80);  
textAlign(CENTER, CENTER); text("GAME OVER", 350, 250);
textSize (21); textAlign (CENTER); text ("Your score:" + score, 350, 350);
text ("Press enter to play again", 350, 420);
   }
  if (mousePressed == true) {if (dist(balX, balY, mouseX, mouseY) < diameter * 0.5){
  diameter = random (120, 250); 
  balX = random (60, 640);
  balY = random (60, 640);
    score ++;
    background (0);
  }
if (diameter >0) {stroke (255);
  strokeWeight(7);
  line (mouseX, 0, mouseX, 700);
  line (0, mouseY, 700, mouseY);
}
 
  diameter= diameter - 0.3 * v;
 v = v + 0.01;
}
  }}


