
int page=1;
int level=0;
float shooterx=100;
float shootery=330;
float s=0.5;
PFont myFont = createFont("Verdana", 12);
Invader1 alien11 = new Invader1();
Invader1 alien12 = new Invader1();
Invader1 alien13 = new Invader1();
Invader1 alien14 = new Invader1();
Invader1 alien15 = new Invader1();
Invader1 alien16 = new Invader1();
Invader2 alien21 = new Invader2();
Invader2 alien22 = new Invader2();
Invader2 alien23 = new Invader2();
Invader2 alien24 = new Invader2();
Invader2 alien25 = new Invader2();
Invader2 alien26 = new Invader2();
Invader3 alien31 = new Invader3();
Invader3 alien32 = new Invader3();
Invader3 alien33 = new Invader3();
Invader3 alien34 = new Invader3();
Invader3 alien35 = new Invader3();
Invader4 alien41 = new Invader4();
Invader4 alien42 = new Invader4();
Invader4 alien43 = new Invader4();
Invader4 alien44 = new Invader4();
int rright=0;
int lleft=0;
int bullet=0;
float bux=-10;
float buy=-10;
int start=0;
int win=0;
float hx=-10;
float hy=-10;
int time2=0;
color c1=#FFFFFF;
color c2=#FFFFFF;
color c3=#FFFFFF;
color c4=#FFFFFF;
int thing1=0;
int thing2=0;
int thing3=0;
int thing4=0;

