
int w = 600;
int h = 600;
int r = 10;
float x = w/2;
float y = h/2;
float speed = 5;
float decay = .5;
float health = 255;
float heal = 1;
int n = 8;
float[] peopleX = new float[n]; 
float[] peopleY = new float[n];
float[] peopleV = new float[n];
float[] peopleH = new float[n];
int score = 0;
boolean ready = false;
PFont font = createFont("Arial",16,true);
PFont pa = createFont("Arial",72,true);
boolean pressed = false;
boolean paused = false;

void setup(){
  size(600,600);
  background(0);
  textFont(font);
  fill(255);
  textAlign(CENTER);
  text("Decay",width/2,50);
  text("Everyone needs other people. It is the way humans are.",width/2,100);
  text("Humans are also ignorant however, and prone to fear the unknown.",width/2,120);
  text("You just so happen to be infected by a newly discovered disease.",width/2,140);
  text("The only way to maintain your health is to surround yourself with others.",width/2,160);
  text("Studies suggest that the disease is neurological and kills you if you are lonely.",width/2,180);
  text("However, other people are so afraid that they will flee from you in fear.",width/2,200);
  text("It is not too uncommon that people die out of pure fear.",width/2,220);
  text("People also forget specific events but will still grow skeptical of you quickly.",width/2,240);
  text("Survive as long as you can, feeding off of other peoples company.",width/2,260);
  text("Controls",width/2,350);
  text("Click to move",width/2,370);
  text("Hold space to speed up",width/2,390);
  text("Press P to toggle pause",width/2,410);
  text("Click to Begin",width/2,500);
}

void draw(){
  if(paused){
    textFont(pa);
    textAlign(CENTER);
    fill(255);
    text("PAUSED",w/2,h/2);
  } else {
    if(ready == false && mousePressed && pressed == false){
      ready = true;
      health = 255;
      score = 0;
      for(int i = 0; i < n; i++){
        peopleX[i] = (int) (Math.random()*w);
        peopleY[i] = (int) (Math.random()*h);
        peopleV[i] = 1;
        peopleH[i] = 255;
      }
    }
    if(ready == true){
      textFont(font);
      score++;
      background(0);
      noCursor();
      stroke(255);
      line(mouseX-3,mouseY-3,mouseX+3,mouseY+3);
      line(mouseX+3,mouseY-3,mouseX-3,mouseY+3);
      ellipseMode(CENTER);
      if(mousePressed){
        if(Math.abs(x - mouseX) < speed && Math.abs(y - mouseY) < speed){
          y = mouseY;
          x = mouseX;
        } else {
          x += speed*cos(angle(x,y,mouseX,mouseY));
          y -= speed*sin(angle(x,y,mouseX,mouseY));
        }
        if(x > w - r){
          x = w - r;
        } else if(x < r){
          x = r;
        }
        if(y > h - r){
          y = h - r;
        } else if(y < r){
          y = r;
        }
      }
      health -= decay;
      fill(255);
      textAlign(LEFT);
      text("Score: "+score, 5, 35);
      noStroke();
      fill(125,0,0);
      rect(0,0,w*(health/255),10);
      for(float i = 0; i < 100; i += 1){
        stroke(255,100 - i);
        noFill();
        ellipse(x,y,i,i);
      }
      fill(0,health,0);
      stroke(255);
      ellipse(x,y,2*r,2*r);
      for(int i = 0; i < n; i++){
        if(peopleH[i] > 0){
          peopleX[i] += peopleV[i]*cos(angle(x,y,peopleX[i],peopleY[i]));
          peopleY[i] -= peopleV[i]*sin(angle(x,y,peopleX[i],peopleY[i]));
          if(peopleX[i] > w - r){
            peopleX[i] = w/3 + (int)(Math.random()*w/3);
          } else if(peopleX[i] < r){
            peopleX[i] = w/3 + (int)(Math.random()*w/3);
          }
          if(peopleY[i] > h - r){
            peopleY[i] = h/3 + (int)(Math.random()*h/3);
          } else if(peopleY[i] < r){
            peopleY[i] = h/3 + (int)(Math.random()*h/3);
          }
          if(Math.sqrt(Math.pow(x - peopleX[i],2) + Math.pow(y - peopleY[i],2)) < 60){
            peopleV[i] += (.3/(Math.sqrt(Math.pow(x - peopleX[i],2) + Math.pow(y - peopleY[i],2))));
            float asdf = (float) (20/(Math.sqrt(Math.pow(x - peopleX[i],2) + Math.pow(y - peopleY[i],2))));
            peopleH[i] -= asdf;
            stroke(255);
            line(x,y, peopleX[i], peopleY[i]);
            if(health < 255){
              health += heal;
            }
          }else if(peopleH[i] > 255){
            peopleH[i] += 3;
          }
          if(peopleV[i] > 3){
            peopleV[i] *= .95;
          }
          fill(255,0,0,peopleH[i]);
          stroke(255);
          ellipse(peopleX[i],peopleY[i],2*r,2*r);
          noFill();
          rect(peopleX[i] - 20, peopleY[i] - 20, 40,5);
          noStroke();
          fill(255,0,0);
          rect(peopleX[i] - 20, peopleY[i] - 20, 40*(peopleH[i]/255),5);
        }
      }
      if(health < 0){
        background(0);
        fill(255);
        textAlign(CENTER);
        text("It appears that you have died of loneliness.",width/2,100);
        text("Final Score: " + score,width/2,120);
        text("Tips",width/2,200);
        text("You cannot have more than maximum health.",width/2,220);
        text("Other people will gradually slow down and heal.",width/2,240);
        text("The closer you are the faster others will run and die.",width/2,260);
        text("Regardless of how close you are you will heal the same.",width/2,280);
        text("Score is solely dependant on survival time.",width/2,300);
        text("Click to play again.",width/2, 400);
        ready = false;
        if(mousePressed){
          pressed = true;
        }
      }
    }
    if(!mousePressed){
      pressed = false;
    }
  }
}

void keyPressed(){
  if(keyCode == ' '){
    speed = 10;
  }
}

void keyReleased(){
  if(keyCode == ' '){
    speed = 5;
  } else if(keyCode == 'p' || keyCode == 'P'){
    if(paused){
      paused = false;
    } else {
      paused = true;
    }
  }
}

float angle(float x1,float y1,float x2,float y2){
  if(x1 == x2){
    return 0;
  }
  if(x2 >= x1 && y2 >= y1){
    return ((2*PI) - atan((y2-y1)/(x2-x1)));
  } else if(x2 < x1 && y2 >= y1){
    return (PI - atan((y2-y1)/(x2-x1)));
  } else if(x2 < x1 && y2 < y1){
    return (PI - atan((y2-y1)/(x2-x1)));
  } else if(x2 >= x1 && y2 < y1){
    return (atan((y2-y1)/(x2-x1)) * -1);
  }
  return -1;
}

