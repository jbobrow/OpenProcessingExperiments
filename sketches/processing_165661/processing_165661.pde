
float x, y;
PFont font;
int life = 120;
int time = 60;
boolean boo = false;
int point = 0;
int rand;

void setup(){
  size(300, 300);
  font = createFont("SansSerif", 20);
  textFont(font);
  
}

void draw(){
  background(230);
  
  if(boo){
    if(point > 100){
      switch(rand){
        case 0:
        x++;
        break;
        case 1:
        x--;
        break;
        case 2:
        y++;
        break;
        case 3:
        y--;
        break;
      }
    }
      
    fill(#00CCCC);
    noStroke();
    ellipse(x, y, 40, 40);
    fill(#FFFF00);
    ellipse(x, y, 20, 20);
    fill(#AA3300);
    textAlign(CENTER);
    text("Click", x, y);
    life--;
    if(life == 0){
    boo = false;
    time = 60;
  }
  }
  
  
  if(time == 0){
    boo = true;
    if(point < 50){
    life = 120;
    }else{
      life = 60;
    }
    if(point > 100){
      rand = int(random(0, 4));
    }
    
    x = random(20, 280);
    y = random(20, 280);
  }
  time--;
  fill(0);
  textAlign(RIGHT);
  text("POINT  " + point, 280, 15);
  println(time);
}

void mousePressed(){
  if(boo && dist(x, y, mouseX, mouseY) < 20){
    point += 10;
    life = 1;
  }
}
