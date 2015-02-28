
//fields
int clicker = 0;
float q1 = 0;
float q2 = 0;
float q3 = 0;
float q4 = 0;

//methods
void setup() {
  size(800, 700);
  background(155);
}
void mousePressed() {
  clicker++;
}

void draw() {
  if (clicker == 0) {
    fill(0);
    textSize(24);
    text("Quarterly iPhone Sales from 2008 to 2012", 150, 400);
  }
  else {
    if (clicker == 1) {
      background(155);
      mousePressed();
    }
  }
  if (clicker>1) {
    if (mouseX > 0 && mouseX <= 160) {
      background(155);
      amount2008();
    }
    else {
      if (mouseX > 160 && mouseX <= 320) {
        background(155);
        amount2009();
      }
      else {
        if (mouseX > 320 && mouseX <= 480) {
          background(155);
          amount2010();
        }
        else {
          if (mouseX > 480 && mouseX <= 640) {
            background(155);
            amount2011();
          }
          else {
            if (mouseX > 640 && mouseX <= 800) {
              background(155);
              amount2012();
            }
          }
        }
      }
    }
    //2008
    if (mouseX > 0 && mouseX <= 160) {
      textSize(24);
      fill(255);
      text("2008", 50, 25);  
      fill(0);
      text("2009", 190, 25);  
      fill(0);
      text("2010", 340, 25);  
      fill(0);
      text("2011", 480, 25);  
      fill(0);
      text("2012", 620, 25);
    }
    else {
      //2009
      if (mouseX > 160 && mouseX <= 320) {
        textSize(24);
        fill(0);
        text("2008", 50, 25);  
        fill(255);
        text("2009", 190, 25);  
        fill(0);
        text("2010", 340, 25);  
        fill(0);
        text("2011", 480, 25);  
        fill(0);
        text("2012", 620, 25);
      }
      else {
        //2010
        if (mouseX > 320 && mouseX <= 480) {
          textSize(24);      
          fill(0);
          text("2008", 50, 25);  
          fill(0);
          text("2009", 190, 25);  
          fill(255);
          text("2010", 340, 25);  
          fill(0);
          text("2011", 480, 25);  
          fill(0);
          text("2012", 620, 25);
        }
        else {
          //2011
          if (mouseX > 480 && mouseX <= 640) {
            textSize(24);
            fill(0);
            text("2008", 50, 25);  
            fill(0);
            text("2009", 190, 25);  
            fill(0);
            text("2010", 340, 25);  
            fill(255);
            text("2011", 480, 25);  
            fill(0);
            text("2012", 620, 25);
          }
          else {
            //2012
            if (mouseX > 640 && mouseX <= 800) {
              textSize(24);
              fill(0);
              text("2008", 50, 25);  
              fill(0);            
              text("2009", 190, 25);  
              fill(0);
              text("2010", 340, 25);  
              fill(0);
              text("2011", 480, 25); 
              fill(255); 
              text("2012", 620, 25);
              fill(0);
            }
          }
        }
      }
    }
    line(100,600,700,600);
    line(100,600,100,100);
    text("0", 80, 600);
    text("5", 80, 550);
    text("10", 70, 500);
    text("15", 70, 450);
    text("20", 70, 400);
    text("25", 70, 350);
    text("30", 70, 300);
    text("35", 70, 250);
    text("40", 70, 200);
    text("Q1", 150, 630);
    text("Q2", 285, 630);
    text("Q3", 420, 630);
    text("Q4", 575, 630);
  }
}
void amount2008() {
  q1 = 2.32;
  q2 = 1.70;
  q3 = 0.72;
  q4 = 6.89;
  create(q1, q2, q3, q4);
}
void amount2009() {
  q1 = 4.36;
  q2 = 3.79;
  q3 = 5.21;
  q4 = 7.37;
  create(q1, q2, q3, q4);
}
void amount2010() {
  q1 = 8.74;
  q2 = 8.75;
  q3 = 8.40;
  q4 = 14.10;
  create(q1, q2, q3, q4);
}
void amount2011() {
  q1 = 16.24;
  q2 = 18.65;
  q3 = 20.34;
  q4 = 17.07;
  create(q1, q2, q3, q4);
}
void amount2012() {
  q1 = 37.04;
  q2 = 35.06;
  q3 = 26.03;
  q4 = 26.91;
  create(q1, q2, q3, q4);
}
void create(float q1, float q2, float q3, float q4) {
  rectMode(CORNERS);
  fill(155,0,155);
  rect(135,600,200,600-(q1*10));
  fill(0);
  text(q1 + " M", 125, 600-(q1*10)-10);
  fill(0,255,150);
  rect(270,600,335,600-(q2*10));
  fill(0);
  text(q2 + " M", 260, 600-(q2*10)-10);
  fill(225,100,0);
  rect(405,600,470,600-(q3*10));
  fill(0);
  text(q3 + " M", 395, 600-(q3*10)-10);
  fill(0,0,255);
  rect(555,600,625,600-(q4*10));
  fill(0);
  text(q4 + " M", 545, 600-(q4*10)-10);
  textSize(30);
  if(q1>q4){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  text("Year Sales: " + truncate(q1+q2+q3+q4) + " M", 250, 150);
}
float truncate(float x){
 if ( x > 0 )
   return float(floor(x * 100))/100;
 else
   return float(ceil(x * 100))/100;
}

