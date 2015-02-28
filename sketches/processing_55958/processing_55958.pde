
float vy, vx, x, y, frictiony, frictionx, gravity, ellipseX, ellipseY, r, g, b;
int mode, timer, score;
boolean levelcolor, changed;

void setup(){
  smooth();
  //noStroke();
  background(255);
  size(800,600);
  mode = 0;
  r = 40;
  g = 230;
  b = 120;
  vy = 0;
  vx = 2;
  x = 0;
  y = 100;
  levelcolor = false;
  frictiony = -.6;
  frictionx = 1;
  gravity = .04;
  ellipseX = 400;
  ellipseY = 100;
  changed = false;
  score = 0;
  
}

void draw(){
  fill(255);
  noStroke();
  ellipse(750,40,60,60);
  ellipse(60,50,70,70);
  fill(0);
  timer = (60000-millis())/1000;
  if(timer < 5){
    fill(255,0,0);
  }
  if(timer < 1){
    mode = 1;
  }
  if(mode ==1){
    fill(0);
    rect(0,0,width,height);
    fill(255);
    textSize(50);
    text("GAME OVER", 250,300);
    textSize(30);
    text(score, width/2, 350);
  }
  if(mode ==0){
  textSize(30);
  text(timer,730,50);
  text(score, 50, 50);
  fill(255,255,255,.9);
  rect(0, 0,width,height);
  noStroke();
  fill (random(200,255), random(200,255), random(200,255));
  ellipse(ellipseX,ellipseY,60,60);
  noFill();
  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  if(y > height){
    y = height;
    vy *= frictiony;
  }
  if(x > width){
    x = width;
    vx *= -1;
  }
   if(x < 1){
    x = 10;
    vx *= -1;
  }
  if(mode == 0){
  }else if (mode == 1){
  }  
  fill(232, 43, 232);
  stroke(random(0,255), random(0,255), random(0,255));
  strokeWeight(.1);
  if(dist(x,y,ellipseX,ellipseY) <25){
    levelcolor = true;   
          ellipseY = mouseY;
          ellipseX = mouseX;
            r = random(0,255);
            g = random(0, 255);
            b = random(0, 255);
            score++;
  }
  if(levelcolor && !changed){
    changed = true;
}
  if(levelcolor != false){
        fill(r, g, b);
  }

    ellipse(x,y,50,50);
}
}
void mouseReleased(){
  vy -= 3;

}

