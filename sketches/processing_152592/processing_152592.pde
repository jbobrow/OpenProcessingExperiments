
PFont font;

//menu
int drag = 0;
int tempy;
int start = 0;
int play = 0;
int del = 4;
//ball coor
float x1 = 350;
float y1 = 250;
int down;
//ball speed
float xs = 1;
float ys = 1.5;
float speed = 7;
int right;
//bar player
int xb = 10;
int yb = 10;

//bar ai
int xbi = 670;
float ybi = 10;
float ais = 9;

//score
int player = 0;
int ai     = 0;
void setup(){
  font = loadFont("font.vlw");
  size(700,500);

}

void draw(){
  background(0);
  if(start == 1){
  xs = xs * speed;
  ys = ys * speed; 
  start = 3;
  
  }
  else if(start == 2){
    option();
  }
  else if(start == 0){
    menu();
  }
  else if(start == 3){
    d();
  }
  
  if(play == 1){
    checklose();
   moveball();
  ball(x1,y1);
  bar();
  barai();
  }
  else if(play == 2){
    dislose();
  }
    }
  

void d(){
  del--;
  textFont(font, 200);
  textAlign(CENTER);
  fill(255);
  text(del, 350,300);
  int starttime = millis();
  int Starttime = millis();
    while(millis() - Starttime <1000){
   }
  if(del == -1){
    background(0);
    start = 5;
    play = 1;
    del = 4;

    
  }
  }


void menu(){
  xs = 1;
  ys = 1.5;
  stroke(255);
  noFill();
  textAlign(LEFT);
  textFont(font,15);
  text("Press Enter to Start ",25, 50);
  text("Press R to Reset ",25,90);
  text("Press S for settings ",25,130);
  text("Press Q to quit ",25, 170);
  
  textAlign(CENTER);
  textFont(font,30);
  //Start Button
  rect(285,100,130,50);
  text("START",350, 135);
  
  //Reset Button
  rect(285,200,130,50);
  text("RESET",350, 235);
  
  //Setting Button
  rect(285,300,130,50);
  text("SETTING",350, 335);
  
  if(mousePressed == true){
    if(mouseX >=285 && mouseX <=415){
      if(mouseY >= 100 && mouseY <=150){ 
       start = 1;
      }
      else if(mouseY >= 200 && mouseY <= 250){
        ai = 0;
        player = 0;
        yb = 10;
        ybi = 10;
      }
      else if(mouseY >= 300 && mouseY <= 350){
        start = 2;
      }
      
}
}
  if(keyPressed == true){
    if(key == ENTER){
        start = 1;
      }
    else if(key == 'R' || key == 'r'){
      ai = 0;
      player = 0;
      yb = 10;
      ybi = 10;
    }
    else if(key == 'S' || key == 's'){
      start = 2;
    }
    }
  }


void option(){
  String s = nf(speed, 1, 1);
  if(keyPressed == true){
    if(key == 'q'){
      start = 0;
    }
    else if(key == CODED){
      if(keyCode == UP){
        speed = speed + 0.1;
        if(speed >= 15.0){
          speed = 15.0;
        }
        int Starttime = millis();
    while(millis() - Starttime <50){
   }
      }
      else if(keyCode == DOWN){
        speed = speed - 0.1;
        if(speed <= 0.0){
          speed = 0.0;
        }
        int Starttime = millis();
    while(millis() - Starttime <50){
   }
      }
      else if(keyCode == RIGHT){
        ais = ais + 0.5;
        if(ais >= 15){
          ais = 15;
        }
        int Starttime = millis();
    while(millis() - Starttime <250){
   }
      }
      else if(keyCode == LEFT){
        ais = ais - 0.5;
        if(ais <= 0){
          ais = 0;
        }
        int Starttime = millis();
    while(millis() - Starttime <250){
   }
      }
    }
  }
  stroke(255);
  noFill();
  textAlign(CENTER);
  textFont(font,30);
  rect(50,300,130,50);
  text("BACK", 115, 335);
  
  textAlign(LEFT);
  text("BALL SPEED: " + s + "    (UP = +, DOWN = -)", 50,50);
  text("AI SPEED  : " + ais + "    (RIGHT = +, LEFT = -)", 50, 150);
  
  if(mousePressed){
    if(mouseX >= 50 && mouseX <= 180 && mouseY >= 300 && mouseY <=350){
      start = 0;
    }
  }
}
  
  

