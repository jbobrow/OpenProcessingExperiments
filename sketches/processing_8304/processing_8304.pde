
int mode = 1;

int count = 1;
int lives = 5;
int score = 0;

float speed = 3.0;
float foodX = 120;
float foodY = 35.0;
float radius = 20;

float angle = 0.0;
float speed2 = 0.03;
float a_radius = 100.0;

float plateX = 400;
float plateY = 290;
float plate_r = 20;
float angle2 = 0.0;

float panX;
float panY = 250;
float panWidth = 76;
float panHeight = 15;

int direction = -1;

PFont font;
PFont font2;

int Timer = 0;
int i = 0;

boolean bounce = rectCircleIntersect(panX, panY, panWidth, panHeight, foodX, foodY, radius);

void setup() {
  size(480, 320);
  smooth();
  ellipseMode(RADIUS);

  font = loadFont("AppleGothic-12.vlw");
  font2 = loadFont("AppleGothic-36.vlw");
  textFont(font);


}

void draw() {
  background(252, 250, 210);
  fill(0);

  //Title Screen
  if(mode == 1){
    textFont(font2);
    text("CHEF!", (width/2)-65, 70);
    textFont(font);
    text("You are the new chef in a five star restaurant. Your goal is to fry your food to perfection and make as many tips as possible, but beware--if you burn the food you'll have to reimburse the restaurant for their ingredients and if word gets out to the customers of you dropping any food, your ratings will go down! Use the mouse to control your frying pan, and click to start cookin'! Fear not, if your restaurant closes down, you can always click to start again!", 35, 80, 400, 300);
    textFont(font2);
    text("READY?", (width/2)-80, 210);  
    textFont(font);
  }

  //Level 1: Apprentice Chef
  else if(mode == 2){
    if(count < 5){
      text("Cook it longer!", (width/2)-50, height/2);
    }
    else if(count > 8){
      text("Overcooked!", (width/2)-50, height/2);
    }
    else{
      text("Just right!", (width/2)-50, height/2);
    }

    if(lives > 0){
      text("Stars:" + lives, 425, 10, 200, 50);
    }
    text("Tips: $" + score, 420, 25, 100, 50);
    panX = map(mouseX, 0, 480, 10, 395);
    stroke(160, 123, 98);
    strokeWeight(5);
    strokeCap(SQUARE);
    line(panX-20, panY - 10, panX, panY+2);
    noStroke();
    fill(200);
    rect(panX, panY, panWidth, panHeight);
    stroke(200);
    strokeWeight(1);
    fill(255);
    ellipse(plateX, plateY, 60, plate_r);
    ellipse(plateX, plateY, 40, plate_r/2);
    noStroke();
    angle += speed2;
    fill(255);

    if(rectCircleIntersect(panX, panY, panWidth, panHeight, foodX, foodY, radius) == true){
      angle = 0.0;
      if(foodX == ((panWidth/2) + panX)){
        direction = 1;
        speed = 3;
      }
      else if((foodX > panX) && (foodX < (panX + (panWidth/2)))){
        direction = 2;
        speed = 1;
      }
      else if(foodX == panX){
        direction = 3;
        speed = 1;
      }
      else if((foodX < (panX + panWidth)) && (foodX > (panX + (panWidth/2)))){
        direction = 4;
        speed = 1;
      }
      else if (foodX == (panX + (panWidth))){
        direction = 5;
        speed = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          speed = 3;
        }
        else{
          speed = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(foodX, foodY, radius, plateX, plateY, plate_r) == true) {
      if(i == 0){
        if(count < 5){
          score++;
        }
        else if(count > 8){
          score--;
        }
        else{
          score = score + 5;
        }

        i = 1;
      }

      if(Timer < 75){
        foodY = plateY;
        foodX = plateX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        foodX = 120;
        foodY = radius;
        speed = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        foodY = foodY + speed;
      }
      else if(direction == 1){
        foodY = foodY - speed;
        if(foodY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        foodY = 220 + (((-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        foodY = 220 + ((sin(angle))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(foodY > height){
      lives--;
      if(lives == 0){
        background(252, 250, 210);
        fill(0);  
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Restaurant Closed.", 370, 10, 200, 50);
        text("Tips: $" + score, 420, 25, 100, 50);
        noLoop();
        foodX = -radius;
        foodY = -radius;
      }
      else{
        foodX = 120;
        foodY = radius;
        count = 1;
        direction = -1;
        speed = 3;
      }
    }

    food(foodX, foodY, count);

    if(score >= 20){
      mode = 3;
    }
  }

  //Level 2: You're on your own.
  
  else if(mode == 3){
    if(lives > 0){
      text("Stars:" + lives, 425, 10, 200, 50);
    }
    text("Tips: $" + score, 420, 25, 100, 50);
    panX = map(mouseX, 0, 480, 10, 395);
    stroke(160, 123, 98);
    strokeWeight(5);
    strokeCap(SQUARE);
    line(panX-20, panY - 10, panX, panY+2);
    noStroke();
    fill(200);
    rect(panX, panY, panWidth, panHeight);
    stroke(200);
    strokeWeight(1);
    fill(255);
    ellipse(plateX, plateY, 60, plate_r);
    ellipse(plateX, plateY, 40, plate_r/2);
    noStroke();
    angle += speed2;
    fill(255);

    if(rectCircleIntersect(panX, panY, panWidth, panHeight, foodX, foodY, radius) == true){
      angle = 0.0;
      if(foodX == ((panWidth/2) + panX)){
        direction = 1;
        speed = 3;
      }
      else if((foodX > panX) && (foodX < (panX + (panWidth/2)))){
        direction = 2;
        speed = 1;
      }
      else if(foodX == panX){
        direction = 3;
        speed = 1;
      }
      else if((foodX < (panX + panWidth)) && (foodX > (panX + (panWidth/2)))){
        direction = 4;
        speed = 1;
      }
      else if (foodX == (panX + (panWidth))){
        direction = 5;
        speed = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          speed = 3;
        }
        else{
          speed = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(foodX, foodY, radius, plateX, plateY, plate_r) == true) {
      if(i == 0){
        if(count < 5){
          score++;
        }
        else if(count > 8){
          score--;
        }
        else{
          score = score + 5;
        }

        i = 1;
      }

      if(Timer < 75){
        foodY = plateY;
        foodX = plateX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        foodX = 120;
        foodY = radius;
        speed = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        foodY = foodY + speed;
      }
      else if(direction == 1){
        foodY = foodY - speed;
        if(foodY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        foodY = 220 + (((-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        foodY = 220 + ((sin(angle))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(foodY > height){
      lives--;
      if(lives == 0){
        background(252, 250, 210);
        fill(0);  
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Restaurant Closed.", 370, 10, 200, 50);
        text("Tips: $" + score, 420, 25, 100, 50);
        noLoop();
        foodX = -radius;
        foodY = -radius;
      }
      else{
        foodX = 120;
        foodY = radius;
        count = 1;
        direction = -1;
        speed = 3;
      }
    }

    food(foodX, foodY, count);

    if(score >= 50){
      mode = 4;
    }
  }
  //Level 3: Moving target!
  else{
    if(lives > 0){
      text("Stars:" + lives, 425, 10, 200, 50);
    }
    text("Tips: $" + score, 420, 25, 100, 50);
    panX = map(mouseX, 0, 480, 10, 395);
    stroke(160, 123, 98);
    strokeWeight(5);
    strokeCap(SQUARE);
    line(panX-20, panY - 10, panX, panY+2);
    noStroke();
    fill(200);
    rect(panX, panY, panWidth, panHeight);
    stroke(200);
    strokeWeight(1);
    fill(255);
    angle2 += speed2;
    plateX = (width/2) + (1.8*cos(angle2)*a_radius);
    ellipse(plateX, plateY, 60, plate_r);
    ellipse(plateX, plateY, 40, plate_r/2);
    noStroke();
    angle += speed2;
    fill(255);

    if(rectCircleIntersect(panX, panY, panWidth, panHeight, foodX, foodY, radius) == true){
      angle = 0.0;
      if(foodX == ((panWidth/2) + panX)){
        direction = 1;
        speed = 3;
      }
      else if((foodX > panX) && (foodX < (panX + (panWidth/2)))){
        direction = 2;
        speed = 1;
      }
      else if(foodX == panX){
        direction = 3;
        speed = 1;
      }
      else if((foodX < (panX + panWidth)) && (foodX > (panX + (panWidth/2)))){
        direction = 4;
        speed = 1;
      }
      else if (foodX == (panX + (panWidth))){
        direction = 5;
        speed = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          speed = 3;
        }
        else{
          speed = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(foodX, foodY, radius, plateX, plateY, plate_r) == true) {
      if(i == 0){
        if(count < 5){
          score++;
        }
        else if(count > 8){
          score--;
        }
        else{
          score = score + 5;
        }

        i = 1;
      }

      if(Timer < 75){
        foodY = plateY;
        foodX = plateX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        foodX = 120;
        foodY = radius;
        speed = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        foodY = foodY + speed;
      }
      else if(direction == 1){
        foodY = foodY - speed;
        if(foodY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        foodY = 220 + (((-sin(angle)))*a_radius);
        foodX = foodX - speed;
        if(foodX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        foodY = 220 + ((2*(-sin(angle)))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        foodY = 220 + ((sin(angle))*a_radius);
        foodX = foodX + speed;
        if(foodX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(foodY > height){
      lives--;
      if(lives == 0){
        background(252, 250, 210);
        fill(0);  
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Restaurant Closed.", 370, 10, 200, 50);
        text("Tips: $" + score, 420, 25, 100, 50);
        noLoop();
        foodX = -radius;
        foodY = -radius;
      }
      else{
        foodX = 120;
        foodY = radius;
        count = 1;
        direction = -1;
        speed = 3;
      }
    }

    food(foodX, foodY, count);
  }
}

void mouseClicked(){
  count = 1;
  lives = 5;
  score = 0;
  direction = -1;
  loop();
  foodX = 140;
  foodY = radius;
  speed = 3;
  mode = 2;
}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) { 

  float circleDistanceX = abs(cx - rx - rw/2); 
  float circleDistanceY = abs(cy - ry - rh/2); 

  if (circleDistanceX > (rw/2 + cr)) { 
    return false; 
  } 
  if (circleDistanceY > (rh/2 + cr)) { 
    return false; 
  } 
  if (circleDistanceX <= rw/2) { 
    return true; 
  }  
  if (circleDistanceY <= rh/2) { 
    return true; 
  } 

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
  return cornerDistance <= pow(cr, 2); 
} 

boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) { 
  if (dist(cx1, cy1, cx2, cy2) < cr1 + (cr2+20)) { 
    return true; 
  } 
  else { 
    return false; 
  } 
} 


void food(float fx, float fy, int counter){
  noStroke();
  if (counter == 1){
    fill(56, 151, 143);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 2){
    fill(128, 162, 142);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 3){
    fill(149, 168, 142);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 4){
    fill(186, 178, 141);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter >=5 && counter <= 8){
    fill(216, 187, 140);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 9){
    fill(163, 150, 110);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 10){
    fill(160, 123, 98);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter == 11){
    fill(138, 86, 77);
    ellipse(fx, fy, radius, radius);
  }
  else if (counter >= 12){
    fill(122, 56, 60);
    ellipse(fx, fy, radius, radius);
  }
}