void setup() {
  size(500, 500);
  frameRate(30);
}
void draw() {
  background(#000000);
  if (thing1==0) {
    c1=color(random(256));
  }
  if (thing2==0) {
    c2=color(random(256));
  }
  if (thing3==0) {
    c3=color(random(256));
  }
  if (thing4==0) {
    c4=color(random(256));
  }
  if (page==1) {
    buy=-10;
    fill(#FFFFFF);
    textFont(myFont, 150);
    text("SPACE", 5, 130);
    textFont(myFont, 93);
    text("INVADERS", 5, 230);
    textFont(myFont, 30);
    fill(c1);
    rect(180, 275, 110, 30);
    fill(c2);
    rect(180, 325, 110, 30);
    fill(c3);
    rect(180, 375, 110, 30);
    fill(c4);
    rect(180, 425, 110, 30);
    fill(#000000);
    text("Level 1", 180, 300);
    text("Level 2", 180, 350);
    text("Level 3", 180, 400);
    text("Level 4", 180, 450);
    textFont(myFont, 12);
    fill(#FFFFFF);
    text("Use the ‘Left’ and ‘Right’ arrow keys to control your moves.", 1, 470); 
    text("Avoid shots from the space invaders.", 1, 482); 
    text("Press the ‘Spacebar’ button to shoot at your enemies.", 1, 494);
  }

  if (page==2) {
    fill(256, 0, 0);
    ellipse(490, 10, 20, 20);
    line(480, 0, 500, 20);
    line(500, 0, 480, 20);
    //main character
    //helper box
    hx=shooterx+82;
    hy=shootery+140;
    //ellipse(hx, hy, 50, 50);
    fill(#00FF00);
    beginShape();
    vertex(shooterx+(101*s), shootery+(306*s));
    vertex(shooterx+(101*s), shootery+(272*s));
    vertex(shooterx+(110*s), shootery+(272*s));
    vertex(shooterx+(110*s), shootery+(263*s));
    vertex(shooterx+(152*s), shootery+(264*s));
    vertex(shooterx+(152*s), shootery+(247*s));
    vertex(shooterx+(161*s), shootery+(247*s));
    vertex(shooterx+(161*s), shootery+(238*s));
    vertex(shooterx+(170*s), shootery+(238*s));
    vertex(shooterx+(170*s), shootery+(247*s));
    vertex(shooterx+(178*s), shootery+(247*s));
    vertex(shooterx+(178*s), shootery+(263*s));
    vertex(shooterx+(221*s), shootery+(264*s));
    vertex(shooterx+(220*s), shootery+(272*s));
    vertex(shooterx+(229*s), shootery+(272*s));
    vertex(shooterx+(229*s), shootery+(306*s));
    vertex(shooterx+(102*s), shootery+(306*s));
    vertex(shooterx+(102*s), shootery+(272*s));
    endShape();

    if (rright==1) {
      shooterx+=3;
    }
    if (lleft==1) {
      shooterx-=3;
    }
    //boundary
    if (shooterx>390) {
      shooterx=390;
    }
    if (shooterx<-55) {
      shooterx=-55;
    }
    if (bullet==1) {
      bux=shooterx+82 ;
      buy=shootery+120;
      start=1;
      bullet=0;
    }
    if (buy<-5) {
      start=0;
    }

    if (start==1) {
      fill(#FFFFFF);
      ellipse(bux, buy, 10, 10);
      buy-=3;
    }
    alien11.drawAndMove();
    alien12.drawAndMove();
    alien13.drawAndMove();
    alien14.drawAndMove();
    alien15.drawAndMove();
    alien16.drawAndMove();
    alien21.drawAndMove();
    alien22.drawAndMove();
    alien23.drawAndMove();
    alien24.drawAndMove();
    alien25.drawAndMove();
    alien26.drawAndMove();
    alien31.drawAndMove();
    alien32.drawAndMove();
    alien33.drawAndMove();
    alien34.drawAndMove();
    alien35.drawAndMove();
    alien41.drawAndMove();
    alien42.drawAndMove();
    alien43.drawAndMove();
    alien44.drawAndMove();
  }
  if (thing1==1) {
    c1=#FFFFFF;
  }
  if (thing2==1) {
    c2=#FFFFFF;
  }
  if (thing3==1) {
    c3=#FFFFFF;
  }
  if (thing4==1) {
    c4=#FFFFFF;
  }
  if (level==1) {
    if (win==6) {
      buy=-10;
      thing1=1;
      fill(#FF0000);
      textFont(myFont, 20);
      text("Well Done Earthling", 150, 40);
      text("This Time You Win", 150, 60);   
      time2=time2+1;
    }
  }
  if (level==2) {
    if (win==12) {
      buy=-10;
      thing2=1;
      fill(#FF0000);
      textFont(myFont, 20);
      text("Well Done Earthling", 150, 40);
      text("This Time You Win", 150, 60);   
      time2=time2+1;
    }
  }
  if (level==3) {
    if (win==17) {
      buy=-10;
      thing3=1;
      fill(#FF0000);
      textFont(myFont, 20);
      text("Well Done Earthling", 150, 40);
      text("This Time You Win", 150, 60);   
      time2=time2+1;
    }
  }
  if (level==4) {
    if (win==21) {
      buy=-10;
      thing4=1;
      fill(#FF0000);
      textFont(myFont, 20);
      text("Well Done Earthling", 150, 40);
      text("This Time You Win", 150, 60);   
      time2=time2+1;
    }
  }
  if (time2==100) {
    win=0;
    page=1;
    time2=0;
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, 490, 10)<10) {
    page=1;
    win=0;
  }
  if (page==1) {
    win=0;
    lleft=0;
    rright=0;
    if (mouseX>180&&mouseX<180+110&&mouseY>275&&mouseY<275+30) {
      page=2;
      level=1;
      buy=-10;
      alien21.q=2;
      alien22.q=2;
      alien23.q=2;
      alien24.q=2;
      alien25.q=2;
      alien26.q=2;
      alien31.q=2;
      alien32.q=2;
      alien33.q=2;
      alien34.q=2;
      alien35.q=2;
      alien41.q=2;
      alien42.q=2;
      alien43.q=2;
      alien44.q=2;

      if (alien11.q==2) {
        alien11.q=1;
      }
      if (alien12.q==2) {
        alien12.q=1;
      }
      if (alien13.q==2) {
        alien13.q=1;
      }
      if (alien14.q==2) {
        alien14.q=1;
      }
      if (alien15.q==2) {
        alien15.q=1;
      }
      if (alien16.q==2) {
        alien16.q=1;
      }
      alien11.setVars(60, 50);
      alien12.setVars(130, 50);
      alien13.setVars(200, 50);
      alien14.setVars(270, 50);
      alien15.setVars(340, 50);
      alien16.setVars(410, 50);
      alien11.vx=2;
      alien12.vx=2;
      alien13.vx=2;
      alien14.vx=2;
      alien15.vx=2;
      alien16.vx=2;
      alien11.time=0;
      alien12.time=0;
      alien13.time=0;
      alien14.time=0;
      alien15.time=0;
      alien16.time=0;
    }
    if (mouseX>180&&mouseX<180+110&&mouseY>325&&mouseY<325+30) {
      page=2;
      level=2;
      buy=-10;
      alien31.q=2;
      alien32.q=2;
      alien33.q=2;
      alien34.q=2;
      alien35.q=2;
      alien41.q=2;
      alien42.q=2;
      alien43.q=2;
      alien44.q=2;
      if (alien11.q==2) {
        alien11.q=1;
      }
      if (alien12.q==2) {
        alien12.q=1;
      }
      if (alien13.q==2) {
        alien13.q=1;
      }
      if (alien14.q==2) {
        alien14.q=1;
      }
      if (alien15.q==2) {
        alien16.q=1;
      }
      if (alien16.q==2) {
        alien16.q=1;
      }
      if (alien21.q==2) {
        alien21.q=1;
      }
      if (alien22.q==2) {
        alien22.q=1;
      }
      if (alien23.q==2) {
        alien23.q=1;
      }
      if (alien24.q==2) {
        alien24.q=1;
      }
      if (alien25.q==2) {
        alien25.q=1;
      }
      if (alien26.q==2) {
        alien26.q=1;
      }
      alien11.setVars(60, 50);
      alien12.setVars(130, 50);
      alien13.setVars(200, 50);
      alien14.setVars(270, 50);
      alien15.setVars(340, 50);
      alien16.setVars(410, 50);
      alien21.setVars(60, 130);
      alien22.setVars(130, 130);
      alien23.setVars(200, 130);
      alien24.setVars(270, 130);
      alien25.setVars(340, 130);
      alien26.setVars(410, 130);
      alien11.vx=2;
      alien12.vx=2;
      alien13.vx=2;
      alien14.vx=2;
      alien15.vx=2;
      alien16.vx=2;
      alien21.vx=2;
      alien22.vx=2;
      alien23.vx=2;
      alien24.vx=2;
      alien25.vx=2;
      alien26.vx=2;
      alien11.time=0;
      alien12.time=0;
      alien13.time=0;
      alien14.time=0;
      alien15.time=0;
      alien16.time=0;
      alien21.time=0;
      alien22.time=0;
      alien23.time=0;
      alien24.time=0;
      alien25.time=0;
      alien26.time=0;
    }
    if (mouseX>180&&mouseX<180+110&&mouseY>375&&mouseY<375+30) {
      page=2;
      level=3;
      buy=-10;
      alien41.q=2;
      alien42.q=2;
      alien43.q=2;
      alien44.q=2;
      if (alien11.q==2) {
        alien11.q=1;
      }
      if (alien12.q==2) {
        alien12.q=1;
      }
      if (alien13.q==2) {
        alien13.q=1;
      }
      if (alien14.q==2) {
        alien14.q=1;
      }
      if (alien15.q==2) {
        alien16.q=1;
      }
      if (alien16.q==2) {
        alien16.q=1;
      }
      if (alien21.q==2) {
        alien21.q=1;
      }
      if (alien22.q==2) {
        alien22.q=1;
      }
      if (alien23.q==2) {
        alien23.q=1;
      }
      if (alien24.q==2) {
        alien24.q=1;
      }
      if (alien25.q==2) {
        alien25.q=1;
      }
      if (alien26.q==2) {
        alien26.q=1;
      }
      if (alien31.q==2) {
        alien31.q=1;
      }
      if (alien32.q==2) {
        alien32.q=1;
      }
      if (alien33.q==2) {
        alien33.q=1;
      }
      if (alien34.q==2) {
        alien34.q=1;
      }
      if (alien35.q==2) {
        alien35.q=1;
      }
      alien11.setVars(60, 50);
      alien12.setVars(130, 50);
      alien13.setVars(200, 50);
      alien14.setVars(270, 50);
      alien15.setVars(340, 50);
      alien16.setVars(410, 50);
      alien21.setVars(60, 130);
      alien22.setVars(130, 130);
      alien23.setVars(200, 130);
      alien24.setVars(270, 130);
      alien25.setVars(340, 130);
      alien26.setVars(410, 130);
      alien31.setVars(75, 200);
      alien32.setVars(155, 200);
      alien33.setVars(235, 200);
      alien34.setVars(315, 200);
      alien35.setVars(395, 200);
      alien11.vx=2;
      alien12.vx=2;
      alien13.vx=2;
      alien14.vx=2;
      alien15.vx=2;
      alien16.vx=2;
      alien21.vx=2;
      alien22.vx=2;
      alien23.vx=2;
      alien24.vx=2;
      alien25.vx=2;
      alien26.vx=2;
      alien31.vx=2;
      alien32.vx=2;
      alien33.vx=2;
      alien34.vx=2;
      alien35.vx=2;
      alien11.time=0;
      alien12.time=0;
      alien13.time=0;
      alien14.time=0;
      alien15.time=0;
      alien16.time=0;
      alien21.time=0;
      alien22.time=0;
      alien23.time=0;
      alien24.time=0;
      alien25.time=0;
      alien26.time=0;
      alien31.time=0;
      alien32.time=0;
      alien33.time=0;
      alien34.time=0;
      alien35.time=0;
    }
    if (mouseX>180&&mouseX<180+110&&mouseY>425&&mouseY<425+30) {
      page=2;
      level=4;
      buy=-10;
      if (alien11.q==2) {
        alien11.q=1;
      }
      if (alien12.q==2) {
        alien12.q=1;
      }
      if (alien13.q==2) {
        alien13.q=1;
      }
      if (alien14.q==2) {
        alien14.q=1;
      }
      if (alien15.q==2) {
        alien16.q=1;
      }
      if (alien16.q==2) {
        alien16.q=1;
      }
      if (alien21.q==2) {
        alien21.q=1;
      }
      if (alien22.q==2) {
        alien22.q=1;
      }
      if (alien23.q==2) {
        alien23.q=1;
      }
      if (alien24.q==2) {
        alien24.q=1;
      }
      if (alien25.q==2) {
        alien25.q=1;
      }
      if (alien26.q==2) {
        alien26.q=1;
      }
      if (alien31.q==2) {
        alien31.q=1;
      }
      if (alien32.q==2) {
        alien32.q=1;
      }
      if (alien33.q==2) {
        alien33.q=1;
      }
      if (alien34.q==2) {
        alien34.q=1;
      }
      if (alien35.q==2) {
        alien35.q=1;
      }

      if (alien41.q==2) {
        alien41.q=1;
      }
      if (alien42.q==2) {
        alien42.q=1;
      }
      if (alien43.q==2) {
        alien43.q=1;
      }
      if (alien44.q==2) {
        alien44.q=1;
      }
      alien11.setVars(60, 50);
      alien12.setVars(130, 50);
      alien13.setVars(200, 50);
      alien14.setVars(270, 50);
      alien15.setVars(340, 50);
      alien16.setVars(410, 50);
      alien21.setVars(60, 130);
      alien22.setVars(130, 130);
      alien23.setVars(200, 130);
      alien24.setVars(270, 130);
      alien25.setVars(340, 130);
      alien26.setVars(410, 130);
      alien31.setVars(75, 200);
      alien32.setVars(155, 200);
      alien33.setVars(235, 200);
      alien34.setVars(315, 200);
      alien35.setVars(395, 200);
      alien41.setVars(80, 270);
      alien42.setVars(185, 270);
      alien43.setVars(290, 270);
      alien44.setVars(395, 270);
      alien11.vx=2;
      alien12.vx=2;
      alien13.vx=2;
      alien14.vx=2;
      alien15.vx=2;
      alien16.vx=2;
      alien21.vx=2;
      alien22.vx=2;
      alien23.vx=2;
      alien24.vx=2;
      alien25.vx=2;
      alien26.vx=2;
      alien31.vx=2;
      alien32.vx=2;
      alien33.vx=2;
      alien34.vx=2;
      alien35.vx=2;
      alien41.vx=2;
      alien42.vx=2;
      alien43.vx=2;
      alien44.vx=2;
      alien11.time=0;
      alien12.time=0;
      alien13.time=0;
      alien14.time=0;
      alien15.time=0;
      alien16.time=0;
      alien21.time=0;
      alien22.time=0;
      alien23.time=0;
      alien24.time=0;
      alien25.time=0;
      alien26.time=0;
      alien31.time=0;
      alien32.time=0;
      alien33.time=0;
      alien34.time=0;
      alien35.time=0;
      alien41.time=0;
      alien42.time=0;
      alien43.time=0;
      alien44.time=0;
    }
  }
}
void keyPressed() {
  if (page==2) {
    if (keyCode==RIGHT) {
      rright=1;
    }
    if (keyCode==LEFT) {
      lleft=1;
    }
    if (key==' ') {
      if (start==0) {
        bullet=1;
      }
    }
  }
}
void keyReleased() {
  if (page==2) {
    if (keyCode==RIGHT) {
      rright=0;
    }
    if (keyCode==LEFT) {
      lleft=0;
    }
  }
}

class Invader1 {
  float invader1x=0;
  float invader1y=0;
  float invader12x=0;
  float invader12y=0;
  float s=0.75;
  float x, y;
  int time=0;
  float vx=2;
  int pose=1;
  int shot=2;
  int go=0;
  int hop=0;
  float bx=-10;
  float by=-10;
  int q=1;

  void setVars(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void drawAndMove() {
    if (q==1) {
      if (dist(bux, buy, x, y)<30+5) {
        start=0;
        q=2;
        win+=1;
        buy=-10;
      }
      fill(#FFFFFF);
      shot=(int)random(1000);
      if (shot==1) {
        if (go==0) {
          go=1;
        }
      }

      if (go==1) {
        bx=x;
        by=y;
        hop=1;
        go=0;
      }
      if (hop==1) {
        shot=1;
        by=by+2;
      }
      if (by>510) {
        hop=0;
      }
      ellipse(bx, by, 10, 10);
      fill(#ffff00);
      if (dist(hx, hy, bx, by)<25) {
        page=1;
        by=100;
        q=1;
      }
      //helper box
      //ellipse(x,y,60,60);

      invader1x=x-85;
      invader1y=y-65;
      invader12x=x-85;
      invader12y=y-135;

      time=time+1;
      if (time>20) {

        if (vx==2) {
          vx=-2;
        }
        else if (vx==-2) {
          vx=2;
        }
        time=0;
      }
      x=x+vx;
      if (time==10) {
        pose=2;
      }
      if (time==20) {
        pose=1;
      }

      /////////////////////// FIRST INVADER POSE #1
      if (pose==1) {
        beginShape();
        stroke(#000000);
        strokeWeight(1);
        fill(#FFFFFF);
        vertex(invader1x+(80*s), invader1y+(117*s));
        vertex(invader1x+(80*s), invader1y+(107*s));
        vertex(invader1x+(88*s), invader1y+(107*s));
        vertex(invader1x+(88*s), invader1y+(99*s));
        vertex(invader1x+(96*s), invader1y+(99*s));
        vertex(invader1x+(97*s), invader1y+(91*s));
        vertex(invader1x+(80*s), invader1y+(91*s));
        vertex(invader1x+(80*s), invader1y+(73*s));
        vertex(invader1x+(88*s), invader1y+(73*s));
        vertex(invader1x+(88*s), invader1y+(65*s));
        vertex(invader1x+(97*s), invader1y+(65*s));
        vertex(invader1x+(97*s), invader1y+(57*s));
        vertex(invader1x+(105*s), invader1y+(57*s));
        vertex(invader1x+(105*s), invader1y+(48*s));
        vertex(invader1x+(122*s), invader1y+(48*s));
        vertex(invader1x+(123*s), invader1y+(56*s));
        vertex(invader1x+(131*s), invader1y+(56*s));
        vertex(invader1x+(131*s), invader1y+(64*s));
        vertex(invader1x+(139*s), invader1y+(65*s));
        vertex(invader1x+(140*s), invader1y+(74*s));
        vertex(invader1x+(148*s), invader1y+(74*s));
        vertex(invader1x+(149*s), invader1y+(91*s));
        vertex(invader1x+(131*s), invader1y+(90*s));
        vertex(invader1x+(131*s), invader1y+(99*s));
        vertex(invader1x+(140*s), invader1y+(99*s));
        vertex(invader1x+(140*s), invader1y+(108*s));
        vertex(invader1x+(149*s), invader1y+(108*s));
        vertex(invader1x+(148*s), invader1y+(117*s));
        vertex(invader1x+(139*s), invader1y+(117*s));
        vertex(invader1x+(139*s), invader1y+(108*s));
        vertex(invader1x+(132*s), invader1y+(108*s));
        vertex(invader1x+(131*s), invader1y+(116*s));
        vertex(invader1x+(123*s), invader1y+(116*s));
        vertex(invader1x+(122*s), invader1y+(107*s));
        vertex(invader1x+(106*s), invader1y+(107*s));
        vertex(invader1x+(106*s), invader1y+(117*s));
        vertex(invader1x+(97*s), invader1y+(117*s));
        vertex(invader1x+(97*s), invader1y+(108*s));
        vertex(invader1x+(89*s), invader1y+(108*s));
        vertex(invader1x+(89*s), invader1y+(116*s));
        vertex(invader1x+(80*s), invader1y+(116*s));
        endShape();
        beginShape();
        fill(#000000);
        vertex(invader1x+(98*s), invader1y+(108*s));
        vertex(invader1x+(98*s), invader1y+(99*s));
        vertex(invader1x+(106*s), invader1y+(99*s));
        vertex(invader1x+(105*s), invader1y+(107*s));
        endShape();
        beginShape();
        fill(#000000);
        vertex(invader1x+(123*s), invader1y+(108*s));
        vertex(invader1x+(131*s), invader1y+(107*s));
        vertex(invader1x+(131*s), invader1y+(99*s));
        vertex(invader1x+(123*s), invader1y+(99*s));
        endShape();
        beginShape();
        fill(#000000);
        vertex(invader1x+(106*s), invader1y+(99*s));
        vertex(invader1x+(122*s), invader1y+(98*s));
        vertex(invader1x+(122*s), invader1y+(91*s));
        vertex(invader1x+(106*s), invader1y+(91*s));
        endShape();
        beginShape();
        fill(#000000);
        vertex(invader1x+(97*s), invader1y+(82*s));
        vertex(invader1x+(105*s), invader1y+(82*s));
        vertex(invader1x+(105*s), invader1y+(74*s));
        vertex(invader1x+(98*s), invader1y+(74*s));
        endShape();
        beginShape();
        vertex(invader1x+(123*s), invader1y+(81*s));
        vertex(invader1x+(130*s), invader1y+(81*s));
        vertex(invader1x+(130*s), invader1y+(74*s));
        vertex(invader1x+(123*s), invader1y+(74*s));
        endShape();
      }
      if (pose==2) {
        //////////////////FIRST INVADER POSE #2
        fill(#FFFFFF);
        beginShape();
        vertex(invader12x+(90*s), invader12y+(213*s));
        vertex(invader12x+(90*s), invader12y+(205*s));
        vertex(invader12x+(82*s), invader12y+(205*s));
        vertex(invader12x+(82*s), invader12y+(197*s));
        vertex(invader12x+(90*s), invader12y+(197*s));
        vertex(invader12x+(90*s), invader12y+(188*s));
        vertex(invader12x+(82*s), invader12y+(188*s));
        vertex(invader12x+(82*s), invader12y+(171*s));
        vertex(invader12x+(90*s), invader12y+(171*s));
        vertex(invader12x+(90*s), invader12y+(163*s));
        vertex(invader12x+(98*s), invader12y+(163*s));
        vertex(invader12x+(98*s), invader12y+(154*s));
        vertex(invader12x+(107*s), invader12y+(154*s));
        vertex(invader12x+(107*s), invader12y+(145*s));
        vertex(invader12x+(125*s), invader12y+(146*s));
        vertex(invader12x+(125*s), invader12y+(153*s));
        vertex(invader12x+(133*s), invader12y+(154*s));
        vertex(invader12x+(133*s), invader12y+(162*s));
        vertex(invader12x+(142*s), invader12y+(163*s));
        vertex(invader12x+(141*s), invader12y+(171*s));
        vertex(invader12x+(150*s), invader12y+(171*s));
        vertex(invader12x+(150*s), invader12y+(189*s));
        vertex(invader12x+(141*s), invader12y+(189*s));
        vertex(invader12x+(141*s), invader12y+(196*s));
        vertex(invader12x+(151*s), invader12y+(197*s));
        vertex(invader12x+(151*s), invader12y+(205*s));
        vertex(invader12x+(141*s), invader12y+(205*s));
        vertex(invader12x+(142*s), invader12y+(214*s));
        vertex(invader12x+(133*s), invader12y+(214*s));
        vertex(invader12x+(133*s), invader12y+(205*s));
        vertex(invader12x+(141*s), invader12y+(205*s));
        vertex(invader12x+(141*s), invader12y+(197*s));
        vertex(invader12x+(133*s), invader12y+(197*s));
        vertex(invader12x+(133*s), invader12y+(188*s));
        vertex(invader12x+(125*s), invader12y+(188*s));
        vertex(invader12x+(125*s), invader12y+(197*s));
        vertex(invader12x+(108*s), invader12y+(197*s));
        vertex(invader12x+(107*s), invader12y+(189*s));
        vertex(invader12x+(100*s), invader12y+(188*s));
        vertex(invader12x+(100*s), invader12y+(197*s));
        vertex(invader12x+(90*s), invader12y+(197*s));
        vertex(invader12x+(91*s), invader12y+(204*s));
        vertex(invader12x+(99*s), invader12y+(205*s));
        vertex(invader12x+(99*s), invader12y+(214*s));
        vertex(invader12x+(90*s), invader12y+(214*s));
        vertex(invader12x+(90*s), invader12y+(206*s));
        endShape();
        fill(#000000);
        beginShape();
        vertex(invader12x+(99*s), invader12y+(180*s));
        vertex(invader12x+(99*s), invader12y+(171*s));
        vertex(invader12x+(107*s), invader12y+(171*s));
        vertex(invader12x+(107*s), invader12y+(180*s));
        endShape();
        beginShape();
        vertex(invader12x+(124*s), invader12y+(179*s));
        vertex(invader12x+(125*s), invader12y+(171*s));
        vertex(invader12x+(133*s), invader12y+(171*s));
        vertex(invader12x+(133*s), invader12y+(179*s));
        endShape();
      }
    }
    if (time2==99) {
      page=1;
      q=1;
    }
  }
}
class Invader2 {
  float invader2x=0;
  float invader2y=0;
  float invader21x=0;
  float invader21y=0;
  float s=0.75;
  float x, y;
  int time=0;
  float vx=2;
  int pose=1;
  int shot=2;
  int go=0;
  int hop=0;
  float bx=-10;
  float by=-10;
  int q=1;

  void setVars(int i, int j) {
    this.x = i;
    this.y = j;
  }
  void drawAndMove() {
    if (q==1) {
      if (dist(bux, buy, x, y)<30+5) {
        start=0;
        q=2;
        win+=1;
        buy=-10;
      }
      fill(#FFFFFF);
      shot=(int)random(1000);
      if (shot==1) {
        if (go==0) {
          go=1;
        }
      }

      if (go==1) {
        bx=x;
        by=y;
        hop=1;
        go=0;
      }
      if (hop==1) {
        shot=1;
        by=by+2;
      }
      if (by>510) {
        hop=0;
      }
      ellipse(bx, by, 10, 10);
      fill(#ffff00);
      if (dist(hx, hy, bx, by)<25) {
        page=1;
        by=100;
        q=1;
      }
      //helper box
      //ellipse(x,y,60,60);

      invader2x=x-177;
      invader2y=y-65;
      invader21x=x-177;
      invader21y=y-135;

      time=time+1;
      if (time>20) {

        if (vx==2) {
          vx=-2;
        }
        else if (vx==-2) {
          vx=2;
        }
        time=0;
      }
      x=x+vx;
      if (time==10) {
        pose=2;
      }
      if (time==20) {
        pose=1;
      }


      if (pose==1) {

        //////////////////SECOND INVADER POSE #1
        fill(#ffffff);
        beginShape();
        vertex(invader2x+(195*s), invader2y+(111*s));
        vertex(invader2x+(195*s), invader2y+(103*s));
        vertex(invader2x+(203*s), invader2y+(102*s));
        vertex(invader2x+(203*s), invader2y+(95*s));
        vertex(invader2x+(195*s), invader2y+(94*s));
        vertex(invader2x+(194*s), invader2y+(86*s));
        vertex(invader2x+(186*s), invader2y+(86*s));
        vertex(invader2x+(186*s), invader2y+(51*s));
        vertex(invader2x+(196*s), invader2y+(51*s));
        vertex(invader2x+(195*s), invader2y+(68*s));
        vertex(invader2x+(203*s), invader2y+(68*s));
        vertex(invader2x+(203*s), invader2y+(60*s));
        vertex(invader2x+(212*s), invader2y+(60*s));
        vertex(invader2x+(212*s), invader2y+(52*s));
        vertex(invader2x+(203*s), invader2y+(52*s));
        vertex(invader2x+(203*s), invader2y+(43*s));
        vertex(invader2x+(212*s), invader2y+(43*s));
        vertex(invader2x+(212*s), invader2y+(51*s));
        vertex(invader2x+(220*s), invader2y+(51*s));
        vertex(invader2x+(220*s), invader2y+(59*s));
        vertex(invader2x+(246*s), invader2y+(59*s));
        vertex(invader2x+(246*s), invader2y+(52*s));
        vertex(invader2x+(253*s), invader2y+(52*s));
        vertex(invader2x+(254*s), invader2y+(43*s));
        vertex(invader2x+(263*s), invader2y+(43*s));
        vertex(invader2x+(263*s), invader2y+(52*s));
        vertex(invader2x+(254*s), invader2y+(52*s));
        vertex(invader2x+(255*s), invader2y+(59*s));
        vertex(invader2x+(262*s), invader2y+(59*s));
        vertex(invader2x+(263*s), invader2y+(68*s));
        vertex(invader2x+(271*s), invader2y+(68*s));
        vertex(invader2x+(271*s), invader2y+(51*s));
        vertex(invader2x+(280*s), invader2y+(51*s));
        vertex(invader2x+(280*s), invader2y+(86*s));
        vertex(invader2x+(272*s), invader2y+(86*s));
        vertex(invader2x+(272*s), invader2y+(94*s));
        vertex(invader2x+(263*s), invader2y+(94*s));
        vertex(invader2x+(263*s), invader2y+(103*s));
        vertex(invader2x+(272*s), invader2y+(102*s));
        vertex(invader2x+(271*s), invader2y+(111*s));
        vertex(invader2x+(263*s), invader2y+(111*s));
        vertex(invader2x+(263*s), invader2y+(103*s));
        vertex(invader2x+(254*s), invader2y+(102*s));
        vertex(invader2x+(253*s), invader2y+(94*s));
        vertex(invader2x+(213*s), invader2y+(94*s));
        vertex(invader2x+(213*s), invader2y+(102*s));
        vertex(invader2x+(204*s), invader2y+(103*s));
        vertex(invader2x+(204*s), invader2y+(111*s));
        vertex(invader2x+(195*s), invader2y+(111*s));
        endShape();
        beginShape();
        fill(#000000);
        vertex(invader2x+(212*s), invader2y+(77*s));
        vertex(invader2x+(220*s), invader2y+(77*s));
        vertex(invader2x+(220*s), invader2y+(69*s));
        vertex(invader2x+(212*s), invader2y+(69*s));
        endShape();
        beginShape();
        vertex(invader2x+(246*s), invader2y+(76*s));
        vertex(invader2x+(254*s), invader2y+(76*s));
        vertex(invader2x+(254*s), invader2y+(69*s));
        vertex(invader2x+(246*s), invader2y+(69*s));
        endShape();
      }
      if (pose==2) {
        //////////////////SECOND INVADER POSE #2
        fill(#ffffff);
        beginShape();
        vertex(invader21x+(195*s), invader21y+(196*s));
        vertex(invader21x+(194*s), invader21y+(170*s));
        vertex(invader21x+(203*s), invader21y+(170*s));
        vertex(invader21x+(203*s), invader21y+(162*s));
        vertex(invader21x+(212*s), invader21y+(162*s));
        vertex(invader21x+(212*s), invader21y+(153*s));
        vertex(invader21x+(220*s), invader21y+(153*s));
        vertex(invader21x+(220*s), invader21y+(146*s));
        vertex(invader21x+(212*s), invader21y+(145*s));
        vertex(invader21x+(212*s), invader21y+(136*s));
        vertex(invader21x+(222*s), invader21y+(136*s));
        vertex(invader21x+(221*s), invader21y+(136*s));
        vertex(invader21x+(221*s), invader21y+(144*s));
        vertex(invader21x+(229*s), invader21y+(145*s));
        vertex(invader21x+(229*s), invader21y+(153*s));
        vertex(invader21x+(254*s), invader21y+(153*s));
        vertex(invader21x+(254*s), invader21y+(145*s));
        vertex(invader21x+(262*s), invader21y+(145*s));
        vertex(invader21x+(263*s), invader21y+(136*s));
        vertex(invader21x+(272*s), invader21y+(136*s));
        vertex(invader21x+(272*s), invader21y+(145*s));
        vertex(invader21x+(263*s), invader21y+(145*s));
        vertex(invader21x+(263*s), invader21y+(153*s));
        vertex(invader21x+(272*s), invader21y+(153*s));
        vertex(invader21x+(272*s), invader21y+(162*s));
        vertex(invader21x+(279*s), invader21y+(162*s));
        vertex(invader21x+(280*s), invader21y+(171*s));
        vertex(invader21x+(288*s), invader21y+(171*s));
        vertex(invader21x+(288*s), invader21y+(196*s));
        vertex(invader21x+(279*s), invader21y+(196*s));
        vertex(invader21x+(279*s), invader21y+(179*s));
        vertex(invader21x+(272*s), invader21y+(179*s));
        vertex(invader21x+(271*s), invader21y+(196*s));
        vertex(invader21x+(263*s), invader21y+(196*s));
        vertex(invader21x+(263*s), invader21y+(204*s));
        vertex(invader21x+(246*s), invader21y+(204*s));
        vertex(invader21x+(245*s), invader21y+(196*s));
        vertex(invader21x+(262*s), invader21y+(196*s));
        vertex(invader21x+(262*s), invader21y+(188*s));
        vertex(invader21x+(222*s), invader21y+(188*s));
        vertex(invader21x+(221*s), invader21y+(188*s));
        vertex(invader21x+(221*s), invader21y+(195*s));
        vertex(invader21x+(237*s), invader21y+(196*s));
        vertex(invader21x+(237*s), invader21y+(204*s));
        vertex(invader21x+(220*s), invader21y+(204*s));
        vertex(invader21x+(220*s), invader21y+(196*s));
        vertex(invader21x+(212*s), invader21y+(196*s));
        vertex(invader21x+(212*s), invader21y+(179*s));
        vertex(invader21x+(204*s), invader21y+(179*s));
        vertex(invader21x+(203*s), invader21y+(196*s));
        vertex(invader21x+(195*s), invader21y+(196*s));
        endShape();
        fill(#000000);
        beginShape();
        vertex(invader21x+(220*s), invader21y+(171*s));
        vertex(invader21x+(221*s), invader21y+(162*s));
        vertex(invader21x+(229*s), invader21y+(163*s));
        vertex(invader21x+(229*s), invader21y+(170*s));
        endShape();
        beginShape();
        vertex(invader21x+(255*s), invader21y+(171*s));
        vertex(invader21x+(255*s), invader21y+(163*s));
        vertex(invader21x+(263*s), invader21y+(163*s));
        vertex(invader21x+(262*s), invader21y+(169*s));
        endShape();
      }
    }

    if (time2==99) {
      page=1;
      q=1;
    }
  }
}
class Invader3 {
  float invader3x=0;
  float invader3y=0;
  float invader31x=0;
  float invader31y=0;
  float s=0.75;
  float x, y;
  int time=0;
  float vx=2;
  int pose=1;
  int shot=2;
  int go=0;
  int hop=0;
  float bx=-10;
  float by=-10;
  int q=1;

  void setVars(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void drawAndMove() {
    if ( q==1 ) {
      if (dist(bux, buy, x, y)<30+5) {
        start=0;
        q=2;
        win+=1;
        buy=-10;
      }
      fill(#FFFFFF);
      shot=(int)random(1000);
      if (shot==1) {
        if (go==0) {
          go=1;
        }
      }

      if (go==1) {
        bx=x;
        by=y;
        hop=1;
        go=0;
      }
      if (hop==1) {
        shot=1;
        by=by+2;
      }
      if (by>510) {
        hop=0;
      }
      ellipse(bx, by, 10, 10);
      fill(#ffff00);
      if (dist(hx, hy, bx, by)<25) {
        page=1;
        by=100;
        q=1;
      }
      //helper box
      //ellipse(x, y, 60, 60);

      invader3x=x-275;
      invader3y=y-65;
      invader31x=x-275;
      invader31y=y-135;

      time=time+1;
      if (time>20) {
        if (vx==2) {
          vx=-2;
        }
        else if (vx==-2) {
          vx=2;
        }
        time=0;
      }
      x=x+vx;
      if (time==10) {
        pose=2;
      }
      else if (time==20) {
        pose=1;
      }


      if (pose==1) {
        ////////////////////SPACE INVADER 3 POSE #1
        fill(#ffffff);
        beginShape();
        vertex(invader3x+(313*s), invader3y+(120*s));
        vertex(invader3x+(313*s), invader3y+(111*s));
        vertex(invader3x+(329*s), invader3y+(111*s));
        vertex(invader3x+(330*s), invader3y+(102*s));
        vertex(invader3x+(338*s), invader3y+(102*s));
        vertex(invader3x+(338*s), invader3y+(95*s));
        vertex(invader3x+(313*s), invader3y+(95*s));
        vertex(invader3x+(313*s), invader3y+(68*s));
        vertex(invader3x+(321*s), invader3y+(68*s));
        vertex(invader3x+(321*s), invader3y+(60*s));
        vertex(invader3x+(347*s), invader3y+(60*s));
        vertex(invader3x+(347*s), invader3y+(51*s));
        vertex(invader3x+(382*s), invader3y+(52*s));
        vertex(invader3x+(382*s), invader3y+(59*s));
        vertex(invader3x+(407*s), invader3y+(60*s));
        vertex(invader3x+(407*s), invader3y+(68*s));
        vertex(invader3x+(416*s), invader3y+(69*s));
        vertex(invader3x+(416*s), invader3y+(94*s));
        vertex(invader3x+(390*s), invader3y+(94*s));
        vertex(invader3x+(390*s), invader3y+(102*s));
        vertex(invader3x+(399*s), invader3y+(103*s));
        vertex(invader3x+(399*s), invader3y+(111*s));
        vertex(invader3x+(416*s), invader3y+(111*s));
        vertex(invader3x+(416*s), invader3y+(119*s));
        vertex(invader3x+(398*s), invader3y+(119*s));
        vertex(invader3x+(398*s), invader3y+(111*s));
        vertex(invader3x+(381*s), invader3y+(111*s));
        vertex(invader3x+(381*s), invader3y+(103*s));
        vertex(invader3x+(374*s), invader3y+(103*s));
        vertex(invader3x+(373*s), invader3y+(111*s));
        vertex(invader3x+(356*s), invader3y+(111*s));
        vertex(invader3x+(356*s), invader3y+(103*s));
        vertex(invader3x+(348*s), invader3y+(103*s));
        vertex(invader3x+(347*s), invader3y+(110*s));
        vertex(invader3x+(331*s), invader3y+(111*s));
        vertex(invader3x+(330*s), invader3y+(120*s));
        vertex(invader3x+(313*s), invader3y+(119*s));
        endShape();
        fill(#000000);
        beginShape();
        vertex(invader3x+(356*s), invader3y+(103*s));
        vertex(invader3x+(373*s), invader3y+(102*s));
        vertex(invader3x+(372*s), invader3y+(95*s));
        vertex(invader3x+(356*s), invader3y+(95*s));
        endShape();
        beginShape();
        vertex(invader3x+(339*s), invader3y+(85*s));
        vertex(invader3x+(339*s), invader3y+(77*s));
        vertex(invader3x+(356*s), invader3y+(76*s));
        vertex(invader3x+(355*s), invader3y+(84*s));
        endShape();
        beginShape();
        vertex(invader3x+(374*s), invader3y+(85*s));
        vertex(invader3x+(373*s), invader3y+(77*s));
        vertex(invader3x+(389*s), invader3y+(77*s));
        vertex(invader3x+(389*s), invader3y+(85*s));
        endShape();
      }
      if (pose==2) {
        //////////////////SPACE INVADER 3 POSE #2
        fill(#ffffff);
        beginShape();
        vertex(invader31x+(330*s), invader31y+(221*s));
        vertex(invader31x+(330*s), invader31y+(213*s));
        vertex(invader31x+(322*s), invader31y+(213*s));
        vertex(invader31x+(322*s), invader31y+(204*s));
        vertex(invader31x+(330*s), invader31y+(204*s));
        vertex(invader31x+(330*s), invader31y+(197*s));
        vertex(invader31x+(313*s), invader31y+(196*s));
        vertex(invader31x+(313*s), invader31y+(170*s));
        vertex(invader31x+(322*s), invader31y+(170*s));
        vertex(invader31x+(322*s), invader31y+(162*s));
        vertex(invader31x+(347*s), invader31y+(162*s));
        vertex(invader31x+(347*s), invader31y+(153*s));
        vertex(invader31x+(382*s), invader31y+(154*s));
        vertex(invader31x+(382*s), invader31y+(161*s));
        vertex(invader31x+(407*s), invader31y+(162*s));
        vertex(invader31x+(407*s), invader31y+(170*s));
        vertex(invader31x+(416*s), invader31y+(170*s));
        vertex(invader31x+(415*s), invader31y+(197*s));
        vertex(invader31x+(399*s), invader31y+(197*s));
        vertex(invader31x+(398*s), invader31y+(203*s));
        vertex(invader31x+(407*s), invader31y+(204*s));
        vertex(invader31x+(407*s), invader31y+(213*s));
        vertex(invader31x+(399*s), invader31y+(213*s));
        vertex(invader31x+(398*s), invader31y+(222*s));
        vertex(invader31x+(381*s), invader31y+(221*s));
        vertex(invader31x+(381*s), invader31y+(213*s));
        vertex(invader31x+(389*s), invader31y+(213*s));
        vertex(invader31x+(389*s), invader31y+(205*s));
        vertex(invader31x+(373*s), invader31y+(205*s));
        vertex(invader31x+(373*s), invader31y+(213*s));
        vertex(invader31x+(356*s), invader31y+(213*s));
        vertex(invader31x+(355*s), invader31y+(204*s));
        vertex(invader31x+(340*s), invader31y+(204*s));
        vertex(invader31x+(339*s), invader31y+(212*s));
        vertex(invader31x+(348*s), invader31y+(213*s));
        vertex(invader31x+(348*s), invader31y+(221*s));
        vertex(invader31x+(330*s), invader31y+(221*s));
        vertex(invader31x+(330*s), invader31y+(213*s));
        vertex(invader31x+(322*s), invader31y+(213*s));
        vertex(invader31x+(321*s), invader31y+(204*s));
        vertex(invader31x+(330*s), invader31y+(204*s));
        vertex(invader31x+(330*s), invader31y+(196*s));
        endShape();
        fill(#000000);
        beginShape();
        vertex(invader31x+(357*s), invader31y+(204*s));
        vertex(invader31x+(373*s), invader31y+(204*s));
        vertex(invader31x+(372*s), invader31y+(196*s));
        vertex(invader31x+(356*s), invader31y+(196*s));
        endShape();
        beginShape();
        vertex(invader31x+(340*s), invader31y+(187*s));
        vertex(invader31x+(340*s), invader31y+(180*s));
        vertex(invader31x+(356*s), invader31y+(180*s));
        vertex(invader31x+(356*s), invader31y+(186*s));
        endShape();
        beginShape();
        vertex(invader31x+(373*s), invader31y+(187*s));
        vertex(invader31x+(373*s), invader31y+(179*s));
        vertex(invader31x+(389*s), invader31y+(179*s));
        vertex(invader31x+(389*s), invader31y+(187*s));
        endShape();
      }
    }
    if (time2==99) {
      page=1;
      q=1;
    }
  }
}
class Invader4 {
  float invader4x=0;
  float invader4y=0;
  float s=0.75;
  float x, y;
  int time=0;
  float vx=2;
  int pose=1;
  int shot=2;
  int go=0;
  int hop=0;
  float bx=-10;
  float by=-10;
  int q=1;


  void setVars(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void drawAndMove() {
    if (q==1) {
      if (dist(bux, buy, x, y)<30+5) {
        start=0;
        q=2;
        win+=1;
        buy=-10;
      }
      fill(#FFFFFF);
      shot=(int)random(1000);
      if (shot==1) {
        if (go==0) {
          go=1;
        }
      }

      if (go==1) {
        bx=x;
        by=y;
        hop=1;
        go=0;
      }
      if (hop==1) {
        shot=1;
        by=by+2;
      }
      if (by>510) {
        hop=0;
      }
      ellipse(bx, by, 10, 10);
      fill(#ffff00);
      if (dist(hx, hy, bx, by)<25) {
        page=1;
        by=100;
        q=1;
      }
      //helper box

      //ellipse(x, y, 60, 60);

      invader4x=x-260;
      invader4y=y-210;

      time=time+1;
      if (time>20) {

        if (vx==2) {
          vx=-2;
        }
        else if (vx==-2) {
          vx=2;
        }
        time=0;
      }
      x=x+vx;
      if (pose==1) {
        ///////////////////////SPACE INVADER 4
        fill(#ffffff);
        beginShape();
        vertex(invader4x+(271*s), invader4y+(297*s));
        vertex(invader4x+(271*s), invader4y+(289*s));
        vertex(invader4x+(279*s), invader4y+(289*s));
        vertex(invader4x+(280*s), invader4y+(281*s));
        vertex(invader4x+(287*s), invader4y+(280*s));
        vertex(invader4x+(288*s), invader4y+(272*s));
        vertex(invader4x+(296*s), invader4y+(272*s));
        vertex(invader4x+(296*s), invader4y+(264*s));
        vertex(invader4x+(313*s), invader4y+(263*s));
        vertex(invader4x+(313*s), invader4y+(255*s));
        vertex(invader4x+(365*s), invader4y+(255*s));
        vertex(invader4x+(364*s), invader4y+(263*s));
        vertex(invader4x+(381*s), invader4y+(264*s));
        vertex(invader4x+(382*s), invader4y+(271*s));
        vertex(invader4x+(390*s), invader4y+(272*s));
        vertex(invader4x+(390*s), invader4y+(280*s));
        vertex(invader4x+(400*s), invader4y+(281*s));
        vertex(invader4x+(399*s), invader4y+(281*s));
        vertex(invader4x+(398*s), invader4y+(288*s));
        vertex(invader4x+(407*s), invader4y+(289*s));
        vertex(invader4x+(407*s), invader4y+(298*s));
        vertex(invader4x+(390*s), invader4y+(298*s));
        vertex(invader4x+(389*s), invader4y+(306*s));
        vertex(invader4x+(382*s), invader4y+(306*s));
        vertex(invader4x+(382*s), invader4y+(315*s));
        vertex(invader4x+(373*s), invader4y+(315*s));
        vertex(invader4x+(373*s), invader4y+(306*s));
        vertex(invader4x+(365*s), invader4y+(306*s));
        vertex(invader4x+(364*s), invader4y+(298*s));
        vertex(invader4x+(348*s), invader4y+(298*s));
        vertex(invader4x+(348*s), invader4y+(306*s));
        vertex(invader4x+(331*s), invader4y+(306*s));
        vertex(invader4x+(330*s), invader4y+(306*s));
        vertex(invader4x+(329*s), invader4y+(298*s));
        vertex(invader4x+(314*s), invader4y+(297*s));
        vertex(invader4x+(313*s), invader4y+(307*s));
        vertex(invader4x+(305*s), invader4y+(307*s));
        vertex(invader4x+(305*s), invader4y+(315*s));
        vertex(invader4x+(296*s), invader4y+(314*s));
        vertex(invader4x+(296*s), invader4y+(306*s));
        vertex(invader4x+(288*s), invader4y+(306*s));
        vertex(invader4x+(287*s), invader4y+(298*s));
        vertex(invader4x+(270*s), invader4y+(297*s));
        endShape();
        fill(#000000);
        beginShape();
        vertex(invader4x+(297*s), invader4y+(289*s));
        vertex(invader4x+(297*s), invader4y+(281*s));
        vertex(invader4x+(304*s), invader4y+(281*s));
        vertex(invader4x+(305*s), invader4y+(289*s));
        endShape();
        beginShape();
        vertex(invader4x+(322*s), invader4y+(289*s));
        vertex(invader4x+(322*s), invader4y+(282*s));
        vertex(invader4x+(329*s), invader4y+(281*s));
        vertex(invader4x+(330*s), invader4y+(289*s));
        endShape();
        beginShape();
        vertex(invader4x+(348*s), invader4y+(289*s));
        vertex(invader4x+(348*s), invader4y+(281*s));
        vertex(invader4x+(355*s), invader4y+(281*s));
        vertex(invader4x+(356*s), invader4y+(289*s));
        endShape();
        beginShape();
        vertex(invader4x+(373*s), invader4y+(289*s));
        vertex(invader4x+(373*s), invader4y+(281*s));
        vertex(invader4x+(380*s), invader4y+(281*s));
        vertex(invader4x+(381*s), invader4y+(288*s));
        endShape();
      }
    }
    if (time2==99) {
      page=1;
      q=1;
    }
  }
}


