
void setup() {
  size(600, 600);
  background(255);
 
  fill(255,0,0);
  rect(0, 0, 40, 40);
  fill(255,94,0);
  rect(40, 0, 40, 40);
  fill(255, 243, 0);
  rect(80, 0, 40, 40);
  fill(20,103,4);
  rect(120, 0, 40, 40);
  fill(3,232,0);
  rect(160, 0, 40, 40);
  fill(3,255,164);
  rect(200, 0, 40, 40);
    fill(0,197,255);
  rect(240, 0, 40, 40);
fill(0,25,232);
  rect(280, 0, 40, 40);
  fill(95,2,162);
  rect(320, 0, 40, 40);
  fill(255,3,95);
  rect(360, 0, 40, 40);
 fill(255,185,204); 
  rect(400, 0, 40, 40);
  fill(173,173,173);
  rect(440, 0, 40, 40);
   fill(85,85,85); 
  rect(480, 0, 40, 40);
fill(0);
  rect(520, 0, 40, 40);
  fill(255);
  rect(560, 0, 40, 40);
 
}

void draw () {
 
    if(mouseX>0 && mouseX<40 && mouseY>0 && mouseY<40) {
   fill(255,0,0);
  stroke (255,0,0);
}
  
  if(mouseX>40 && mouseX<80 && mouseY>0 && mouseY<40) {
      fill(255,94,0);
    stroke (255,94,0);
}

  if(mouseX>80 && mouseX<120 && mouseY>0 && mouseY<40) {
  fill(255, 243, 0);
    stroke(255, 243, 0);
}
  
  if(mouseX>120 && mouseX<160 && mouseY>0 && mouseY<40) {
     fill(20,103,4);
 stroke(20,103,4);
  }
  
  if(mouseX>160 && mouseX<200 && mouseY>0 && mouseY<40) {
  fill(3,232,0);
    stroke(3,232,0);
  }
  
  if(mouseX>200 && mouseX<240 && mouseY>0 && mouseY<40) {
  fill(3,255,164);
    stroke(3,255,164);
  }
  
  if(mouseX>240 && mouseX<280 && mouseY>0 && mouseY<40) {
    fill(0,197,255);
    stroke(0,197,255);
  }
  
  if(mouseX>280 && mouseX<320 && mouseY>0 && mouseY<40) {
fill(0,25,232);
    stroke(0,25,232);
  }
  
  if(mouseX>320 && mouseX<360 && mouseY>0 && mouseY<40) {
  fill(95,2,162);
    stroke(95,2,162);
  }
  
  if(mouseX>360 && mouseX<400 && mouseY>0 && mouseY<40) {
  fill(255,3,95);
    stroke(255,3,95);
  }
  
  if(mouseX>400 && mouseX<440 && mouseY>0 && mouseY<40) {
 fill(255,185,204); 
    stroke(255,185,204); 
  }
  
  if(mouseX>440 && mouseX<480 && mouseY>0 && mouseY<40) {
  fill(173,173,173);
    stroke(173,173,173);
  }
  if(mouseX>480 && mouseX<520 && mouseY>0 && mouseY<40) {
   fill(85,85,85); 
    stroke(85,85,85); 
  }
   if(mouseX>520 && mouseX<560 && mouseY>0 && mouseY<40) {
  fill(0);
    stroke(0);
  }
 if(mouseX>560 && mouseX<600 && mouseY>0 && mouseY<40) {
  fill(255);
    stroke(255);
  }
  
  if(mousePressed && mouseY>50){
    line(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(5);
  }
       
}


