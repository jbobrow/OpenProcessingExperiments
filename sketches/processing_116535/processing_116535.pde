
float bomberX=115, bomberY=100;
float megaX=100, megaY=400;
float jump=0;
float megaYV=20;
float pos=0;
float SX=0, SY=0;
PFont myFont = createFont("Verdana", 12);
float eX=0, eY=0;
float theta=0;
float flip=1;
float bX=0, bY=0;
float b2X=0, b2Y=-10, b3X=0, b3Y=-5, b4X=0, b4Y=-20, b5X=0, b5Y=-15;
float pX=200, pY=350;
float pVX=5;
float p2X=600;
float p2Y=350;
float p2VY=5;
float  aX=0, aY=0, a2X=0, a2Y=0, a3X=0, a3Y=0, a4X=0, a4Y=0;
float attack=0;
float attack2=0;
float attack3=0;
float attack4=0;
float attack5=0;
float attack6=0;
float attack7=0;
float attack8=0;
float attack9=0;
float attack10=0;
float attack11=0;
float attack12=0;
float attack13=0;
float attack14=0;
float  a5X=0;
float  a5Y=0;
float  a6X=0;
float  a6Y=0;
float  a7X=0;
float  a7Y=0;
float  a8X=0;
float  a8Y=0;
float  a9X=0;
float  a9Y=0;
float X=0;
float Y=0;
float X2=0;
float Y2=0;
float X3=0;
float Y3=0;
float X4=0;
float Y4=0;
float X5=0;
float Y5=0;
float level=0;
int drag=0;
int  keyX=30;
int  keyY=470;
int r = 0;
int u=0;
int l=0;
int shoot=0;
float b=0;

