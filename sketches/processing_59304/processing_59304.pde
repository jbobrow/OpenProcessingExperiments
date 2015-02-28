
class Ball { // Ball class
   
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float wdth;
  float hght;
  
  Ball(color tempC, float tempXpos, float tempYpos, float tempWdth, float tempHght) {
    
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    wdth = tempWdth;
    hght = tempHght;
    
  }
  
  void display(){ // displays the ball
  
    fill(c);
    stroke(0);
    strokeWeight(3);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, wdth, hght);
    
  }
  
  void move(){ // the motion of the ball
    
    xpos += xspeed;
    ypos += yspeed;
    
    if(xpos - wdth/2 < 20 || xpos + wdth/2 > width - 20){
      xspeed *= -1;
    smack.loop(0);
    }
    if(ypos - wdth/2 < 85){
      yspeed *= -1;
    smack.loop(0);
    }
    if(ypos + wdth/2 > height - 20){
      numberofhearts -= 1;
      loselife.loop(0);
      theBall.xpos = width/2;
      theBall.ypos = height - 280;
      theBall.xspeed = 0;
      theBall.yspeed = 0;
    }
    
  }
    
}

//void multiball(){
//  
// for(int i = balls.size()-1; i >= 0; i--){
//    Ball extraballs = (Ball) balls.get(i);
//    extraballs.display();
//    extraballs.move();
// }
//  
//    balls.add(new Ball(50, theBall.xpos, theBall.ypos, 10, 10));
//    
//}

