


boolean yIncrease, yDecrease, xIncrease, xDecrease, YIncrease, YDecrease, XIncrease, XDecrease;
int score1=0;
int score2=0;
Slime1 b = new Slime1();
Slime2 c = new Slime2();
PVector bv; 
PVector bpos; 
PVector slimepos;
PVector bvec;
PVector grav;

void setup()
{
  size(1000, 600);
  bpos = new PVector (250,200);
  bv = new PVector (0,2);
  grav = new PVector (0,.12);
}

float bx=200;
float by=200;

float bvx=4;
float bvy=2;

void draw()
{
  bpos.add(bv);
  bv.add(grav);
  
  if ( (bpos.x>width) || (bpos.x<0)) {
   bv.x=bv.x*-1; 
  }
  
  noStroke();
  background(5, 186, 255);
  fill(149, 151, 152);
  rect (0, 500, 1000, 100);
  fill(255);
  textSize(60);
  text(score1, 50, 50);
  text(score2, 900, 50);
  fill(255, 255, 255);
  rect(500, 500, 20, 1000);

  b.update();
  b.display();
  c.update();
  c.display();

  fill(255);
  ellipse(bpos.x, bpos.y, 20, 20);

  //bvy=bvy+.12;
//  if (bx==0 || bx==width) {
  //  bvx=-bvx;
 // }
  if (score1>=11){
       background(255);
       fill(0);
       textSize(100);
       text("Slime 1 Wins",50,100);
     }
     if (score2>=11){
       background(255);
       fill(0);
       textSize(100);
       text("Slime 2 Wins",50,100);
     }
 if (bpos.y>490) {
  //bv.y= bv.y*-1;
 
  if (bpos.x>510) {
    score1=score1+1;
      bpos = new PVector (250,200);
  bv = new PVector (0,2);
   }
 }
  if (bpos.y>490) {
     if (bpos.x<490) {
    score2=score2+1;
      bpos = new PVector (750,200);
  bv = new PVector (0,2);
   }
 
}
}



void keyPressed() {
  if (keyCode == UP) {
    yDecrease = true;
  } else if (keyCode == DOWN) {
    yIncrease = true;
  } else if (keyCode == RIGHT) {
    xIncrease = true;
  } else if (keyCode == LEFT) {
    xDecrease = true;
  } else if (key == 'w') {
    YDecrease = true;
  } else if (key == 's') {
    YIncrease = true;
  } else if (key == 'd') {
    XIncrease = true;
  } else if (key == 'a') {
    XDecrease = true;
  }
    if (key=='r') {
    bx = 100;
    by = 100;
    score1 = 0;
    score2= 0; 
  bpos = new PVector (250,200);
  bv = new PVector (0,2);
}
}

void keyReleased() {
  if (keyCode == UP) {
    yDecrease = false;
  } else if (keyCode == DOWN) {
    yIncrease = false;
  } else if (keyCode == RIGHT) {
    xIncrease = false;
  } else if (keyCode == LEFT) {
    xDecrease = false;
  } else if (key == 'w') {
    YDecrease = false;
  } else if (key == 's') {
    YIncrease = false;
  } else if (key == 'd') {
    XIncrease = false;
  } else if (key == 'a') {
    XDecrease = false;
  }
} 


class Slime1 {
  float radius = 40;
  float x = 250;
  float y = 490;
  float xPos=250;
  float yPos=490;
  float g=-5;
  float speedy=3;
  float speedx=6;
  float i=0;
 


  void update() {
 if (bpos.y>490) {
   x= 250;
   y = 500;
   
 }
    if (YDecrease == true && y > radius/2) {
      speedy=-5;
    }
    if (YIncrease == true && y > radius/2) {
      i = i+.1;
    }
    if (xPos<450) {

      if (XIncrease == true && x < width - radius/2) {
        x = x + speedx;
      }
    }
    if (XDecrease == true && x > radius/2) {
      x = x - speedx;
    }
    yPos = yPos+speedy;

    if (yPos>=500) {
      speedy=0;
    }
    if (yPos<=300) {
      speedy=3;
    }
    if ((dist(bpos.x,bpos.y,xPos,yPos)<=60) && bpos.y<(yPos+10)) {
   
   //  bpos= new PVector(bx,by);
    // slimepos= new PVector (xPos,yPos);
    // bvec= new PVector ((xPos-bx),(yPos-by));
//  (xPos-bx)*bvx+(yPos-by)*bvy

     bv.rotate(PI-acos(((xPos-bpos.x)*bv.x+(yPos-bpos.y)*bv.y) / (mag(bv.x,bv.y)*sqrt((xPos-bpos.x)*(xPos-bpos.x)+(yPos-bpos.y)*(yPos-bpos.y)))));

    }
   
  }