void setup() {
  size(800, 500);
  frameRate(30);
}
float grav = .8;
void draw() {
  if (level==0) {
    theta=theta+0.1;
    background(#000000);
    fill(#A79898);
    textFont(myFont, 200);
    text("MEGA", 100, 180+5*sin(theta));
    text("MAN", 160, 340+5*sin(theta));
    fill(#FFFFFF);
    textFont(myFont, 20);
    text("Press to Start", 330+5*sin(theta), 450);
  }
  if (level==2) {
    background(#62831C);
    //MEGAMAN
    //helper box
    //rect(megaX-20,megaY-12,40,70);
    if (shoot==1) {
      fill(#FFEFCE);
      ellipse(SX, SY, 10, 10);
      if (flip==1) {
        SX=SX+10;
      }
      if (flip==-1) {
        SX=SX-10;
      }
    }
    if (SX>805) {
      shoot=0;
    }
    if (SX<-5) {
      shoot=0;
    }
    if (pos==0) 
      pose0();
    else if (pos==1) 
      pose1();
    else if (pos==2)
      pose1();
    else if (pos==3)
      pose0();
    else if (pos==4) 
      pose4();
    //platform
    fill(#35831C);
    rect(0, 460, 200, 100);
    rect(200, 350, 700, 500);
    //enemy
    fill(color(random(256), (256), random(256)));
    ellipse(eX, eY, 50, 50);
    theta=theta+0.1;
    eX=500+70*cos(theta);
    eY=300+30*sin(theta);
    //shhoting
    if (dist(SX, SY, eX, eY)<5+25) {
      attack=1;
    }
    if (attack==1) {
      eX=-1000;
    }
    //collision
    if (dist(megaX, megaY, eX, eY)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(aX, aY, 50, 50);
    theta=theta+0.1;
    aX=700+30*cos(theta);
    aY=300+30*sin(theta);
    //shhoting
    if (dist(SX, SY, aX, aY)<5+25) {
      attack2=2;
    }
    if (attack2==2) {
      aX=-1000;
    }
    //collision
    if (dist(megaX, megaY, aX, aY)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(a3X, a3Y, 50, 50);
    theta=theta+0.1;
    a3X=300+10*cos(theta);
    a3Y=300+100*sin(theta);
    //shhoting
    if (dist(SX, SY, a3X, a3Y)<5+25) {
      attack3=3;
    }
    if (attack3==3) {
      a3X=-1000;
    }
    //collision
    if (dist(megaX, megaY, a3X, a3Y)<15+25) {
      level=0;
      megaX=100;
    }
    if (jump==1) {
      megaY+=megaYV - grav/2;
      megaYV += grav;
    }
    if (megaY>= 400) {
      megaY=400;
      megaYV=0;
      jump=0;
    }
    if (megaX>=0&&megaX<=200&&megaY<= 290) {
      jump=1;
    }
    if (megaY>= 290&& megaX>=200 && megaX<=800 &&jump==1) {
      megaY=290;
      megaYV=0;
      jump=0;
    }
    //running
    if (pos>=3) {
      pos=0;
    }
    if (r == 1) {
      megaX=megaX+8;
      pos=pos+1;   
      flip=1;
    }
    if (l==1) {
      megaX = megaX - 8;
      pos = pos + 1;
      flip = -1;
    }
    if (u==1) {
      pos = 4;
    }
    //boundary
    if (megaX <= 0) {
      megaX=0;
    }
    else if (megaX >= 800) {
      megaX = 800;
    }
    else if (megaY>=300 && megaX>=200) {
      megaX=199;
    }
    //next level door
    fill(#F2DB07);
    rect(750, 270, 50, 80);
    //next level
    if (megaX>760) {
      level=3;
      megaX=20;
    }
  }
  if (level==1) {
    theta=theta+0.1;
    background(#000000);
    fill(#B7FFFB);
    textFont(myFont, 50);
    text("Instructions", 220, 50+5*cos(theta));
    textFont(myFont, 15);
    text("It is your duty to help MEGAMAN defeat the evil forces once again", 45, 100+5*sin(theta));
    fill(#FFFFFF);
    text("Use your left and right arrow keys to move MEGAMAN", 45-5*sin(theta), 150);
    text("Use your up arrow key to move MEGAMAN up", 45-5*sin(theta), 165);
    text("Use your space bar to shoot", 45-5*sin(theta), 180);
    text("Use your mouse to drag the key to unlock the door", 45-5*sin(theta), 195);
    fill(#D6D6D6);
    text("Press to start", 45+5*sin(theta), 450);
  }
  if (level==3) {
    background(#D3A644);
    //MEGAMAN
    //helper box
    //rect(megaX-20,megaY-12,40,70);
    if (shoot==1) {
      fill(#FFEFCE);
      ellipse(SX, SY, 10, 10);
      if (flip==1) {
        SX=SX+10;
      }
      if (flip==-1) {
        SX=SX-10;
      }
    }
    if (SX>805) {
      shoot=0;
    }
    if (SX<-5) {
      shoot=0;
    }
    if (pos==0) 
      pose0();
    else if (pos==1) 
      pose1();
    else if (pos==2)
      pose1();
    else if (pos==3)
      pose0();
    else if (pos==4) 
      pose4();
    else if (pos==4) 
      pose4();
    //platform
    fill(#AF7825);
    rect(000, 350, 1000, 500);
    //falling boulders
    fill(#A56C11);
    //movement 
    theta=theta+0.1;
    //shhoting
    ellipse(bX, bY, 20, 20);
    bX=500+10*cos(theta);
    bY=bY+10;
    if (bY>520) {
      bY=-10;
    }
    if (dist(SX, SY, bX, bY)<10+5) {
      attack10=1;
    }    
    if (attack10==1) {
      bX=-1000;
    }
    if (dist(megaX, megaY, bX, bY)<10+15) {
      megaX=100;
      level=0;
    }
    /////////////// 
    ellipse(b2X, b2Y, 10, 10); 
    b2X=170+5*sin(theta);
    b2Y=b2Y+5;
    if (b2Y>520) {
      b2Y=-10;
    }
    if (dist(SX, SY, b2X, b2Y)<5+5) {
      attack11=1;
    }  
    if (attack11==1) {
      b2X=-1000;
    }
    if (dist(megaX, megaY, b2X, b2Y)<5+15) {
      megaX=100;
      level=0;
    }
    /////////////
    ellipse(b3X, b3Y, 30, 30);
    b3X=300+20*cos(theta);
    b3Y=b3Y+10;
    if (b3Y>520) {
      b3Y=-10;
    }
    if (dist(SX, SY, b3X, b3Y)<15+5) {
      attack12=1;
    }  
    if (attack12==1) {
      b3X=-1000;
    }
    if (dist(megaX, megaY, b3X, b3Y)<15+15) {
      megaX=100;
      level=0;
    } 
    //////////////
    ellipse(b4X, b4Y, 35, 35);
    b4X=400+30*sin(theta);
    b4Y=b4Y+25;
    if (b4Y>520) {
      b4Y=-10;
    }
    if (dist(SX, SY, b4X, b4Y)<17.5+5) {
      attack13=1;
    }    
    if (attack13==1) {
      b4X=-1000;
    }
    if (dist(megaX, megaY, b4X, b4Y)<17.5+15) {
      megaX=100;
      level=0;
    }   
    /////////////////
    ellipse(b5X, b5Y, 25, 25);
    b5X=600+40*cos(theta);
    b5Y=b5Y+23;
    if (b5Y>520) {
      b5Y=-10;
    }
    if (dist(SX, SY, b5X, b5Y)<12.5+5) {
      attack14=1;
    }   
    if (attack14==1) {
      b5X=-1000;
    }
    if (dist(megaX, megaY, b5X, b5Y)<12.5+15) {
      megaX=100;
      level=0;
    } 
    if (jump==1) {
      megaY+=megaYV - grav/2;
      megaYV += grav;
    }
    if (megaY>= 400) {
      megaY  = 400;
      megaYV = 0;
      jump   = 0;
    }
    if (megaY >= 290 && megaX >= 0 && megaX <= 800 && jump == 1) {
      megaY  = 290;
      megaYV = 0;
      jump   = 0;
    }
    //running
    if (pos>=3) {
      pos=0;
    }
    if (r == 1) {
      megaX=megaX+8;
      pos=pos+1;   
      flip=1;
    }
    if (l==1) {
      megaX=megaX-8;
      pos=pos+1;
      flip=-1;
    }
    if (u==1) {
      pos=4;
    }
    //boundary
    if (megaX<=0) {
      megaX=0;
    }
    if (megaX>=800) {
      megaX=800;
    }
    if (megaY>=300 && megaX>=200) {
      megaX=199;
    }
    //next level door
    fill(#F2DB07);
    rect(750, 270, 50, 80);
    //next level
    if (megaX>760) {
      level=4;
      megaX=100;
    }
  }
  if (level==4) {
    background(#C9635F);
    fill(#A71C18);
    rect(0, 350, 200, 150);
    rect(600, 350, 200, 150);
    //MEGAMAN
    //helper box
    //rect(megaX-20,megaY-12,40,70);
    if (shoot==1) {
      fill(#FFEFCE);
      ellipse(SX, SY, 10, 10);
      if (flip==1) {
        SX=SX+10;
      }
      if (flip==-1) {
        SX=SX-10;
      }
    }
    if (SX>805) {
      shoot=0;
    }
    if (SX<-5) {
      shoot=0;
    }
    if (pos==0) 
      pose0();
    else if (pos==1) 
      pose1();
    else if (pos==2)
      pose1();
    else if (pos==3)
      pose0();
    else if (pos==4) 
      pose4();
    else if (pos==4) 
      pose4();
    if (jump==1) {
      megaY+=megaYV - grav/2;
      megaYV += grav;
    }
    if (megaY>= 290&& megaX>=000 && megaX<=200 &&jump==1) {
      megaY=290;
      megaYV=0;
      jump=0;
    }
    if (megaY>= 290&& megaX>=600 && megaX<=800 &&jump==1) {
      megaY=290;
      megaYV=0;
      jump=0;
    }
    //falling down
    if (megaX>200&&megaX<600&&megaY==290) {
      jump=1;
    }
    if (megaY>520) {
      level=0;
      megaY=300;
      megaX=100;
    }
    //moving platform
    fill(#A71C18);
    rect(pX, pY, 100, 30);
    pX=pX+pVX;

    if (pX==500) {
      pVX=-5;
    }
    if (pX==200) {
      pVX=5;
    }
    if (megaX>pX&&megaX<pX+100&&megaY>280&&megaY<300) {
      jump=0;
      megaY=290;
      megaX=pX+50;
    }
    //enemy
    fill(color((256), random(256), random(256)));
    ellipse(a4X, a4Y, 50, 50);
    theta=theta+0.1;
    a4X=500+70*sin(theta);
    a4Y=300+30*sin(theta);
    //shhoting
    if ( dist(SX, SY, a4X, a4Y) < 5+25) {
      attack4=3;
    }
    if (attack4==3) {
      a4X=-1000;
    }
    //collision
    if (dist(megaX, megaY, a4X, a4Y)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(a5X, a5Y, 50, 50);  
    theta=theta+0.1;
    a5X=700+10*cos(theta);
    a5Y=300+70*sin(theta);
    //shhoting
    if (dist(SX, SY, a5X, a5Y)<5+25) {
      attack5=3;
    }
    if (attack5 == 3) {
      a5X = -1000;
    }
    //collision
    if (dist(megaX, megaY, a5X, a5Y)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(a6X, a6Y, 50, 50);
    theta=theta+0.1;
    a6X=300+10*sin(theta*5);
    a6Y=300+100*cos(theta);

    //shhoting
    if (dist(SX, SY, a6X, a6Y)<5+25) {
      attack6=3;
    }
    if (attack6==3) {
      a6X=-1000;
    }
    //collision
    if (dist(megaX, megaY, a6X, a6Y)<15+25) {
      level=0;
      megaX=100;
    }
    //running
    if (pos>=3) {
      pos=0;
    }
    if (r == 1) {
      megaX=megaX+8;
      pos=pos+1;   
      flip=1;
    }
    if (l==1) {
      megaX=megaX-8;
      pos=pos+1;
      flip=-1;
    }
    if (u==1) {
      pos=4;
    }
    //boundary
    if (megaX<=0) {
      megaX=0;
    }
    if (megaX>=800) {
      megaX=800;
    }
    //next level door
    fill(#F2DB07);
    rect(750, 270, 50, 80);
    //next level
    if (megaX>760) {
      level=5;
      megaX=100;
    }
  }
  if (level==5) {
    background(#657CC9);
    //MEGAMAN
    //helper box
    //rect(megaX-20,megaY-12,40,70);
    if (shoot==1) {
      fill(#FFEFCE);
      ellipse(SX, SY, 10, 10);
      if (flip==1) {
        SX=SX+10;
      }
      if (flip==-1) {
        SX=SX-10;
      }
    }
    if (SX>805) {
      shoot=0;
    }
    if (SX<-5) {
      shoot=0;
    }
    if (pos==0) 
      pose0();
    else if (pos==1) 
      pose1();
    else if (pos==2)
      pose1();
    else if (pos==3)
      pose0();
    else if (pos==4) 
      pose4();
    else if (pos==4) 
      pose4();
    //platform
    fill(#2C82F0);
    rect(000, 350, 200, 500);
    rect(200, 460, 800, 800);
    if (megaY>=360&&megaX<=200) {
      megaX=200;
    }
    //enemy
    fill(#00FF00);
    ellipse(eX, eY, 50, 50);
    theta=theta+0.1;
    eX=500+70*cos(theta);
    eY=300+30*sin(theta);
    //shhoting
    if (dist(SX, SY, eX, eY)<5+25) {
      attack=1;
    }
    if (attack==1) {
      eX=-1000;
    }
    //colission
    if (dist(megaX, megaY, eX, eY)<15+25) {
      level=0;
      megaX=100;
    }
    if (jump==1) {
      megaY+=megaYV - grav/2;
      megaYV += grav;
    }
    if (megaY>= 400) {
      megaY=400;
      megaYV=0;
      jump=0;
    }
    if (megaX>=200&&megaX<=800&&megaY<= 290) {
      jump=1;
    }
    if (megaY>= 290&& megaX>=000 && megaX<=200 &&jump==1) {
      megaY=290;
      megaYV=0;
      jump=0;
    }
    //running
    if (pos>=3) {
      pos=0;
    }
    if (r == 1) {
      megaX=megaX+8;
      pos=pos+1;   
      flip=1;
    }
    if (l==1) {
      megaX=megaX-8;
      pos=pos+1;
      flip=-1;
    }
    if (u==1) {
      pos=4;
    }
    //boundary
    if (megaX<=0) {
      megaX=0;
    }
    if (megaX>=800) {
      megaX=800;
    }
    //enemy
    fill(color(random(256), random(256), (256)));
    ellipse(a7X, a7Y, 50, 50);
    theta=theta+0.1;
    a7X=500+70*cos(theta/2);
    a7Y=350+30*sin(theta*2);
    //shhoting
    if ( dist(SX, SY, a7X, a7Y) < 5+25) {
      attack7=3;
    }
    if (attack7==3) {
      a7X=-1000;
    }
    //collision
    if (dist(megaX, megaY, a7X, a7Y)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(a8X, a8Y, 50, 50);  
    theta=theta+0.1;
    a8X=700+30*cos(theta+0.5);
    a8Y=350+60*sin(theta);
    //shhoting
    if (dist(SX, SY, a8X, a8Y)<5+25) {
      attack8=3;
    }
    if (attack8 == 3) {
      a8X = -1000;
    }
    //collision
    if (dist(megaX, megaY, a8X, a8Y)<15+25) {
      level=0;
      megaX=100;
    }
    ellipse(a9X, a9Y, 50, 50);
    theta=theta+0.1;
    a9X=300+10*cos(theta);
    a9Y=370+100*sin(theta);
    //shhoting
    if (dist(SX, SY, a9X, a9Y)<5+25) {
      attack9=3;
    }
    if (attack9==3) {
      a9X=-1000;
    }
    //collision
    if (dist(megaX, megaY, a9X, a9Y)<15+25) {
      level=0;
      megaX=100;
    }
    //next level door
    fill(#F2DB07);
    rect(750, 380, 50, 80);
    //next level
    if (megaX>760) {
      level=6;
      megaX=100;
    }
  }
  if (level==6) {
    background(#FFFFFF);
    //hole
    fill(#AFAFAF);
    rect(770-10, 110-100, 33, 10);
    rect(770-10, 110-80, 28, 10);
    rect(770-10, 110, 13, -100);
    ellipse(770, 110, 50, 50);
    fill(#FFFFFF);
    ellipse(770, 110, 35, 35);
    noStroke();
    fill(#FFE02E);
    rect(keyX-10, keyY-100, 33, 10);
    rect(keyX-10, keyY-80, 28, 10);
    rect(keyX-10, keyY, 13, -100);
    ellipse(keyX, keyY, 50, 50);
    fill(#FFFFFF);
    ellipse(keyX, keyY, 35, 35);
    //placement
    if (dist(keyX, keyY, 770, 110)<8) {
      keyX=770;
      keyY=110;
    }
    if (drag==1) {
      keyX=mouseX;
      keyY=mouseY;
    }
    //bad objects
    fill(color(random(256)));
    ellipse(X, Y, 40, 40);
    ellipse(X2, Y2, 40, 40);
    ellipse(X3, Y3, 40, 40);
    ellipse(X4, Y4, 40, 40);
    ellipse(X5, Y5, 40, 40);
    //collisions
    if (dist(keyX, keyY, X, Y)<20+25) {
      keyX=30;
      keyY=470;
      drag=0;
    }
    if (dist(keyX, keyY, X2, Y2)<20+25) {
      keyX=30;
      keyY=470;
      drag=0;
    }
    if (dist(keyX, keyY, X3, Y3)<20+25) {
      keyX=30;
      keyY=470;
      drag=0;
    }
    if (dist(keyX, keyY, X4, Y4)<20+25) {
      keyX=30;
      keyY=470;
      drag=0;
    }
    if (dist(keyX, keyY, X5, Y5)<20+25) {
      keyX=30;
      keyY=470;
      drag=0;
    }
    //boundary
    if (keyX<25) {
      keyX=25;
    }
    if (keyX>775) {
      keyX=775;
    }
    if (keyY>475) {
      keyY=475;
    }
    if (keyY<100) {
      keyY=100;
    }
    theta=theta+0.1;
    X=200+100*cos(theta*2);
    Y=350+100*sin(theta);
    X2=600+100*sin(theta);
    Y2=200+50*sin(theta);
    X3=200+10*sin(cos(theta));
    Y3=300+100*tan(theta);
    X4=700+500*cos(theta);
    Y4=400+100*sin(theta);
    X5=500+100*cos(theta);
    Y5=300+400*cos(theta);
    //next level
    if (keyX==770&&keyY==110) {
      level=7;
    }
  }
  if (level==7) {
    background(#959595);
    //platform
    fill(#2C2C2C);
    rect(0, 460, 800, 800);
    //MEGAMAN
    //helper box
    //rect(megaX-20,megaY-12,40,70);
    if (shoot==1) {
      fill(#FFEFCE);
      ellipse(SX, SY, 10, 10);
      if (flip==1) {
        SX=SX+10;
      }
      if (flip==-1) {
        SX=SX-10;
      }
    }
    if (SX>805) {
      shoot=0;
    }
    if (SX<-5) {
      shoot=0;
    }
    //position
    if (pos==0) 
      pose0();
    else if (pos==1) 
      pose1();
    else if (pos==2)
      pose1();
    else if (pos==3)
      pose0();
    else if (pos==4) 
      pose4();
    else if (pos==4) 
      pose4();
    //boss
    bomberY=400+50*cos(theta*2);
    bomberX=500+210*sin(theta);
    theta=theta+0.1;
    //defeat
    if (dist(SX, SY, bomberX, bomberY)<5+40) {
      b=b+1;
    }
    if (b>7) {
      bomberX=-1000;
    }
    if (b==0) {
      fill(#00FF00);
      rect(300, 20, 100, 20);
    }
    if (b>0&&b<=4) {
      fill(#FFFF00);
      rect(300, 20, 60, 20);
    }
    if (b>4&&b<=7) {
      fill(#FF0000);
      rect(300, 20, 30, 20);
    }
    //next level
    if (bomberX==-1000) {
      level=8;
    }
    //nose
    fill(#B4B4B4);
    triangle(bomberX-70, bomberY-50, bomberX-54, bomberY-60, bomberX-54, bomberY-40);
    //tail
    fill(#7D5F93); 
    ellipse(bomberX+45, bomberY-50, 50, 10);
    //red triangle
    fill(#FF1C1C);
    triangle(bomberX+30, bomberY-80, bomberX+30, bomberY-60, bomberX+65, bomberY-80);
    triangle(bomberX+30, bomberY-20, bomberX+30, bomberY-40, bomberX+65, bomberY-20);
    //body
    fill(#7D5F93); 
    ellipse(bomberX-5, bomberY-50, 100, 80);
    //skull
    fill(#FAE467);
    ellipse(bomberX-5, bomberY-50, 50, 50);
    //eyes
    fill(#000000);
    ellipse(bomberX-15, bomberY-50, 10, 10);
    ellipse(bomberX+5, bomberY-50, 10, 10);
    //teeth
    noStroke();
    fill(#7D5F93); 
    triangle(bomberX-12, bomberY-40, bomberX-22, bomberY-20, bomberX-12, bomberY-20);
    triangle(bomberX+2, bomberY-40, bomberX+12, bomberY-20, bomberX+2, bomberY-20);
    //collision
    if (dist(megaX, megaY, bomberX, bomberY)<15+50) {
      level=0;
    }
    if (jump==1) {
      megaY+=megaYV - grav/2;
      megaYV += grav;
    }

    if (megaY>= 400) {
      megaY=400;
      megaYV=0;
      jump=0;
    }
    if (megaX>=0&&megaX<=000&&megaY<= 290) {
      jump=1;
    }
    //running
    if (pos>=3) {
      pos=0;
    }
    if (r == 1) {
      megaX=megaX+8;
      pos=pos+1;   
      flip=1;
    }
    if (l==1) {
      megaX=megaX-8;
      pos=pos+1;
      flip=-1;
    }
    if (u==1) {
      pos=4;
    }
    //boundary
    if (megaX<=0) {
      megaX=0;
    }
    if (megaX>=800) {
      megaX=800;
    }
  }
  if (level==8) {
    background(#000000);
    textFont(myFont, 155);
    fill(color(random(256), random(256), random(256)));
    theta=theta+0.05;
    text("MEGAMAN", -5-5*cos(theta), 200-5*sin(theta));
    text("WINS!", 160-5*cos(theta), 400-5*sin(theta));
  }
}
void keyPressed() {
  if (keyCode == RIGHT && r == 0) {
    r = 1;
  }
  if (keyCode == LEFT) {
    l=1;
  }
  if (keyCode == UP && jump==0) {
    u=1;
    jump=1;
    pos=4;
    megaYV=-15;
  }
  if (key == ' ') {
    shoot=1;
    SX=megaX+10;
    SY=megaY+15;
  }
}
void keyReleased() {
  r = 0;
  u=0;
  l=0;
  pos=0;
}
void mousePressed() {
  if (level==0) {
    level=1;
  }
  else if (level==1) {
    level=2;
  }
  if (mouseX>keyX-10&&mouseX<keyX-10+33&&mouseY>keyY-100&&mouseY<keyY-100+10) {
    drag=1;
  }
  if (mouseX>keyX-10&&mouseX<keyX-10+28&&mouseY>keyY-80&&mouseY<keyY-80+10) {
    drag=1;
  }
  if (mouseX>keyX-10&&mouseX<keyX-10+13&&mouseY<keyY&&mouseY>keyY-100) {
    drag=1;
  }
  if (dist(mouseX, mouseY, keyX, keyY)<25) {
    drag=1;
  }
}
void mouseReleased() {
  drag=0;
}
/////////////////////////////////////////////////////////////////////////
//pose 0
void pose0()
{
  fill(#3EBDFF);
  //legs
  ellipse(megaX-9*flip, megaY+45, 9, 20);
  ellipse(megaX+9*flip, megaY+45, 9, 20);
  //arms
  ellipse(megaX-15*flip, megaY+14, 30, 6);
  ellipse(megaX+15*flip, megaY+15, 30, 6);
  //body
  noStroke();
  rect(megaX-13, megaY+10, 25, 30);
  stroke(5);
  //hand
  fill(#005FFF);
  ellipse(megaX-26*flip, megaY+20, 6, 19);
  ellipse(megaX+28*flip, megaY+15, 8, 10);
  ellipse(megaX+34*flip, megaY+15, 8, 5);
  //feet
  ellipse(megaX-12*flip, megaY+55, 14, 9);
  ellipse(megaX+12*flip, megaY+55, 14, 9);
  //head
  fill(#005FFF);
  ellipse(megaX, megaY, 30, 30);
  //underwear
  triangle(megaX, megaY+40, megaX-13*flip, megaY+30, megaX+13*flip, megaY+30);
  //face
  fill(#FFDAB9);
  ellipse(megaX+4*flip, megaY+2, 20, 20);
  //eye
  noStroke();
  fill(#FFFFFF);
  ellipse(megaX+1*flip, megaY-1, 9, 9);
  ellipse(megaX+9*flip, megaY-1, 9, 9);
  fill(#000000);
  ellipse(megaX+2*flip, megaY-1, 4, 4.5);
  ellipse(megaX+9*flip, megaY-1, 4, 4.5);
  stroke(5);
  //mouth
  ellipse(megaX+5*flip, megaY+7, 8, 2);
  //ear
  fill(#3EBDFF);
  ellipse(megaX-14*flip, megaY-1, 5, 7);
  //weird thing on head
  ellipse(megaX, megaY-12.5, 20, 3.7);
  return;
}
void pose1()
{
  fill(#3EBDFF);
  //legs
  ellipse(megaX-9*flip, megaY+40, 9, 10);
  ellipse(megaX-13*flip, megaY+45, 14, 9);
  ellipse(megaX+9*flip, megaY+40, 13, 9);
  ellipse(megaX+14*flip, megaY+45, 9, 13);
  //arms
  ellipse(megaX-15*flip, megaY+14, 30, 6);
  ellipse(megaX+15*flip, megaY+15, 30, 6);
  //body
  noStroke();
  rect(megaX-13, megaY+10, 25, 30);
  stroke(5);
  //hand
  fill(#005FFF);
  ellipse(megaX-26*flip, megaY+20, 6, 19);
  ellipse(megaX+28*flip, megaY+15, 8, 10);
  ellipse(megaX+34*flip, megaY+15, 8, 5);
  //feet
  ellipse(megaX-19*flip, megaY+50, 9, 14);
  ellipse(megaX+18*flip, megaY+55, 14, 9);
  //head
  fill(#005FFF);
  ellipse(megaX, megaY, 30, 30);
  //underwear
  triangle(megaX, megaY+40, megaX-13*flip, megaY+30, megaX+13*flip, megaY+30);
  //face
  fill(#FFDAB9);
  ellipse(megaX+4*flip, megaY+2, 20, 20);
  //eye
  noStroke();
  fill(#FFFFFF);
  ellipse(megaX+1*flip, megaY-1, 9, 9);
  ellipse(megaX+9*flip, megaY-1, 9, 9);
  fill(#000000);
  ellipse(megaX+2*flip, megaY-1, 4, 4.5);
  ellipse(megaX+9*flip, megaY-1, 4, 4.5);
  stroke(5);
  //mouth
  ellipse(megaX+5*flip, megaY+7, 8, 2);
  //ear
  fill(#3EBDFF);
  ellipse(megaX-14*flip, megaY-1, 5, 7);
  //weird thing on head
  ellipse(megaX, megaY-12.5, 20, 3.7);
  return;
}
void pose4()
{
  fill(#3EBDFF);
  //legs
  ellipse(megaX-9*flip, megaY+45, 9, 20);
  ellipse(megaX+9*flip, megaY+45, 9, 20);
  //arms
  ellipse(megaX-15*flip, megaY+14, 30, 6);
  ellipse(megaX+15*flip, megaY+15, 30, 6);
  //body
  noStroke();
  rect(megaX-13, megaY+10, 25, 30);
  stroke(5);
  //hand
  fill(#005FFF);
  ellipse(megaX-26*flip, megaY+7, 6, 19);
  ellipse(megaX+28*flip, megaY+15, 8, 10);
  ellipse(megaX+34*flip, megaY+15, 8, 5);
  //feet
  ellipse(megaX-12*flip, megaY+55, 14, 9);
  ellipse(megaX+12*flip, megaY+55, 14, 9);
  //head
  fill(#005FFF);
  ellipse(megaX, megaY, 30, 30);
  //underwear
  triangle(megaX, megaY+40, megaX-13*flip, megaY+30, megaX+13*flip, megaY+30);
  //face
  fill(#FFDAB9);
  ellipse(megaX+4*flip, megaY+2, 20, 20);
  //eye
  noStroke();
  fill(#FFFFFF);
  ellipse(megaX+1*flip, megaY-1, 9, 9);
  ellipse(megaX+9*flip, megaY-1, 9, 9);
  fill(#000000);
  ellipse(megaX+2*flip, megaY-1, 4, 4.5);
  ellipse(megaX+9*flip, megaY-1, 4, 4.5);
  stroke(5);
  //mouth
  ellipse(megaX+5*flip, megaY+7, 8, 2);
  //ear
  fill(#3EBDFF);
  ellipse(megaX-14*flip, megaY-1, 5, 7);
  //weird thing on head
  ellipse(megaX, megaY-12.5, 20, 3.7);
  return;
}


