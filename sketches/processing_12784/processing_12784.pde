
float r1 = random(255);//random color variables for enemies
float r2 = random(255);
float r3 = random(255);
float b1 = random(255);
float b2 = random(255);
float b3 = random(255);
float g1 = random(255);
float g2 = random(255);
float g3 = random(255);
float enemy1x = random(200,500);//random x starting location for enemy 1
float enemy1y = random(0,500);//random y starting location for enemy 1
float enemy2x = random(200,500);//random x starting location for enemy 2
float enemy2y = random(0,500);//random y starting location for enemy 2
float enemy3x = random(200,500);//random x starting location for enemy 3
float enemy3y = random(0,500);//random y starting location for enemy 3

//creating enemy class
class Enemy {
  color c;
  float xpos;
  float ypos;
  float speed;
 
//creating enemy constructor  
  Enemy(color tempC, float tempXpos, float tempYpos) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
  }

//returning X location for collisions
  float xLocation(){
    return xpos;
  }
  
//returning Y location for collisions
  float yLocation(){
    return ypos;
  }
  
//function that draws an enemy
  void displayEnemy() {
    noStroke();
    fill(c);
    rect(xpos,ypos,50,20);
    rect(xpos+15,ypos+10,20,50);
    rect(xpos,ypos+50,50,10);
    rect(xpos,ypos+50,15,30);
    rect(xpos+35,ypos+50,15,30);
    fill(0,0,0);
    ellipse(xpos+5,ypos+10,3,3);
    ellipse(xpos+45,ypos+10,3,3);
    noFill();
    stroke(0,0,0);
    ellipse(xpos+25,ypos+15,10,20);
  }

//function that randomly moves enemy and keeps it on the screen
  void moveEnemy() {
    xpos = xpos + random(-30,30);
    ypos = ypos + random(-30,30);
    xpos = constrain(xpos,0,width-50);
    ypos = constrain(ypos,0,height-70);
  }
}

