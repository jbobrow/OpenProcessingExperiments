
float headPosX;
float headPosY; 
color colorHead;
color colorArms;

float headBodyX;
float headBodyY; 



void setup() {
  size(600,600);
  background(250);
  
  headPosX=300;
  headPosY=250;
  colorHead= color (77,153,255);
  colorArms= color (random(255), random(255), random(255));
  
  headBodyX=300;
  headBodyY=370;
  
  
}

void draw() { 
  
  background(250);
  
  
  //eyes 1
   noStroke();
   fill(0);
   rectMode(CENTER);
   rect(headPosX-20 + mouseX, headPosY-10 + mouseY, 12,25);
   
   //eyes 2
   noStroke();
   fill(colorArms);
   rectMode(CENTER);
   rect(headPosX+20 + mouseX, headPosY-10 + mouseY, 12,25);
   
   
   //head
  noStroke();
  fill(colorHead); 
  rectMode(CENTER);
  rect(headPosX + mouseX, headPosY+mouseY, 100, 100);
 
   
  //rect 1 side
  noStroke();
  fill(colorHead);
  rect(headPosX-55 + mouseX, headPosY + mouseY,15,50);
  
  //rect 2 side
  noStroke();
  fill(colorHead);
  rect(headPosX+50 + mouseX, headPosY + mouseY, 15,50);
  
  //rect 3 side
  noStroke();
  fill(colorHead);
  rect(headPosX + mouseX, headPosY -5 + mouseY, 50,15);
  
  
  //body
  noStroke();
  fill(colorHead);
  rectMode(CENTER);
  rect(headBodyX + mouseX, headBodyY + mouseY, 120,150);
  
  //leg left
  noStroke();
  fill(colorHead);
  rect(headBodyX+30 + mouseX, headBodyY+100 + mouseY, 35, 80);
  
  //shoes left
  noStroke();
  fill(colorHead);
  rect(headBodyX-42 + mouseX, headBodyY+150 + mouseY, 60, 25);
  
  
  //leg right
  noStroke();
  fill(colorHead);
  rect(headBodyX-30 + mouseX, headBodyY+100 + mouseY, 35,80);

  //shoes left
  noStroke();
  fill(colorHead);
  rect(headBodyX+42 + mouseX, headBodyY+150 + mouseY, 60, 25);
  
  //arm 1
  noStroke();
  fill(colorArms);
  rect(headBodyX-70 + mouseX, headBodyY + mouseY, 20, 120);
  
  //arm 2
  noStroke();
  fill(colorArms);
  rect(headBodyX+70 + mouseX, headBodyY + mouseY, 20, 120);
  //strokeWeight(6);
  //noFill();
  //stroke(0);
  //arc(headBodyX+70 + mouseX, headBodyY+74 + mouseY, 35, 35, -PI, 0);
  
  if(keyPressed){
     if(key == 's'){
     saveFrame();
}

}
}

void keyPressed() { 
  fill(0);
  rect(headPosX + mouseX, headPosY+mouseY, 200, 200);
  rect(headPosX-55 + mouseX, headPosY + mouseY,30,100);
  rect(headPosX+50 + mouseX, headPosY + mouseY, 30,100);
  rect(headPosX + mouseX, headPosY -5 + mouseY, 100,30);
  rect(headBodyX + mouseX, headBodyY + mouseY, 240,300);
  rect(headBodyX+30 + mouseX, headBodyY+100 + mouseY, 70, 160);
  rect(headBodyX-42 + mouseX, headBodyY+150 + mouseY, 120, 50);
  rect(headBodyX-30 + mouseX, headBodyY+100 + mouseY, 70,160);
  rect(headBodyX+42 + mouseX, headBodyY+150 + mouseY, 120, 50);
  rect(headBodyX-70 + mouseX, headBodyY + mouseY, 40, 240);
  rect(headBodyX+70 + mouseX, headBodyY + mouseY, 40, 240);
}



//mouth eyes bigger



