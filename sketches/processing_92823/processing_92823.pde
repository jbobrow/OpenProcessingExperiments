
// comments
// comments
void setup() {
  size(400, 400);
  smooth();
}

float sweat_y = 180;

void draw() {
  
  
  if (mousePressed)
      background(mouseX, mouseY, mouseX+mouseY-200);
  else
      background(200);
  strokeWeight(0.1);
  stroke(1, 1, 1);
  fill(175, 250, 22);  
  rect(105, 90, 190, 220, 10, 10); //face
  strokeWeight(2);
  
  
  strokeWeight(0.1);
  fill(160, 230, 160);    //color of sweat
  bezier(270, sweat_y - 20, 275, sweat_y, 280, sweat_y, 285, sweat_y - 20); //sweatdrop shape


  strokeWeight(5);
  stroke(1, 1, 1);
  fill(175, 250, 22); 
  curve (170, 160, 210, 200, 210, 220, 190, 280); //nose
  bezier(200, 100,  180, 80,  220, 100, 180, 75); //hair  

  fill(180, 190, 124);
  ellipse(150, 150, 30, 30); //left eye




  stroke(140, 20, 30);
  fill(190, 180, 25);
  rect(175, 250, 50, 20, 10, 10, 5, 5); //mouth

  if (mousePressed)
  {
  
    sweat_y = sweat_y + 7; //sweatdrop falls faster
  
    if (sweat_y > 280) //reset sweatdrop when it came down
        sweat_y = 180;
        
        
    fill(190, 180, 25);
    rect(175, 250, 50, 40, 10, 10, 5, 5); //mouth
    fill(140, 20, 30);
    strokeWeight(0.1);
    arc(200, 260, 30, 90, 0, PI); //tongue
    strokeWeight(5);
  }
  else
  {
   
    sweat_y = sweat_y + 0.5; //sweatdrop falls
  
    if (sweat_y > 280) //reset sweatdrop when it came down
        sweat_y = 180;

    stroke(140, 20, 30);
    fill(190, 180, 25);
    rect(175, 250, 50, 20, 10, 10, 5, 5); //mouth
  }
   fill(1);
  stroke(1, 1, 1);
    ellipse(150 + (mouseX-200) / 20, 150 + (mouseY - 200)/20, 10, 10); //left eyeball



  if (mousePressed == false) {  //default
    fill(180, 190, 124);
    ellipse(250, 150, 30, 30); //right eye
    fill(1);
    ellipse(250 + (mouseX-200) / 20, 150 + (mouseY - 200)/20, 10, 10); //right eyeball
  }
  else {  //when mouse is Pressed
    line(260, 160, 240, 140);
    line(240, 160, 260, 140);  // trace of eyeball


    fill(180, 190, 124);
    ellipse(mouseX, mouseY, 30, 30); //right eye
    fill(1);
    ellipse(mouseX, mouseY, 10, 10); //right eyeball
    
    
  }

  
}
