
// Written by. Min-Woo, Choo
// 2014.10.01~08
// 630 Lines Code

// MATH&VISUAL ARTS - GAME
// I USED PHYSICS FORMULA & TRIGONOMETRIC FUNCTION

// g=9.8m/s^2, m=1kg h=1.2m(height=1200px)
// maximum J=11.76J(W[J]=mgh)
// VACUOUS=NO FRICTION(AIR)
float m=1, g=9.8, h=1.2;

float uX=0, tX1=300, tY1=0, tX2=300, tY2=300;
float tX3=900, tY3=0;
boolean click=false, hang1=false, hang2=false, shootball=false;
boolean basket=true;
int score=0;

float radius=200;
float curDeg=0;
float curDeg2=0;

int ballnum=0;
int i=0;
int j=0;
float cx1=1200,cy1=0,cx2=70,cy2=70,tmpcy1=0;

float sec1=1, sec2=1, sec3=1, sec4=1;
float jeg;

int cnt1=1, cnt2=1, cnt3=1, cnt4=1, clkcnt=1, tmpclkcnt=1;
int icnt=0;
String txtmessage="";

float rad,rad2,x1,x2,y1,y2;

void setup(){
  size(1200,600);
  frameRate(30);
}

void keyPressed(){
  if (key=='n'){
    ballnum=0;
    cx1=1200;
    cy1=0;
    cx2=70;
    cy2=70;
    sec1=1;
    sec2=1;
    sec3=1;
    sec4=1;
    i=0;
    j=0;
    cnt1=1;
    cnt2=1;
    hang1=false;
    hang2=false;
    shootball=false;
    basket=false;
    clkcnt=1;
    tmpclkcnt=clkcnt;
    txtmessage= "New Game!";
  }
  if (key=='N'){
    ballnum=0;
    cx1=1200;
    cy1=0;
    cx2=70;
    cy2=70;
    sec1=1;
    sec2=1;
    i=0;
    j=0;
    cnt1=1;
    cnt2=1;
    hang1=false;
    hang2=false;
    shootball=false;
    basket=false;
    clkcnt=1;
    tmpclkcnt=clkcnt;
    txtmessage= "New Game!";
  }
  
  if (i==8){
    if (key==32){
      i=9;
      tmpcy1=cy1;
      println("tmpcy1= "+tmpcy1);
      shootball=true;
    }
  }
  
  if (i==10){
    if (key==32){
      //shoot to the basket
    }
  }
}

void mouseClicked(){
  if (i<8){
    txtmessage= "Please Wait!";
    clkcnt=1;
    tmpclkcnt=clkcnt;
    println ("clicked!");
  }
}

void txtshow(){
  textSize(30);
  fill(255,0,0);
  text (txtmessage, width/2, height*2/3);
}

void mousePressed(){
  if (i==8){
    click=true;
    println(click);
    x1=mouseX-330;
    y1=mouseY-100;
    
    if (mouseX>=cx1-35 && mouseY>=cy1-35){
      if (mouseX<=cx1+35 && mouseY<=cy1+35){
        txtmessage="Yeah! Cool! Score +50";
        score+=50;
        clkcnt=1;
        tmpclkcnt=clkcnt;
        println("Score: "+score);
        hang1=true;
      }
    }
    
  }
}

void mouseReleased(){
  if (i==8){
    click=false;
    println(click);
  }
}

void followline(){
  stroke(255, 0, 0);
  strokeWeight(10);

  //translate(350,0);
  line(0,0,mouseX-350,mouseY);
  //translate(550,0);
  //line(0,0,x2,y2+150);
  
  println("followline");
}

void draw(){
  background(255);
  
  if (click==false){
    curDeg+=6;
    rad=-radians(curDeg);
    x1=radius*cos(rad);
    y1=radius*sin(rad);
  }
  
  curDeg2+=6;
  rad2=radians(curDeg2+120);
  x2=radius*cos(rad2);
  y2=radius*sin(rad2);
  
  //fall
  if (i==0){
    fall();
    if (cy1>=570){
      cy1=570;
      i=1;
      ballnum=1;
    }
  }
  
  if (i==1){
    bounce();
    println("OK if cy1>=570(draw)");
    println("i="+i);
    println("OK if i==1(draw)");
  }
  
  if (i==2){
    bounce();
  }
  
  if (i==3){
    bounce();
  }
  
  if (i==4){
    bounce();
  }
  
  if (i==5){
    bounce();
  }
  
  if (i==6){
    bounce();
  }
  
  if (i==7){
    bounce();
  }
  
  if (ballnum==1) show();
  txtshow();
  
  if (frameCount%30==0){
    clkcnt++;
  }
  
  if (clkcnt==3){
    txtmessage="";
  }
  textSize(30);
  fill(255,0,0);
  text ("Score: "+score, 1000, 30);
  
  println("i: "+i);
  
  //draw target line
  stroke(255, 0, 0);
  strokeWeight(10);
  
  //Line1
  translate(350,0);
  line(0,0,x1,y1+150);
  
  //Line2
  translate(550,0);
  line(0,0,x2,y2+150);
  
  if (hang1==true){
    cx1=x1+350;
    cy1=y1+150;
  }
  
  if (shootball==true){
    hang1=false;
    hang2=false;
    shoot();
  }
  
  if (hang2==true){
    cx1=x2+900;
    cy1=y2+150;
    println("hang2=true");
  }
  
  if (basket==true){
    stroke(0,197,255);
    strokeWeight(10);
    line(900,595,1100,595);
    line(900,395,900,595);
    line(1100,395,1100,595);
    println("basket=true");
  }
}

