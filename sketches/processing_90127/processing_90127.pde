
//Aviva Silberstein
//February 17, 2013
//Screen Divided into 4 doing "cool" stuff! 



void setup(){
  size(400, 400);
  background(255);
}

void draw () {
  stroke(0);
  strokeWeight(1);
  
//top left square
  if((mouseX>400) && (mouseX<0));
  if((mouseY>400) && (mouseY<0));
  fill(95, 25, 79);
  rect(0, 0, 200, 200);
  fill(147, 21, 130);
  noStroke();
  ellipse(90, 90, mouseX, mouseY);
  fill(183, 54, 166);
  noStroke();
  ellipse(75, 75, mouseX, mouseY);
  fill(201, 112, 180);
  noStroke();
  ellipse(50, 50, mouseX, mouseY);
  fill(240, 181, 226);
  noStroke();
  ellipse(25, 25, mouseX, mouseY);
  fill(242, 225, 238);
  ellipse(10, 10, mouseX, mouseY);
 
 
 
//bottom left square
if((mouseY>0) && (mouseX<0));
    fill(185, 146, 206);
    rect(0, 200, 200, 200);
    if (mousePressed==true) {
    fill(255, 31, 199);
    rect(0, 200, 200, 200);
    fill(10, 70, 65);
    }
     

// top right square
strokeWeight(5);
  fill(135, 6, 206);
  rect(200, 0, 200, 200);
  if((mouseX>200)&&(mouseX<400))
  if((mouseY>0)&&(mouseY<200)){
    fill(66, 12, 95);
    rect(200, 0, 200, 200);
  }


    
    
//bottom right square
    fill(184, 22, 222);
    rect(200, 200, 200, 200);
    if ((mouseX>200) && (mouseX<400))
    if((mouseY>200) && (mouseY<400)) {
       fill(171, 140, 227);
       rect(mouseX, mouseY, 100, 100);
       fill(116, 41, 178);
       rect(mouseX, mouseY, 100, 50);
       
       
    } 


    
    
}