void bar(){
  noStroke();
  fill(255);
  rect(xb,yb,20,125);
  
  if(keyPressed == true){
    if(key == CODED){
      if(keyCode == UP){
         yb = yb - 10;
         if(yb<= 0){
            yb = 0;
         }
  }
  
      else if(keyCode == DOWN){
         yb = yb + 10;
         if(yb>= 375){
            yb = 375;
         }
  }

}
 else if(key == 'q'){
    start = 0;
    play = 0;
    xs = 1;
    ys = 1.5;
  }
  }
if(mouseX< 350){
  drag = 1;
  tempy = mouseY;
  
}
}

void barai(){
  noStroke();
  fill(255);
  rect(xbi,ybi,20,125);
  if(y1 > ybi + 125){
    ybi = ybi+ais;
  }
  else if(y1< ybi){
    ybi = ybi-ais;
  }
}
  

  
void ball(float x, float y){
  noStroke();
  fill(255);
  ellipse(x,y,30,30);
}

void moveball(){
  //AI
  if(y1 > ybi && y1 <=ybi+40 && x1 >= 655 && down == 1){
    right = 0;
    ys = ys * -1;
  }
  else if(y1 > ybi && y1 <ybi+40 && x1 >= 655 && down == 0){
    right = 0;
  }
  else if(y1 > ybi+40 && y1 <ybi+82.5 && x1 >= 655){
    right = 0;
  }
  else if(y1 >= ybi+82.5 && y1 <ybi+140 && x1 >= 655 && down == 1){
    right = 0;
  }
  else if(y1 > ybi+82.5 && y1 <ybi+140 && x1 >= 655 && down ==0){
    right = 0;
    ys = ys * -1;
  }
  else if(y1< ybi && y1 > ybi-15 && x1 <= 45 && down == 1){
    right = 0;
    ys = ys * -1;
  }
  else if(y1< ybi && y1 > ybi-15 && x1 <= 45 && down == 0){
    right = 0;
  }
  
  
  //PLAYER
  if(y1> yb && y1 <= yb+40 && x1 <= 45 && down == 1){
    right = 1;
    ys = ys * -1;
  }
  else if(y1> yb && y1 < yb+40 && x1 <= 45 && down == 0){
    right = 1;
  }
  
  else if(y1> yb+40 && y1< yb+82.5 && x1 <= 45 ){
    right = 1;
  }
  
  else if(y1>= yb+82.5 && y1 < yb+140 && x1 <= 45 && down == 1 ){
    right = 1;
  }
  else if(y1> yb+82.5 && y1 < yb+140 && x1 <= 45 && down == 0 ){
    right = 1;
    ys = ys * -1;
  }
  else if(y1< yb && y1 > yb-15 && x1 <= 45 && down == 1){
    right = 1;
    ys = ys * -1;
  }
  else if(y1< yb && y1 > yb-15 && x1 <= 45 && down == 0){
    right = 1;
  }
  
  
   if(y1 <= 15){
     ys = ys * -1;
     down = 1;
   }
   
   else if(y1 >= 485){
    ys = ys * -1;
    down = 0;
  }
  
  if(right == 0){
    x1 = x1 - xs;
  }
  else if(right == 1){
    x1 = x1 + xs;
  }
  y1 = (y1) + ys;
}


  void checklose(){
  
  
  if(ai >= 10 || player >= 10){
    play = 2;

  }
    
  if(x1 <= 5){
    x1 = 350;
    y1 = 250;
   int Starttime = millis();
   while(millis() - Starttime <1000){
   }
      ai++;
    
  }
  else if(x1 >= 695){
    x1 = 350;
    y1 = 250;
    int Starttime = millis();
    while(millis() - Starttime <1000){
   }
   player++;
    
  }
  fill(#5A5858);
  textFont(font,200);
  textAlign(LEFT);
  text(ai, 450,300);
  text(player, 100,300);
  }
  
  void dislose(){
    fill(255);
  textFont(font,100);
  textAlign(CENTER);
    if(ai >= 10){
      text("YOU LOSE", 350,300);  
     textFont(font,30); 
     text("Press Spacebar to return",350, 350);
      
    }
    else if(player >= 10){
      text("YOU WIN", 350,300);
      textFont(font,30);
      text("Press Spacebar to return",350, 350);
    }
    if(keyPressed == true){
      if(key == ' '){
        play = 0;
        start = 0;
        ai = 0;
  }
    }
  }
void mouseDragged(){
  if(drag == 1){
    int now = mouseY- tempy;
    yb = yb+now;
    if(yb <= 0){
      yb = 0;
    }
    else if(yb >= 625){
      yb = 625;
    }
    drag = 0;
  }
}
    
