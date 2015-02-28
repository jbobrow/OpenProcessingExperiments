
float positionX, positionY, increment_X, increment_Y;
ArrayList<Integer> block_enabled_ids = new ArrayList();
ArrayList<Integer> random_list = new ArrayList();
boolean gameOver;
boolean standBy;
boolean pause;
int block_id_temp;
int blocksize;
int ballsize;
int slidewidth;
int ball_pos_id;
long score;
long level;
int speedMode = 1;
int theta;
int life_count;
int bounce_angle;
int bounce_count;

void setup() {
    size(800,610);
    positionX = mouseX;
    positionY = 550;
    increment_X = 5;
    increment_Y = -5;
    blocksize = 20;
    slidewidth = 200;
    ballsize = 15;
    rectMode(CENTER);
    gameOver = false;
    standBy = true;
    pause = false;
    score = 0;
    level = 1;
    life_count = 3;
    for (int i = 80; i <= 799 ; i ++){
      random_list.add(i);
    }
    block_enabled_ids.clear();
    theta = 0;
    bounce_count = 0;
    textSize(11);
    New_Level();
    
}

void draw() {
  if (gameOver){
    background(0, 0, 0);
    textSize(100);
    fill(0, 102, 153);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2 - 200);
    rect(width/2, height/2+100, 120, 40);
    fill(255, 255, 255);
    textSize(20);
    text("Score:" + score, width/2, height/2 - 100);
    text("Level:" + level, width/2, height/2 - 60);
    textSize(12);
    text("Restart", width/2, height/2+100);
    textSize(11);
    if (mouseX >= width/2-60 && mouseX <= width/2+60 && mouseY >= height/2+100-20 && mouseY <= height/2+100+20) {
        cursor(HAND);
        if (mousePressed) {
            setup(); 
        }
    }
    else {
        cursor(CROSS);
    }
  } 
  
  
  else {
    
    background(0, 0, 0);
    ellipse(positionX, positionY, ballsize, ballsize);


    for(int i = 0; i < block_enabled_ids.size(); i++){
      block_id_temp = (int) block_enabled_ids.get(i);
      rect( (float) Math.floor(block_id_temp % 40) * blocksize + blocksize/2, (float) Math.floor(block_id_temp / 40) * blocksize + blocksize/2, blocksize, blocksize);
    }
    
    if (block_enabled_ids.size() == 0){
      level += 1;
      score += level;
      if (level % 3 == 0){
        life_count += 1;
      }
      if (increment_X <= 12 && increment_X >= -12){
        increment_X = (increment_X < 0) ? increment_X - 0.25 : increment_X + 0.25;
        increment_Y = (increment_Y < 0) ? increment_Y - 0.25 : increment_Y + 0.25;
      }
      New_Level();
    }
    
    rect(mouseX, 570, slidewidth, 15);

    ball_pos_id = (int) ( Math.floor((positionX) / 20) + Math.floor((positionY) / 20) * 40);
    if (block_enabled_ids.contains(ball_pos_id)){
      block_enabled_ids.remove(block_enabled_ids.indexOf(ball_pos_id));
      score += ((int) ((10 + level) * Math.pow(slidewidth / 200.0, -2))); 
      bounce_count = 0;
      if (increment_X * increment_Y > 0){
        bounce_angle = (int) degrees(atan( (float) ((positionY - Math.floor(ball_pos_id / 40) * blocksize) / (positionX - Math.floor(ball_pos_id % 40) * blocksize)))); 
        if (increment_X > 0){
          if (bounce_angle >= 45){
            increment_X *= -1;
          } else {
            increment_Y *= -1;
          }
        } else {
          if (bounce_angle >= 45){
            increment_Y *= -1;
          } else {
            increment_X *= -1;
          }
        }
      } else {
        bounce_angle = (int) degrees(atan( (float) ((Math.floor(ball_pos_id / 40) * blocksize + blocksize - positionY ) / (positionX - Math.floor(ball_pos_id % 40) * blocksize)))); 
        if (increment_X > 0){
          if (bounce_angle >= 45){
            increment_X *= -1;
          } else {
            increment_Y *= -1;
          }
        } else {
          if (bounce_angle >= 45){
            increment_Y *= -1;
          } else {
            increment_X *= -1;
          }
        }
      }
    }
    
    text("Level "+ level, 10, 20);
    text("Score: "+ score, 10, 30);
    for (int i = 0; i < life_count; i ++){
      ellipse(10 + i * 12, 60, 10, 10);
    }
    
    //text("bounce_angle: "+ bounce_angle, 10, 40);
    //text("increment_X: "+ increment_X, 10, 50);
    //text("increment_Y: "+ increment_Y, 10, 60);
    
   // positionX = mouseX;
    //positionY = mouseY;
    if (bounce_count > 30) {
      text("You can press 's' to clear one of the blocks without deducting the score now.", 100, 110); 
    }
    
    if (standBy){

      text("Please click to start / resume.", 100, 20);
      text("Press 'UP' / 'DOWN' to increase / decrease the speed of the ball.", 100, 30);
      text("Press '+' / '-' to lengthen / shorten the slide bar (score gained will be affected by the length of the slide bar).", 100, 40);
      text("Press 'SPACE' to change the motion of the ball.", 100, 50);
      text("Press 's' to clear one of the blocks (score will be deducted).", 100, 60);
      text("Press 'p' to pause the game.", 100, 70);
      text("|", 10, 70);
      text("|", 10, 85);
      text("Number of balls remaining", 10, 100);
      
      if (pause){
      } else {
        positionX = mouseX;
        positionY = 550;
        
      }
      if (mousePressed) {
        standBy = false;
        pause = false;
      }
      
    } else {
      if (speedMode == 1){
        positionX += increment_X;
        positionY += increment_Y;
      } else {
        positionX += increment_X + increment_X*2*cos(degrees(theta));
        positionY += increment_Y + increment_Y*2*sin(degrees(theta));
      }
  
      if (positionX < 10 || positionX > width - 10) {
          increment_X *= -1;
          positionX = (positionX < 10) ? 10 : width - 10;
          bounce_count += 1;
      }
      if (positionY < 10){
          increment_Y *= -1;
          positionY = 10;
          bounce_count += 1;
      }
      if ( ball_pos_id >= 1120 && ball_pos_id < 1160){
        if (positionX >= mouseX - slidewidth / 2 && positionX <= mouseX + slidewidth / 2){
           increment_Y *= -1;
           positionY = 555;
           bounce_count += 1;
        }
      }
      if (positionY > height - 10) {
        life_count -= 1;
        if (life_count == 0){
          gameOver = true;
        } else {
          standBy = true;
        }
      }
      theta ++;  
    }
    

  }
}

