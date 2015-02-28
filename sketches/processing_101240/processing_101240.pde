

float posx = width/2;
float posy = height/2;
float velx = 5;
float vely = 2;
float pad_height = 10;
float pad_width = 70;
int score = 0;
int level = 1;
int moveArea = 30;

void setup(){
  size(500,500);
  background(0);
}

void draw(){
  background(0);
  posx += velx;
  posy += vely;
  fill(0,200,0);
  rect(posx,posy,30,30);
  fill(255);
  rect(mouseX,height-pad_height,pad_width,pad_height);
  textSize(30);
  textAlign(CENTER);
  fill(255);
  text("Games played: " + score,width/2,height/4);
  fill(255);
  text("Level " + level + "/5", width/2,height/2);
  //stroke(255);
  //line(0,height-moveArea,width,height-moveArea);
  
  if (posx>=width-30){
    velx = -velx;
  }
  else if (posx<=0){
    velx = +-velx;
  }
  else if (posy>=(height-30)-pad_height && posx>=mouseX &&
           posx<mouseX + pad_width){
    vely = -vely;
  }
  else if (posy>=height - 30){
    posx = width/2;
    posy = height/2;
    score += 1;
    velx = 5;
    vely = 2;
    level = 1;
  }
  else if (posy<=0){
    vely = +-vely * 1.2;
  }
  
  if (vely>=3){
    level = 2;
  }
  else if (vely>=4){
    level = 3;
  }
  else if (vely>=5){
    level = 4;
  }
  else if (vely>=7){
    level = 5;
  }
  
}