void fall(){
  colorMode(RGB);
  noStroke();
  fill(#9B2D1C);
  ellipse(cx1,cy1,cx2,cy2);
  cx1=cx1-10;
  cy1=cy1+0.5*9.8*sec1*sec1;
  
  if (frameCount%3==0){
    sec1=sec1+0.1;
  }
  if (cy1>=570){
    //cx1=cx1;
    cy1=570;
    //bounce();
  }
  if (ballnum==1){
    //sec=0;
  }
}

void show(){
  //colorMode(RGB);
  noStroke();
  fill(#9B2D1C);
  ellipse(cx1,cy1,cx2,cy2);
  println("OK show");
}

void bounce(){
  println("OK bounce");
  
  //CASE1 FIRST BOUNCE
  if (i==1){
      if (cnt1<=9){
        cy1+=3;
        cx2+=3;
        cy2-=3;
        show();
        println("OK first bounce if-1");
        println("cx2="+cx2+" cy2="+cy2);
        cnt1++;
      }
    //}
    if (cnt1>9){
      j=1;
      println("j="+j);
    }
    
    if (j==1){
      if (cnt2<=9){
        cy1-=3;
        cx2-=3;
        cy2+=3;
        show();
        println("OK first bounce if-2");
        println("cx2="+cx2+" cy2="+cy2);
        cnt2++;
      }
    if (cnt2>9){
      i++;
      j=0;
      cnt1=1;
      cnt2=1;
    }
    }
  }
  
  //CASE2 FIRST FLY TO THE SKY
  if (i==2){
    if (cy1>470){
      
      cx1-=5;
      cy1-=m*g*h-0.1*g*sec2*sec2;
      //mgh=0.5mv^2
      //1*9.8*(1.2-0.001cy1)=0.5*1*v^2
      println("OK FIRST FLY TO THE SKY-if1");
    }
    
    if (cy1<=470 && cy1>400){
        cx1-=5;
        cy1-=m*g*h-0.2*g*sec2*sec2;
        println("OK FIRST FLY TO THE SKY-if2");
    }
    
    if (cy1<=400){
      cx1-=5;
      cy1-=m*g*h-0.298*g*sec2*sec2;
      println("OK FIRST FLY TO THE SKY-if3");
    }
      
    if (frameCount%3==0){
      sec2=sec2+0.1;
    }
    if (cy1<=350){
      cy1=350;
      i++;
      sec1=1;
    }
  }
  
  //CASE3 SECOND FALL
  if (i==3){
      cx1-=5;
      cy1+=0.5*g*sec1*sec1;
      println("OK SECOND FALL");
      
      if (frameCount%3==0){
        sec1=sec1+0.1;
      }
      if (cy1>=570){
        cy1=570;
        i++;
        sec2=1;
      }
  }
  
  //CASE4 SECOND BOUNCE
  if (i==4){
    if (cnt1<=6){
        cy1+=3;
        cx2+=3;
        cy2-=3;
        show();
        println("OK second bounce if-1");
        println("cx2="+cx2+" cy2="+cy2);
        cnt1++;
      }
    if (cnt1>6){
      j=1;
      println("j="+j);
    }
    
    if (j==1){
      if (cnt2<=6){
        cy1-=3;
        cx2-=3;
        cy2+=3;
        show();
        println("OK second bounce if-2");
        println("cx2="+cx2+" cy2="+cy2);
        cnt2++;
      }
      if (cnt2>6){
        i++;
        cnt1=1;
        cnt2=1;
        sec1=1;
      }
    }
  }
  
  //CASE5 SECOND FLY TO THE SKY
  if (i==5){
    if (cy1>540){
      
      cx1-=3;
      cy1-=m*g*h-0.3*g*sec1*sec1;
      //mgh=0.5mv^2
      //1*9.8*(1.2-0.001cy1)=0.5*1*v^2
      //
      //show();
      println("OK FIRST FLY TO THE SKY-if1");
    }
    
    if (cy1<=540 && cy1>510){
        cx1-=3;
        cy1-=m*g*h-0.4*g*sec1*sec1;
        println("OK FIRST FLY TO THE SKY-if2");
    }
    
    if (cy1<=510){
      cx1-=3;
      cy1-=m*g*h-0.5*g*sec1*sec1;
      println("OK FIRST FLY TO THE SKY-if3");
    }
      
    if (frameCount%3==0){
      sec1=sec1+0.1;
    }
    if (cy1<=480){
      cy1=480;
      i++;
      j=0;
    }
  }
  
  //CASE6 THIRD FALL
  if (i==6){
      cx1-=3;
      cy1+=0.3*g*sec2*sec2;
      println("OK THRID FALL");
      
      if (frameCount%3==0){
        sec2=sec2+0.1;
      }
      if (cy1>=570){
        cy1=570;
        i++;
        sec1=1;
      }
  }
  
  //CASE7 THIRD BOUNCE
  if (i==7){
    if (cnt1<=4){
        cy1+=2;
        cx2+=2;
        cy2-=2;
        show();
        println("OK third bounce if-1");
        println("cx2="+cx2+" cy2="+cy2);
        cnt1++;
      }
    if (cnt1>4){
      j=1;
      println("j="+j);
    }
    
    if (j==1){
      if (cnt2<=4){
        cy1-=2;
        cx2-=2;
        cy2+=2;
        show();
        println("OK third bounce if-2");
        println("cx2="+cx2+" cy2="+cy2);
        cnt2++;
      }
      if (cnt2>4){
        i++;
        cnt1=1;
        cnt2=1;
        sec2=1;
        j=0;
      }
    }
  }
  
}

void shoot(){
  //FLY TO THE SKY
  if (i==9){
    if (j==0){
    if (cy1>tmpcy1-50){
      cx1+=10;
      cy1-=m*g*h-0.1*g*sec1*sec1;
      //mgh=0.5mv^2
      //1*9.8*(1.2-0.001cy1)=0.5*1*v^2
      //
      //show();
      println("OK Shoot-FLY TO THE SKY-if1");
    }
    
    if (cy1<=tmpcy1-50 && cy1>tmpcy1-80){
      cx1+=10;
      cy1-=m*g*h-0.2*g*sec1*sec1;
      println("OK Shoot-FLY TO THE SKY-if2");
    }
    
    if (cy1<=tmpcy1-80 && cy1>tmpcy1-100){
      cx1+=10;
      cy1-=m*g*h-0.3*g*sec1*sec1;
      println("OK Shoot-FLY TO THE SKY-if3");
    }
    
    if (cy1<=tmpcy1-100){
      cy1=tmpcy1-100;
      println("OK Shoot-Top of the sky");
    //i++;
      j=1;
    }
      
    if (frameCount%3==0){
      sec1=sec1+0.1;
    }
    }
  
  //FALL1
  if (j==1){
      cx1+=10;
      cy1+=0.5*g*sec2*sec2;
      println("OK Shoot-FALL1");
      
      if (frameCount%3==0){
        sec2=sec2+0.1;
      }
      
      if (cx1>=x2+820 && cy1>=y2+70){
        if (cx1<=x2+980 && cy1<=y2+230){
          shootball=false;
          basket=true;
          hang2=true;
          score+=100;
          i=10;
          sec1=1;
          sec2=0;
          j=0;
          println("OK Shoot-Catch");
          clkcnt=1;
          tmpclkcnt=clkcnt;
          txtmessage= "Excellent! Score +100";
        }
      }
      
      //if (hang2=false){
        if (cy1>=570){
          shootball=false;
          basket=false;
          cy1=570;
          i=8;
          sec1=1;
          j=0;
        }
      //}
  }
  
  //FALL
  if (i==11){
      cx1-=10;
      cy1+=0.5*g*sec2*sec2;
      println("OK Shoot-FALL1");
      
      if (frameCount%3==0){
        sec1=sec1+0.1;
      }

      println("OK Shoot2");
      clkcnt=1;
      tmpclkcnt=clkcnt;
      txtmessage= "You Win! Score +100";
      }
      
      //if (hang2=false){
        if (cy1>=570){
          shootball=false;
          basket=false;
          cy1=570;
          i=8;
          sec1=1;
          j=0;
        }
      //}
    }
  
  //Include code: if(meet spin line), if(not meet spin line)
    
  //if(not meet spin line)
  //if (cy1<=480){
    //cy1=480;
    //i++;
    //j=0;
  //}
    
  //bounce();
  //insert new code -bounce (if start point: hang1)
  //i=7; //call third bounce (if start point: ground)
}

void timer(){
  if (frameCount%30==0){
    //sec++;
  }
}
