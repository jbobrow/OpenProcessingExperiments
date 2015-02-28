

int food = 15;
int eatTime = 0;
int torsoX = 250;
int torsoY = 100;
float [] rFoot = {torsoX+10, torsoY+50};
float [] lFoot = {torsoX-10, torsoY+50};
float [] head = {torsoX+20, torsoY-40};
float inc = TWO_PI/25.0;
float angle = 0;
float angle2 = 1.99;
float dropHeight = -15;
int clickX;
int backward = 0;
boolean foodDrop = false;
void setup(){
  size(500,200);
  background(255);
  smooth();
}

void draw(){
  background(255);
  if (foodDrop == true){
    feed();
  }
  if (dropHeight > 100){
      if ( rFoot[0] > clickX - 30 && rFoot[0] < clickX - 15){  
        if (rFoot[1] > 149 && rFoot[1] < 151 && lFoot[1] > 149 && lFoot[1] < 151){
          eat();
        }else {
        balance();
        }
    }else {
      walk();
    }
  }
  if (food == 0){
    balance();
    eatTime = 0;
    dropHeight = -15;
  }
  drawBird(torsoX,torsoY);
}

void mousePressed(){
  if (dropHeight == -15){
    clickX = mouseX;
    food = 15;
    foodDrop = true;
  }
  if (clickX < torsoX){
    backward = 60;
  } else {
    backward = 0;
  }
}

void walk(){
  torsoX = torsoX + (clickX - torsoX - backward)/36;
  head[0] = head[0] + (clickX - head[0]-10)/40;
  lFoot[0] = lFoot[0] + (clickX - lFoot[0]-40)/38;
  rFoot[0] = rFoot[0] + (clickX - rFoot[0]-20)/38;
  lFoot[1] = lFoot[1] - round(sin(angle)*2);
  rFoot[1] = rFoot[1] + round(sin(angle2)*2);
  angle = angle + inc;
  angle2 += inc;
}

void balance(){
  head[0] = head[0] + ((torsoX+20) - head[0])/8;
  head[1] = head[1] + ((torsoY-40) - head[1])/12;
  lFoot[1] = lFoot[1] + ((torsoY+50) - lFoot[1])/8;
  rFoot[1] = rFoot[1] + ((torsoY+50) - rFoot[1])/8;
  angle = 0;
  angle2 = 1.99;
}

void feed(){
  ellipse(clickX,dropHeight,food,food);
  dropHeight = dropHeight + (150 - dropHeight)/6;
}

void eat(){
  if( head[1] < 133){
  head[0] = head[0] + (clickX - head[0])/20;
  head[1] = head[1] + ((dropHeight-15) - head[1])/5;
  } else { 
    if (eatTime < 15){    
    head[0] = round(random(10)+clickX-20);
    head[1] = round(random(10)+dropHeight-10);
    food --;
    eatTime ++;    
    delay(100);
    }
  }
}
  
void drawBird(int x,int y){
  fill(0);
  noStroke();
  ellipse(x,y,50,35); 
  triangle(x-15, y,x-32, y-12, x-29, y+5);
  stroke(255);
  strokeWeight(1);
  line(x+5,y,x-10,y+3);
  line(x-10,y+3,x-17,y-3);
  bezier(head[0],head[1],head[0],head[1]-3,head[0]+5,head[1]-3,head[0]+5,head[1]);
  stroke(0);
  line(rFoot[0],rFoot[1],torsoX+8,torsoY+15);
  line(lFoot[0],lFoot[1],torsoX-8,torsoY+15);
  strokeWeight(4);
  line(head[0]-5,head[1]+5,torsoX+13,torsoY-10);
  noStroke();
  fill(255,150,0);
  triangle(rFoot[0],rFoot[1],rFoot[0]+8,rFoot[1]+5,rFoot[0]-8,rFoot[1]+5);
  triangle(lFoot[0],lFoot[1],lFoot[0]+8,lFoot[1]+5,lFoot[0]-8,lFoot[1]+5);
  triangle(head[0]+12,head[1],head[0]+9,head[1]+8,head[0]+22,head[1]+7);
  fill(0);
  noStroke();
  ellipse(head[0], head[1], 25, 20);
  stroke(255);
  strokeWeight(1);
  bezier(head[0],head[1],head[0],head[1]-3,head[0]+5,head[1]-3,head[0]+5,head[1]);
  fill(255,150,0);
  noStroke();
}

