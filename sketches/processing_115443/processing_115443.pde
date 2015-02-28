
int x, y ;
int vx, vy;
int stat; //0=nomal, 1=high, 2=low

void setup() {
  size(600, 300);
  x=0;
  y=height/2;
  vx=5;
  vy=5;
  stat=0;
}

void draw() {
  background(255, 247, 0);
  chara(x, y);

  x=x+vx;
  y=y+vy;


  //Speed
  //High
  if (stat == 1) {
    
    if(vx > 0) vx =65;
    if(vx < 0) vx =-65;
    if(vy > 0) vy =65;
    if(vy < 0) vy =-65;
    
    //X
    if (x>width) {
      vx=-65;
    } 
    else if (x<0) {
      vx=65;
    }

    //Y
    if (y>height) {
      vy=-65;
    }
    else if (y<0) {
      vy=65;
    }
  }

  //Low
  else if (stat == 2) {
    
    if(vx > 0) vx =1;
    if(vx < 0) vx =-1;
    if(vy > 0) vy =1;
    if(vy < 0) vy =-1;
    
    //X
    if (x>width) {
      vx=-1;
    } 
    if (x<0) {
      vx=1;
    }

    //Y
    if (y>height) {
      vy=-1;
    }
    if (y<0) {
      vy=1;
    }
    stat=2;
  }

  //Nomal
  else if (stat == 0) {
    
    if(vx > 0) vx =5;
    if(vx < 0) vx =-5;
    if(vy > 0) vy =5;
    if(vy < 0) vy =-5;
    
    //X
    if (x>width) {
      vx=-5;
    } 
    else if (x<0) {
      vx=5;
    }

    //Y
    if (y>height) {
      vy=-5;
    }
    else if (y<0) {
      vy=5;
    }
    stat = 0;
  }

  //Catch
  if (mousePressed) {
    if ((mouseX > x-50)&&(mouseX < x+50)&&(mouseY > y-50)&&(mouseY < y+50)) {
      chara_S(x, y);
      x = mouseX;
      y = mouseY;
    }
  }
}

void keyPressed() {
  if (key == 'a') stat = 1;
  else if (key == 'z') stat = 2;
  else if (key == 'x') stat = 0;
}

//void mousePressed() {
//  noLoop();      // ボタンを押すと停止
//}

//void mouseReleased() {
//  loop();        // ボタンが離されたので再開
//}


void chara(int a, int b) {
  
  pushMatrix();
  translate(a,b);
  
  if(stat == 0){
    strokeWeight(3);
    fill(255,247,0);
    ellipse(0,0,70,70);
  
//kao
    strokeWeight(5);
    line(0,-20,0,-5);
    line(15,-20,15,-5);
  }
  
  else if(stat == 1){
    strokeWeight(3);
    fill(255,0,0);
    ellipse(0,0,70,70);
    
    //kao
    strokeWeight(5);
    line(-10,-20,0,-10);
    line(20,-20,15,-10);
  }
  
  else if(stat == 2){
     strokeWeight(3);
    fill(0,65,255);
    ellipse(0,0,70,70);
    
    //kao
    strokeWeight(5);
    line(-10,-15,0,-15);
    line(13,-15,20,-15);
  }
  
  
  popMatrix();
}

void chara_S(int a, int b) {

  pushMatrix();
  translate(a,b);
  
  strokeWeight(3);
  fill(255,255,255);
  ellipse(0,0,70,70);
  
  //kao
  ellipse(0,-13,10,20);
  ellipse(15,-13,10,20);
  
  //bikkuri
  line(15,-37,15,-45);
  line(15,-45,25,-35);
  line(25,-35,32,-45);
  line(32,-45,36,-33);
  line(36,-33,45,-37);
  line(45,-37,42,-25);
  
  popMatrix();
}
  


