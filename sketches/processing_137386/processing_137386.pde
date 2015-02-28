
float rectX;
float xspeed = 10;
float rectY;
float yspeed = 10;

void setup(){
  size(720, 480);
  smooth();
  rectY = 0;
}

void draw(){
  background(255, 230, 240);
  stroke(0);
  fill(255);
  
 //eyeball
  fill(random(230,255), random(100, 230), random(200, 255));
  rect(200, 125, 100, 200);
  rect(400, 125, 100, 200);
  
 //pupil
 if (mouseY < 125){
  noStroke();
  fill(mouseY, 230, mouseX);
  ellipse(260, 250, 75, 130);
  ellipse(460, 250, 75, 130);
 }
 
 else if ((mouseY > 125) && (mouseY < 250)){
  noStroke();
  fill(mouseY, 230, mouseX);
  ellipse(250, 250, 75, 130);
  ellipse(450, 250, 75, 130);
 }
 
 else if (mouseY > 250){
  noStroke();
  fill(mouseY, 230, mouseX);
  ellipse(240, 250, 75, 130);
  ellipse(440, 250, 75, 130);
 }
  
 //eyelid
  if ((mouseY > 125) && (mouseY < 325)){
    fill(255, 230, 240);
    noStroke();
    rect(195, mouseY-250, 110, 250);
    rect(395, mouseY-250, 505, 250);
    stroke(0);
    line(180, mouseY, 320, mouseY); 
    line(380, mouseY, 520, mouseY);
  }
  
  else if (mouseY >= 325){
    noStroke();
    fill(255, 230, 240);
    rect(195, 120, 320, 325);
    rect(395, 120, 520, 325);
    stroke(0);
    line(180, 325, 320, 325);
    line(380, 325, 520, 325);
  }
  
  else if (mouseY <= 125){
    stroke(0);
    line(180, 125, 320, 125);
    line(380, 125, 520, 125);
  }
  
  if (keyPressed){
   if (key == 'a'){
    noStroke();
    fill(255, 230, 240);
    rect(180, 120, 150, 325);
    stroke(0);
    line(180, 325, 320, 325);
   }
  }
  
  //bouncing bar
  fill(random(230,255), random(100, 230), random(200, 255));
  noStroke();
  rect(rectX, random(rectY), 30, 30);
  rect(random(rectX), rectY, 30, 30);
   rectX = rectX + xspeed;
   rectY = rectY + yspeed;
  
if((rectX > width) || (rectX < 0)){
    xspeed = xspeed * -1;
  }
  
if((rectY > height) || (rectY < 0)){
    yspeed = yspeed * -1;
  }
    
  
}


