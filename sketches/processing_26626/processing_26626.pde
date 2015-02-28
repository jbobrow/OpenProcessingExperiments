
class Piggy {
  float posX;
  float posY;
  int state;
  boolean animate;
  int reach;
  int stretch;
 
  Piggy(float x, float y) {
    posX = x;
    posY = y;
    state = 0;
    animate = false;
    reach = 0;
    stretch = 0;
  }
 
  void run() {
    wait--;
    if (wait == 0) {
      wait = 10;
      animate = !animate;
    }

    action();
    render();
  }
 
  void action() {
    if (mouseX + mouseY > 0) {
      switch (state) {
        case 0: { // Bouncing on the spot
          switch (reach) {
            case 0: { // Nothing
              if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Donut is caught
              else if (mouseX < posX - 15) state = 1;
              else if (mouseX > posX + 15) state = 2;
              else if (round(random(100)) == 5) { stretch = 0; reach = 1; }
              break;
            }
            case 1: { 
              // Reaching up to grab donut!
              if (dist(mouseX + 5, mouseY + 10, posX, stretch + posY - 10) < 20) reach = 3;
              else if ((abs(stretch) + 30) > height - mouseY - 10) reach = 2;
              else stretch--;
              break;
            }
            case 2: { // Just missed!
              if (dist(mouseX + 5, mouseY + 10, posX, stretch + posY - 10) < 20) reach = 3;
              else if (stretch < 0) stretch++;
              else { reach = 0; stretch = 0; }
              break;
            }
            case 3: { // Oh no.. he got it! 
              if (stretch < 0) stretch++;
              else { reach = 0; stretch = 0; state = 3; }
              break;
            }
          }
          break;
        }
        case 1: { // Chase left
          posX += (mouseX - posX)*0.02;
          if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Donut is caught
          else if (mouseX <= posX + 15 && mouseX >= posX - 15) state = 0;
          else if (mouseX > posX + 15) state = 2;
          break;
        }
        case 2: { // Chase right
          posX += (mouseX - posX)*0.02;
          if (dist(mouseX + 5, mouseY + 10, posX, posY) < 40) state = 3; // Donut is caught!
          else if (mouseX <= posX + 15 && mouseX >= posX - 15) state = 0;
          else if (mouseX < posX - 15) state = 1;
          break;
        }
        case 3: { // Hide donut cursor

          if (posX > width + 50) { state = 0; celebrate = 10; score++;}
          else posX += 2; {
          fill(255);
          textFont(f,24);
          text("Oh no.. he got " +score,210,40);
          break;
        }
      }
    }
  }
  }
  void render() {
    fill(245,200,221);
    stroke(0); 
    strokeWeight(2);
 
    switch (state) {
      case 1: {
        //Body
        pushMatrix();
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(piggyTailLeft,-18,-40);
        // Sweatdrops
        if (!animate) {
          pushMatrix();
          translate(15, -10);
          rotate(-HALF_PI*0.5);
          scale(0.5, 0.5);
          image(sweatDrop, 0, 0);
          popMatrix();
        }
        // Hands
        if (animate) {
          pushMatrix();     
          translate(-4, -10);
          image(piggyHead,-45,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(-6, -8);
          image(piggyHead,-47,-33);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(-3, 19);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(-1, 19);
          arc(-6, 0, 14, 14, PI, TWO_PI);
          line(-12, 0, 0, 0);
          arc(4, 0, 14, 14, PI, TWO_PI);
          line(10, 0, -2, 0);
          popMatrix();
        }
        popMatrix();
        image(mouseDonut, mouseX, mouseY);
        break;
      }
      case 2: {
        //Body
        pushMatrix();
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(piggyTailRight,-55,-40);
        // Sweatdrops
        if (!animate) {
          pushMatrix();
          translate(-20, -15);
          rotate(HALF_PI*0.5);
          scale(0.5, 0.5);
          image(sweatDrop, 0, 0);
          popMatrix();
        }
        // Hands
        if (animate) {
          pushMatrix();     
          translate(4, -10);
          image(piggyHead,-15,-35);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, -8);
          image(piggyHead,-13,-33);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(3, 19);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(1, 19);
          arc(6, 0, 14, 14, PI, TWO_PI);
          line(12, 0, 0, 0);
          arc(-4, 0, 14, 14, PI, TWO_PI);
          line(-10, 0, 2, 0);
          popMatrix();
        }
        popMatrix();
        image(mouseDonut, mouseX, mouseY);
        break;
      }
      case 3: {
        //Piggy has obtained the donut!
        
        
        if (celebrate > 0) {
          celebrate--;
          
          // Heart
          pushMatrix();
          translate(posX + 5, posY - 45);
          scale(0.3, 0.3);
          image(heart, 0, 0);
          popMatrix();
        }
        //Body
        pushMatrix();
        translate(posX, posY);
        ellipse(0, 0, 30, 30);
        //Tail
        image(piggyTailRight,-55,-40);
        // Hands
        if (animate) {
          pushMatrix();     
          translate(4, 0);
          image(mouseDonut, 18, -15);
          image(piggyHappyFace,-15,-40);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(6, 0);
          image(mouseDonut, 18, -15);
          image(piggyHappyFaceTwo,-13,-37);
          popMatrix();
        }
        // Feet
        if (animate) {
          pushMatrix();     
          translate(3, 19);
          arc(3, 0, 14, 14, PI, TWO_PI);
          line(9, 0, -3, 0);
          arc(-3, 0, 14, 14, PI, TWO_PI);
          line(-9, 0, 3, 0);
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(1, 19);
          arc(6, 0, 14, 14, PI, TWO_PI);
          line(12, 0, 0, 0);
          arc(-4, 0, 14, 14, PI, TWO_PI);
          line(-10, 0, 2, 0);
          popMatrix();
        }
        popMatrix();
        break;
      }
      default: {
        //Alerting the user that piggy is about to GRAB the donut!
       /*if (animate) {
          fill(255);
          textFont(f,14);
          text("Don't let piggy grab the donut!",200,40);
        }
       */
        
        pushMatrix();
        fill(245,200,221);
        if (reach > 0) {
          translate(posX, posY);
          if (reach == 3) {
            image(mouseDonut, -20, stretch -45);
            
          }
          // Arms
          strokeWeight(2);
          pushMatrix();
          translate(0, -15);
          rect(7, 10, 5, stretch - 10);
          rect(-12, 10, 5, stretch - 10);
          for (int i = 0; i > stretch; i--) {
            if (i%10 == 0) {
              strokeWeight(0);
              //line(7, i, 12, i);
              //line(-12, i, -7, i);
            }           
          }
          popMatrix();
          strokeWeight(2);
          ellipse(0, 0, 30, 30);
          
        }
        else {
          if (animate) {
            translate(posX, posY);
            ellipse(0, 0, 30, 30);
          }
          else {
            translate(posX, posY - 3);
            ellipse(0, 0, 30, 30);
          }
        }
       
        // Hands
        if (reach > 0) {
          pushMatrix();
          translate(0, -15);
          ellipse(10, stretch, 15, 15);
          ellipse(-10, stretch, 15, 15);
          image(piggyX,-38,-43); //Piggy making a >< face!
          popMatrix();
        }
        else {
          pushMatrix();     
          translate(0, -15);  
          ellipse(14, stretch, 15, 15);
          ellipse(-14, stretch, 15, 15);
          image(piggyLookUp,-38,-40); //Piggy looking up!
          popMatrix();
        }
        // Feet
        pushMatrix();     
        translate(0, 19);
        arc(10, 0, 14, 14, PI, TWO_PI);
        line(16, 0, 4, 0);
        arc(-10, 0, 14, 14, PI, TWO_PI);
        line(-16, 0, -4, 0);
        popMatrix();
        popMatrix();
        if (reach < 3) image(mouseDonut, mouseX, mouseY);
        break;
      }
    }
  }
}


//Can't get the score working...
/*for(int celebrate = 30; celebrate < 0; celebrate = celebrate + 1)
    if (celebrate > 0) {
  score++;
  textFont(f,14);
        text("Oh no.. he got " +score,200,40);
    } else {
      celebrate = 0;
    } */