  void display() {

    noStroke();
    fill(0, 250, 0);
    xPos = x;

    if (i<1) {
      fill (245, 22, 37);
    }
    if (1<i && i<2) {
      fill (5, 61, 255);
    } 
    if (2<i && i<3) {
      fill (238, 255, 57);
    }
    if (3<i && i<4) {
      fill (255, 255, 255);
    }
    if (4<i && i<5) {
      fill (18,255,5);
    }

    if (5<i && i<6) {
      fill (0, 0, 0);
    }
      if (6<i && i<7) {
      fill (5, 250, 255);
    }
    if (7<i && i<8) {
      fill (5, 186, 255);
    }

    if (i>8) {
      i=0;
    }



    arc(xPos, yPos, 100, 100, radians(180), radians(360));
    fill (255, 255, 255);
    ellipse(xPos+24, yPos-27, 16, 16);
    if (score1>(score2+2)) {
    fill(0);
    arc(xPos+25,yPos-15,28,23,radians(0), radians(180));
    }
    //bezier (xPos+15,yPos-25,xPos-20,yPos+10,xPos+80,yPos+10,xPos+30,yPos-25);
  }
}

class Slime2 {
  int radius = 20;
  int x = 750;
  int y = 490;
  int xPos=750;
  float yPos=490;
  float speedy=3;
  float speedx=6;
  float h=4.2;
  void update() {
 if (bpos.y>490) {
   x= 750;
   y = 500;
   
 }
    if (yDecrease == true && y > radius) {
      speedy=-5;
    }
    if (yIncrease == true && y > radius/2) {
      h = h+.1;
    }
    if (xIncrease == true && x < width - radius) {
      x = x + 6;
    }
    if (xPos>570) {
      if (xDecrease == true && x > radius) {
        x = x - 6;
      }
    }
    yPos = yPos+speedy;
    if (yPos>=500) {
      speedy=0;
    }
    if (yPos<=300) {
      speedy=3;
    }
  if ((dist(bpos.x,bpos.y,xPos,yPos)<=60) && bpos.y<(yPos+10)) {
   
  
     bv.rotate(PI-acos(((xPos-bpos.x)*bv.x+(yPos-bpos.y)*bv.y) / (mag(bv.x,bv.y)*sqrt((xPos-bpos.x)*(xPos-bpos.x)+(yPos-bpos.y)*(yPos-bpos.y)))));

    }
     if (bx==0 || bx==width) {
    bvx=-bvx;
  }
  }    

  void display() {
    noStroke();

    xPos = x;

    if (h<1) {
      fill (245, 22, 37);
    }
    if (1<h && h<2) {
      fill (5, 61, 255);
    } 
    if (2<h &&h<3) {
      fill (238, 255, 57);
    }
    if (3<h && h<4) {
      fill (255, 255, 255);
    }
    if (4<h && h<5) {
      fill (18, 255, 5);
    }

    if (5<h && h<6) {
      fill (0, 0, 0);
    }
    if (6<h && h<7) {
      fill (5, 250, 255);
    }
    if (7<h && h<8) {
      fill (5, 186, 255);
    }

    if (h>8) {
      h=0;
    }
    arc(xPos, yPos, 100, 100, radians(180), radians(360));
    fill (255, 255, 255);
    ellipse(xPos-24, yPos-27, 16, 16);
    if (score2>(score1+2)) {
    fill(0);
    arc(xPos-25,yPos-15,28,23,radians(0), radians(180));
    }
  }
}