void New_Level(){
  textAlign(LEFT, CENTER);
  ArrayList<Integer> random_list_copy = new ArrayList();
  random_list_copy.addAll(random_list);
  long random_count = level + 2;
  if (random_count > random_list_copy.size()){
    random_count = random_list_copy.size();
  }
  int index_random;
  for (int i = 0; i < random_count; i ++){
    index_random = (int) Math.floor(random_list_copy.size() * random(0, 1));
    block_enabled_ids.add(random_list_copy.get(index_random));
    random_list_copy.remove(index_random);
  }
}

void keyPressed() {
  if (keyCode == UP){
    increment_X = (increment_X < 0) ? increment_X - 0.25 : increment_X + 0.25;
    increment_Y = (increment_Y < 0) ? increment_Y - 0.25 : increment_Y + 0.25;
  }
  else if (keyCode == DOWN) {
    increment_X = (increment_X < 0) ? increment_X + 0.25 : increment_X - 0.25;
    increment_Y = (increment_Y < 0) ? increment_Y + 0.25 : increment_Y - 0.25;
  } 
  else if (("" + key).equals("+")) {
    slidewidth = (slidewidth > 500) ? slidewidth : slidewidth + 5;
  } 
  else if (("" + key).equals("-")) {
    slidewidth = (slidewidth < 50) ? slidewidth : slidewidth - 5;
  } else if (("" + key).equals("s")) {
    if (block_enabled_ids.size() > 0){
      block_enabled_ids.remove(block_enabled_ids.get(0));
      if (bounce_count <= 30) {
       score -= (10 + level) * 3;
      }
      bounce_count = 0;
    }
  }
  else if (("" + key).equals("p")) {
    standBy = true;
    pause = true;
  }

  if (("" + key).equals(" ")){
    speedMode *= -1;
  }
}
 
