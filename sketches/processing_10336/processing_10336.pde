
int scene = 1;

int count = 1;
int lives = 5;
int score = 0;

float spd = 5.0;
float pikaX = 120;
float pikaY = 70.0;
float radius = 20;

float angle = 0.0;
float spd1 = 0.05;
float rad1 = 80.0;

float pballX = 350;
float pballY = 50;
float pballr = 20;
float angle2 = 0.0;

float ashX;
float ashY = 300;
float ashWidth = 50;
float ashHeight = 15;

int direction = -1;

PFont font;
PFont font1;

PImage pokeball;
PImage pokebackground;

int Timer = 0;
int gaugeLevelr = 0;
int i = 0;
int a = 255;

boolean bounce = rectCircleIntersect(ashX, ashY, ashWidth, ashHeight, pikaX, pikaY, radius);

void setup() {
  size(480, 320);
  smooth();
 pokeball = loadImage("pokeball.png");
 pokebackground = loadImage("pokebackground.png");
  font = loadFont("BladeRunnerMovieFont-36.vlw");
  font1 = loadFont("ArialRoundedMTBold-14.vlw");
  textFont(font);


}

void draw() {
  image(pokebackground, 0, 0);
  fill(0);

  // CLICK TO START
  if(scene == 1){
    textFont(font);
    text("Gotta Catch'Em All!", (width/2)-220, 50);
    textFont(font1);
    text("You are beginning your journey as a Pokemon master so you've got to catch'em all. You start with your first pokemon who must battle the other wild pokemon out there in order to add to your growing collection. But don't let the other pokemon escape or wear your pokemon out as that affects your pokemon's level. So try to catch the pokemon by moving him to the pokeball.", 35, 60, 400, 275);
    text("CLICK TO START", 35, 205, 400, 300);
    text("As a trainer use your mouse to control your pokemon's actions", (width/2)-195, 275); 
   
  }

  // L I
  else if(scene == 2){
    if (gaugeLevelr < 50){
      println(gaugeLevelr);
      fill(0, a);
      text("L I", 10, 20);
      gaugeLevelr++;

    }
    fill(0, 255);
    if(count < 5){
      text("Not down yet!", (width/2)-80, 40);
    }
    else if(count > 8){
      text("Catch 'Em!", (width/2)-90, height/2);
    }

    if(lives > 0){
      text("Lives: " + lives, 425, 10, 200, 50);
    }
    text("Pokemon Level: " + score, 355, 25, 200, 50);
    ashX = map(mouseX, 0, 480, 10, 395);
    noStroke();
    fill(0);
    rect(ashX, ashY, ashWidth, ashHeight);
    fill(255, 0, 0);
    image(pokeball, pballX, pballY);
    angle += spd1;
    fill(255);

    if(rectCircleIntersect(ashX, ashY, ashWidth, ashHeight, pikaX, pikaY, radius) == true){
      angle = 0.0;
      if(pikaX == ((ashWidth/2) + ashX)){
        direction = 1;
        spd = 3;
      }
      else if((pikaX > ashX) && (pikaX < (ashX + (ashWidth/2)))){
        direction = 2;
        spd = 1;
      }
      else if(pikaX == ashX){
        direction = 3;
        spd = 1;
      }
      else if((pikaX < (ashX + ashWidth)) && (pikaX > (ashX + (ashWidth/2)))){
        direction = 4;
        spd = 1;
      }
      else if (pikaX == (ashX + (ashWidth))){
        direction = 5;
        spd = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          spd = 3;
        }
        else{
          spd = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(pikaX, pikaY, radius, pballX, pballY, pballr) == true) {
      if(i == 0){
        if(count < 5){
          score++;
        }
        else if(count > 8){
          score--;
        }
        else{
          score = score + 3;
        }

        i = 1;
      }

      if(Timer < 75){
        pikaY = pballY;
        pikaX = pballX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        pikaX = 120;
        pikaY = radius;
        spd = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        pikaY = pikaY + spd;
      }
      else if(direction == 1){
        pikaY = pikaY - spd;
        if(pikaY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        pikaY = 220 + (((-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        pikaY = 220 + ((sin(angle))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(pikaY > height){
      lives--;
      if(lives == 0){
        background(255, 0, 0);
        fill(0); 
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Your pokemon has LOST!", 300, 10, 200, 50);
        text("Pokemon Level: " + score, 300, 25, 200, 50);
        noLoop();
        pikaX = -radius;
        pikaY = -radius;
      }
      else{
        pikaX = 120;
        pikaY = radius;
        count = 1;
        direction = -1;
        spd = 3;
      }
    }

    pika(pikaX, pikaY, count);

    if(score >= 20){
      scene = 3;
      gaugeLevelr = 0;
      a = 255;
    }
  }

  //L II
  else if(scene == 3){
    if (gaugeLevelr < 50){
      println(gaugeLevelr);
      fill(0, a);
      text("LVL II", 10, 20);
      gaugeLevelr++;

    }
    fill(0, 255);
    if(lives > 0){
      text("Lives: " + lives, 425, 10, 200, 50);
    }
    text("Pokemon Level: " + score, 355, 25, 200, 50);
    ashX = map(mouseX, 0, 480, 10, 395);
    stroke(150);
    strokeWeight(5);
    strokeCap(SQUARE);
    noStroke();
    fill(0);
    rect(ashX, ashY, ashWidth, ashHeight);
    stroke(150);
    strokeWeight(1);
    fill(255, 0, 0);
    image(pokeball, pballX, pballY);
  
    noStroke();
    angle += spd1;
    fill(255);

    if(rectCircleIntersect(ashX, ashY, ashWidth, ashHeight, pikaX, pikaY, radius) == true){
      angle = 0.0;
      if(pikaX == ((ashWidth/2) + ashX)){
        direction = 1;
        spd = 3;
      }
      else if((pikaX > ashX) && (pikaX < (ashX + (ashWidth/2)))){
        direction = 2;
        spd = 1;
      }
      else if(pikaX == ashX){
        direction = 3;
        spd = 1;
      }
      else if((pikaX < (ashX + ashWidth)) && (pikaX > (ashX + (ashWidth/2)))){
        direction = 4;
        spd = 1;
      }
      else if (pikaX == (ashX + (ashWidth))){
        direction = 5;
        spd = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          spd = 3;
        }
        else{
          spd = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(pikaX, pikaY, radius, pballX, pballY, pballr) == true) {
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
        pikaY = pballY;
        pikaX = pballX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        pikaX = 120;
        pikaY = radius;
        spd = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        pikaY = pikaY + spd;
      }
      else if(direction == 1){
        pikaY = pikaY - spd;
        if(pikaY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        pikaY = 220 + (((-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        pikaY = 220 + ((sin(angle))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(pikaY > height){
      lives--;
      if(lives == 0){
        background(255, 0, 0);
        fill(0); 
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Your pokemon has LOST!", 300, 10, 200, 50);
        text("Pokemon Level: " + score, 300, 25, 200, 50);
        noLoop();
        pikaX = -radius;
        pikaY = -radius;
      }
      else{
        pikaX = 120;
        pikaY = radius;
        count = 1;
        direction = -1;
        spd = 3;
      }
    }

    pika(pikaX, pikaY, count);

    if(score >= 50){
      scene = 4;
      gaugeLevelr = 0;
      a = 255;
    }
  }
  // L III
  else{
    if (gaugeLevelr < 50){
      println(gaugeLevelr);
      fill(0, a);
      text("LVL III", 10, 20);
      gaugeLevelr++;
    }
    fill(0, 255);

    if(lives > 0){
      text("Lives: " + lives, 425, 10, 200, 50);
    }
    text("Pokemon Level: " + score, 355, 25, 200, 50);
    ashX = map(mouseX, 0, 480, 10, 395);
    stroke(150);
    strokeWeight(5);
    strokeCap(SQUARE);
    noStroke();
    fill(0);
    rect(ashX, ashY, ashWidth, ashHeight);
    stroke(150);
    strokeWeight(1);
    fill(255);
    angle2 += spd1;
    pballX = (width/2) + (1.8*cos(angle2)*rad1);
    image(pokeball, pballX, pballY);
    noStroke();
    angle += spd;
    fill(255, 0, 0);

    if(rectCircleIntersect(ashX, ashY, ashWidth, ashHeight, pikaX, pikaY, radius) == true){
      angle = 0.0;
      if(pikaX == ((ashWidth/2) + ashX)){
        direction = 1;
        spd = 3;
      }
      else if((pikaX > ashX) && (pikaX < (ashX + (ashWidth/2)))){
        direction = 2;
        spd = 1;
      }
      else if(pikaX == ashX){
        direction = 3;
        spd = 1;
      }
      else if((pikaX < (ashX + ashWidth)) && (pikaX > (ashX + (ashWidth/2)))){
        direction = 4;
        spd = 1;
      }
      else if (pikaX == (ashX + (ashWidth))){
        direction = 5;
        spd = 1;
      }
      else{
        direction = int(random(0, 6));
        if(direction == 1){
          spd = 3;
        }
        else{
          spd = 1;
        }
      }
      count++;
      bounce = false;
    }

    if (circleCircleIntersect(pikaX, pikaY, radius, pballX, pballY, pballr) == true) {
      if(i == 0){
        if(count < 5){
          score++;
        }
        else if(count > 8){
          score--;
        }
        else{
          score = score + 10;
        }

        i = 1;
      }

      if(Timer < 75){
        pikaY = pballY;
        pikaX = pballX;
        Timer ++;
      }
      else
      {
        count = 1;
        direction = -1;
        pikaX = 120;
        pikaY = radius;
        spd = 3;
        Timer = 0;
        i = 0;
      }
    }

    else{
      if(direction == -1){
        pikaY = pikaY + spd;
      }
      else if(direction == 1){
        pikaY = pikaY - spd;
        if(pikaY < radius){
          direction = -1;
        }
      }
      else if(direction == 2){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 4;
        }
      }
      else if(direction == 3){
        pikaY = 220 + (((-sin(angle)))*rad1);
        pikaX = pikaX - spd;
        if(pikaX < radius){
          direction = 5;
        }
      }
      else if(direction == 4){
        pikaY = 220 + ((2*(-sin(angle)))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 2;
        }
      }
      else if(direction == 5){
        pikaY = 220 + ((sin(angle))*rad1);
        pikaX = pikaX + spd;
        if(pikaX > (width-radius)){
          direction = 3;
        }
      }
    }
    if(pikaY > height){
      lives--;
      if(lives == 0){
        background(255, 0, 0);
        fill(0); 
        text("GAME OVER", ((width/2)-50), (height/2));
        text("Your pokemon has lost!", 300, 10, 200, 50);
        text("Pokemon Level: " + score, 300, 25, 200, 50);
        noLoop();
        pikaX = -radius;
        pikaY = -radius;
      }
      else{
        pikaX = 120;
        pikaY = radius;
        count = 1;
        direction = -1;
        spd = 3;
      }
    }

    pika(pikaX, pikaY, count);
  }
}

void mouseClicked(){
  count = 1;
  lives = 5;
  score = 0;
  direction = -1;
  loop();
  pikaX = 140;
  pikaY = radius;
  spd = 3;
 scene = 2;
  gaugeLevelr = 0;
  a = 255;
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


void pika(float fx, float fy, int counter){
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



