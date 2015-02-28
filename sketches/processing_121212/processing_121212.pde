
//***********************************************************************\\
//Created By Chpwnd | 2013 All Rights Reserved | \\
//Feel Free To Modify And Do What You Wish, But Please Do Not Steal\\
//***********************************************************************\\



float targX;
float targY;
float derptastic;
float herptastic;
int a;
int b;
int c;
int d;
int q; //positive for speed
int z; //negative for speed
int r;
int add;
int act;
int round;
int give;
void setup() {
  background(255);
  size(600,600);
  frameRate(30);
  targX = 300;
  targY = 300;
  add = 10;
  act = 0;
  round = 1;
  give = 1;
  q = 1;
  z = 1;
  r = 1;
}
void draw() {
  background(255);
  text("Score:", 10, 10);
  text(act, 50, 10);
//
 
  {
    loop();
    derptastic = (random(2));
    herptastic = (random(2));
    fill(0, 0, 0, 175);
    ellipse(targX,targY,50,50);
  }
//
  {
    if(targX >= 580) {
      targX = 570;
    }
    if(targX <= 20) {
      targX = 30;
    }
//
    if(targY >= 500) {
      targY = 490;
    }
    if(targY <= 20) {
      targY = 30;
    }
  }
//
    if(derptastic <= 1) {
      targX = targX + q;
    }
    if(derptastic <= 2 && derptastic > 1) {
      targX = targX - q;
  }
//
    if(herptastic <= 1) {
      targY = targY + q;
    }
    if(herptastic <= 2 && herptastic > 1) {
      targY = targY - q;
    }
    derpderp();
    
    
    {
      if(act >= 100) {
        round = round+give;
        act = 0;
        z = z-1;
        q = q+1;
      }
      text("Round:", 500, 20);
      text(round, 550, 10);
      text("Difficulty:", 490, 10);
      text(round, 550, 20);
}

if(round == 1) {
  fill(20, 255, 0);
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
}

if(round == 2) {
  fill(20, 255, 0);
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133);
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
}

if(round == 3) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
}  
if(round == 4) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
}
if(round == 5) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
}

if(round == 6) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
}

if(round == 7) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
}

if(round == 8) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
}

if(round == 9) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
}

if(round == 10) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
}

if(round == 11) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
  fill(#00FFF0);
  rect(0, 380, 20, 20);
  fill(0);
  line(0, 380, 25, 380);
  text("11", 28, 385);
}

if(round == 12) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
  fill(#00FFF0);
  rect(0, 380, 20, 20);
  fill(0);
  line(0, 380, 25, 380);
  text("11", 28, 385);
  fill(#00C5FF);
  rect(0, 360, 20, 20);
  fill(0);
  line(0, 360, 25, 360);
  text("12", 28, 365);
}

if(round == 13) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
  fill(#00FFF0);
  rect(0, 380, 20, 20);
  fill(0);
  line(0, 380, 25, 380);
  text("11", 28, 385);
  fill(#00C5FF);
  rect(0, 360, 20, 20);
  fill(0);
  line(0, 360, 25, 360);
  text("12", 28, 365);
  fill(#34D1FF);
  rect(0, 340, 20, 20);
  fill(0);
  line(0, 340, 25, 340);
  text("13", 28, 345);
}

if(round == 14) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
  fill(#00FFF0);
  rect(0, 380, 20, 20);
  fill(0);
  line(0, 380, 25, 380);
  text("11", 28, 385);
  fill(#34D1FF);
  rect(0, 360, 20, 20);
  fill(0);
  line(0, 360, 25, 360);
  text("12", 28, 365);
  fill(#00C5FF);
  rect(0, 340, 20, 20);
  fill(0);
  line(0, 340, 25, 340);
  text("13", 28, 345);
  fill(#366FFC);
  rect(0, 320, 20, 20);
  fill(0);
  line(0, 320, 25, 320);
  text("14", 28, 325);
}

if(round == 15) {
  fill(20, 255, 0); //box 1
  rect(0, 580, 20, 20);
  fill(0);
  line(0, 580, 25, 580);
  text("1", 28, 585);
  fill(252, 252, 133); //box 2
  rect(0, 560, 20, 20);
  fill(0);
  line(0, 560, 25, 560);
  text("2", 28, 565);
  fill(#FFB13B); //box 3
  rect(0, 540, 20, 20);
  fill(0);
  line(0, 540, 25, 540);
  text("3", 28, 545);
  fill(255, 153, 0);
  rect(0, 520, 20, 20);
  fill(0);
  line(0, 520, 25, 520);
  text("4", 28, 525);
  fill(255, 81, 0);
  rect(0, 500, 20, 20);
  fill(0);
  line(0, 500, 25, 500);
  text("5", 28, 505);
  fill(#FF3300);
  rect(0, 480, 20, 20);
  fill(0);
  line(0, 480, 25, 480);
  text("6", 28, 485);
  fill(#FC0000);
  rect(0, 460, 20, 20);
  fill(0);
  line(0, 460, 25, 460);
  text("7", 28, 465);
  fill(#90FFF9);
  rect(0, 440, 20, 20);
  fill(0);
  line(0, 440, 25, 440);
  text("8", 28, 445);
  fill(#5FFFF6);
  rect(0, 420, 20, 20);
  fill(0);
  line(0, 420, 25, 420);
  text("9", 28, 425);
  fill(#31FFF3);
  rect(0, 400, 20, 20);
  fill(0);
  line(0, 400, 25, 400);
  text("10", 28, 405);
  fill(#00FFF0);
  rect(0, 380, 20, 20);
  fill(0);
  line(0, 380, 25, 380);
  text("11", 28, 385);
  fill(#34D1FF);
  rect(0, 360, 20, 20);
  fill(0);
  line(0, 360, 25, 360);
  text("12", 28, 365);
  fill(#00C5FF);
  rect(0, 340, 20, 20);
  fill(0);
  line(0, 340, 25, 340);
  text("13", 28, 345);
  fill(#366FFC);
  rect(0, 320, 20, 20);
  fill(0);
  line(0, 320, 25, 320);
  text("14", 28, 325);
  fill(#004AFF);
  rect(0, 300, 20, 20);
  fill(0);
  line(0, 300, 25, 300);
  text("Max", 28, 305);
}

}

void derpderp() {
  {
  fill(0);
  rect(mouseX-3,mouseY-100,6,6);
  }

  }
 void mouseClicked() {
   
     if( sqrt(sq(mouseX-targX)+sq((mouseY-100)-targY)) <= 25) {
      fill(0);      
      text("+10!", targX-20, targY-50);
      act = act+add;
      
  }
 }

