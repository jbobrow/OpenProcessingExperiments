
int m = millis(), a = 0, b = 400,c = 350, d = 600, e = 550, f = 900, g = 10;
int da=2, db = 3;
int lose = 0, lose2 = 0, lose3 = 0, lose4 = 0, lose5 = 0, lose6 = 0, lose7 = 0, lose8 = 0;
float horizontalspeed = 0, verticalspeed = 0;
float billX = 0;
float billY = 250;




void setup(){
  size(500, 500);
  //Images
  stars = loadImage("stars.jpg");
  xwing2 = loadImage("xwing2.png");
  tieFighter = loadImage("tieFighter.png");
  tieBomber = loadImage("tieBomber.ico");
  bullet_bill = loadImage("Bullet_Bill.png");
  nerd = loadImage("nerd.jpg");
  mlg = loadImage("mlg.jpg");
  brony = loadImage("brony.png");
  dew = loadImage("dew.png");
  quick_scope = loadImage("quick_scope.png");
  eye = loadImage("eye.png");
  
}
  
void draw(){
  counter = millis()/1000;

//star background
    stars.resize(500, 500);
    image(stars, 0, 0);

//Bullet Bill
    billX += horizontalspeed;
    billY += verticalspeed;

  if(lose == 1 || lose2 == 1 || lose3 == 1 || lose4 == 1 || lose5 == 1 || lose6 == 1 || lose7 == 1 || lose8 == 1){
     billX = 0;
     billY = 250;
   }

  if(lose == 0 || lose2 == 0 || lose3 == 0 || lose4 == 0 || lose5 == 0 || lose6 == 0 || lose7 == 0 || lose8 == 0){
    bullet_bill.resize(80, 80);
    image(bullet_bill, billX, billY);
  }
 
    
//Tie Group 1
  b-=db;
  c-=db;
  if(b>-70 || c>-70){
    tieFighter.resize(70, 70);
    image(tieFighter, b, 400);
    image(tieFighter, b, 300);
    tieBomber.resize(70, 70);
    image(tieBomber, c, 350);
  } else if(b<0 || c<0){
    b = 570;
    c = 520;
  }
  
//Tie Group 2
  d-=db;
  e-=db;
  if(d>-70 || e>-70){
    image(tieFighter, d, 200);
    image(tieFighter, d, 100);
    image(tieBomber, e, 150);
  } else if(d<0 || e<0){
    d = 570;
    e = 520;
  }
  
//Tie Group 3
  f-=db;
  if(f>-70){
    image(tieFighter, f, 50);
    image(tieFighter, f, 450);
    image(tieBomber, f, 250);
  } else if(f<0){
    f = 570;
  }

//Staying on screen
  if (billY < -20){
    billY = -20;
  }
  if (billY > 440){
    billY = 440;
  }
  if (billX <0){
    billX = 0;
  }
  
//Win
  if (billX >= 120 && billX < 240){
    fill(#FFFFFF);
    textSize(30);
    text("Good start kid", 30, 30);
  }
  if (billX >= 240){
    fill(#FFFFFF);
    textSize(30);
    text("You're halfway there!", 30,30);
  }
  if (billX > 490){
    nerd.resize(500, 500);
    image(nerd, 0, 0);
    brony.resize(100, 120);
    image(brony, 0, 320);
    dew.resize(110, 140);
    image(dew, 10, 60);
    mlg.resize(150, 80);
    image(mlg, 350, 300);
    eye.resize(120, 100);
    image(eye, 240, 100);
    quick_scope.resize(100, 150);
    image(quick_scope, 400, 130);
  }

//Start over
//Tie bomber 1 kill box
  if (billX+80 >= c && billX+80 <= c+70 && billY >= 350 && billY <= 400){
    lose = 1;
  }
  else if (billX+80 < c || billX+80 > c+70 && billY < 350 || billY > 400){
    lose = 0;
  }


//Tie fighters 1 kill box
  if (billX+80 >= b+20 && billX+80 <= b+70 && billY <= 400 && billY >= 470){
    lose = 1;
  }
  else if (billX+80 < b+20 || billX+80 > b+70 && billY > 400 && billY < 470){
    lose = 0;
  }
  if (billX+80 >= b+20 && billX+80 <= b+70 && billY <= 300 && billY >= 370){
    lose2 = 1;
  }
  else if (billX+80 < b+20 || billX+80 > b+70 && billY > 300 && billY < 370){
    lose2 = 0;
  }
  
 
//Tie bomber 2 kill box
  if (billX+80 >= e && billX+80 <= e+70 && billY >= 150 && billY <= 220){
    lose3 = 1;
  }
  else if (billX+80 < e+5 || billX+80 > e+70 && billY < 150 || billY > 220){
    lose3 = 0;
  }
 
//Tie fighters 2 kill box
  if (billX+80 >= d+20 && billX+80 <= d+70 && billY <= 200 && billY >= 270){
    lose4 = 1;
  }
  else if (billX+80 < d+20 || billX+80 > d+70 && billY > 200 && billY < 270){
    lose4 = 0;
  }
  if (billX+80 >= e+20 && billX+80 <= e+70 && billY <= 100 && billY >= 170){
    lose5 = 1;
  }
  else if (billX+80 < e+20 || billX+80 > e+70 && billY > 100 && billY < 170){
    lose5 = 0;
  }
  
//Tie fighter/bomber row
  if (billX+80 >= f && billX+80 <= f+70 && billY >= 50 && billY <= 120){
    lose6 = 1;
  }
  else if (billX+80 < f+5 || billX+80 > f+70 && billY < 50 || billY > 120){
    lose6 = 0;
  }
  
  if (billX+80 >= f && billX+80 <= f+70 && billY >= 450 && billY <= 520){
    lose7 = 1;
  }
  else if (billX+80 < f+5 || billX+80 > f+70 && billY < 450 || billY > 520){
    lose7 = 0;
  }
  
  if (billX+80 >= f && billX+80 <= f+70 && billY >= 250 && billY <= 320){
    lose8 = 1;
  }
  else if (billX+80 < f+5 || billX+80 > f+70 && billY < 250 || billY > 320){
    lose8 = 0;
  }
  
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      verticalspeed = -3;
    }
    if (keyCode == DOWN){
      verticalspeed = 3;
    }
    if (keyCode == LEFT){
      horizontalspeed = -3;
    }
    if (keyCode == RIGHT){
      horizontalspeed = 3;
    }
  }
}
  
void keyReleased(){
  if (key == CODED){
    if (keyCode == UP || keyCode == DOWN){
      verticalspeed = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT){
      horizontalspeed = 0;
    }
  }
}



