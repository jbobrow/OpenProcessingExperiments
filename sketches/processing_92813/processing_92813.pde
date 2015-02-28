
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  //erase when every time draw is called
  background(255);

  //draw line that divides into 4 areas
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  //text to tell(distinguish) four areas
  fill(0, 0, 255, 128);
  textSize(30);
  text("1", 10, 40);
  text("2", 470, 40);
  text("3", 470, 480);
  text("4", 10, 480);
  
  //show mouseX and mouseY values in bars
  rect(30, 40, 10, -(mouseX/15));
  rect(50, 40, 10, -(mouseY/15));

  //using 'if', specify the different actions
  //while the mouse goes around the four areas

  //actions when mouse is in section 1
  if (mouseX<=250 && mouseY<=250) {

    //the face
    strokeWeight(2);
    fill(250, 245, 41, 255);
    ellipse(width/2, height/2, 250, 250);
    strokeWeight(1);

    //the mouth
    fill(0, 0, 0, 255);
    arc(width/2, 230, 250, 250, PI/5, PI/1.5, CHORD);

    //the eyes
    ellipse(200, 200, 50, 50);
    ellipse(300, 200, 50, 50);
  }

  //actions when mouse is in section 2
  else if (mouseX>=250 && mouseY<=250) {

    //the face
    strokeWeight(2);
    fill(5+(mouseX/2), mouseX, 5+(mouseY/2), 255);
    ellipse(width/2, height/2, 250, 250);
    strokeWeight(1);

    //the mouth
    fill(0, 0, 0, 255);
    arc(width/2, 230, 250, 250, PI/5, PI/1.3, CHORD);

    //the teeth
    // teeth_rotate value is the rotation amount of teeth to match with mouth
    float teeth_rotate;
    teeth_rotate = PI/55;

    strokeWeight(0);
    fill(255, 0, 0, 255);

    translate(250, 250);
    rotate(-teeth_rotate);
    translate(-250, -250);

    rect(310, 308, 15, 25);
    rect(280, 308, 15, 25);
    rect(250, 308, 15, 25);
    rect(220, 308, 15, 25);
    rect(190, 308, 15, 25);

    translate(250, 250);
    rotate(teeth_rotate);
    translate(-250, -250);

    strokeWeight(1);

    //the eyes
    fill(0, 0, 0, 255);
    ellipse(200, 200, 50, 50);
    ellipse(300, 200, 50, 50);

    //the eyebrows
    noFill();
    strokeWeight(3);
    arc(200, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    arc(300, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    strokeWeight(1);

    //the hand
    fill(250, 206, 40, 255);
    ellipse(380, 500, 100, 100);

    //finger 1
    translate(370, 480);
    rotate(PI+PI/3);
    rect(0, 10, 100, -20, 10);
    rotate(-(PI+PI/3));
    translate(-370, -480);

    //finger 2
    translate(390, 480);
    rotate(PI+(PI/2));
    rect(0, 0, 100, -20, 10);
    rotate(-(PI+(PI/2)));
    translate(-390, 480);
  }
  
  //actions when mouse is in section 3
  else if (mouseX>=250 && mouseY>=250) 
  {

    //rotate character by the value of mouseX
    translate(250, 250);
    rotate(radians(mouseX));
    translate(-250, -250);

    //the face
    strokeWeight(2);
    fill(5+(mouseX/2), 241, 50+mouseY, 255);
    ellipse(width/2, height/2, 250, 250);
    strokeWeight(1);

    //the mouth
    fill(0, 0, 0, 255);
    arc(width/2, 230, 250, 250, PI/5, PI/1.3, CHORD);

    //the teeth
    //teeth_rotate value is the rotation amount of teeth to match with mouth
    float teeth_rotate;
    teeth_rotate = PI/55;

    strokeWeight(0);
    fill(255, 0, 0, 255);

    translate(250, 250);
    rotate(-teeth_rotate);
    translate(-250, -250);

    //draw teeth
    rect(310, 308, 15, 25);
    rect(280, 308, 15, 25);
    rect(250, 308, 15, 25);
    rect(220, 308, 15, 25);
    rect(190, 308, 15, 25);

    translate(250, 250);
    rotate(teeth_rotate);
    translate(-250, -250);

    strokeWeight(1);

    //the eyes
    fill(0, 0, 0, 255);
    ellipse(200, 200, 50, 50);
    ellipse(300, 200, 50, 50);
    
    //the eyeballs
    fill(255, mouseX/2, mouseY/2, mouseY/2);
    ellipse(200, 200, 30, 20);
    ellipse(300, 200, 30, 20);

    //the eyebrows
    noFill();
    strokeWeight(3);
    arc(200, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    arc(300, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    strokeWeight(1);

    //the hand
    fill(250, 206, 40, 255);
    ellipse(380, 500, 100, 100);

    //finger 1
    translate(370, 480);
    rotate(PI+PI/3);
    rect(0, 10, 100, -20, 10);
    rotate(-(PI+PI/3));
    translate(-370, -480);

    //finger 2
    translate(390, 480);
    rotate(PI+(PI/2));
    rect(0, 0, 100, -20, 10);
    rotate(-(PI+(PI/2)));
    translate(-390, 480);

    //put rotation value to original state
    translate(250, 250);
    rotate(-radians(mouseX));
    translate(-250, -250);
  }
  
  //actions when mouse is in section 4
  else {
    
    //type ahhhhh
    fill(255, 0, 0, 200);
    text("ahhhhh^&&$$*(#()%$)@$)(@~~~~", 10, 480);
    
    // rotate character
    translate(250, 250);
    rotate(radians(-20));
    translate(-250, -250);

    //move character so it fits in screen
    translate(-80, -80);
    
    //the face
    strokeWeight(5);
    fill(mouseY, mouseX, 50, 255);
    scale(1.2);
    ellipse(width/2, height/2, 250, 250);
    strokeWeight(1);

    //the mouth
    fill(0, 0, 0, 255);
    arc(width/2, 230, 250, 250, PI/5, PI/1.3, CHORD);

    //the teeth
    // teeth_rotate value is the rotation amount of teeth to match with mouth
    float teeth_rotate;
    teeth_rotate = PI/55;

    strokeWeight(0);
    fill(255, 0, 0, 255);

    translate(250, 250);
    rotate(-teeth_rotate);
    translate(-250, -250);

    rect(310, 308, 15, 25+(mouseX/5));
    rect(280, 308, 15, 25+(mouseY/8));
    rect(250, 308, 15, 25+(mouseX/5));
    rect(220, 308, 15, 25+(mouseY/7));
    rect(190, 308, 15, 25+(mouseX/4));

    translate(250, 250);
    rotate(teeth_rotate);
    translate(-250, -250);

    strokeWeight(1);

    //the eyes
    fill(mouseX, mouseY, 0, 255);
    ellipse(200, 200, 25+(mouseX/3), 10+(mouseY/5));
    ellipse(300, 200, 25+(mouseX/3), 10+(mouseY/5));

    //the eyebrows
    noFill();
    strokeWeight(1+(mouseY/30));
    arc(200, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    arc(300, 180, 70, 50, PI+PI/6, (PI*2)-(PI/6));
    strokeWeight(1);

    //the hand
    fill(250, 206, 40, 255);
    ellipse(380, 500, 100, 100);

    //finger 1
    translate(370, 480);
    rotate(PI+PI/3);
    rect(0, 10, 50+(mouseX/5), -20, 10);
    rotate(-(PI+PI/3));
    translate(-370, -480);

    //finger 2
    translate(390, 480);
    rotate(PI+(PI/2));
    rect(0, 0, 100-(mouseX/5), -20, 10);
    rotate(-(PI+(PI/2)));
    translate(-390, 480);
    
    //move values to original state
    translate(80, 80);

    translate(250, 250);
    rotate(-radians(20));
    translate(-250, -250);
    

  }

}
