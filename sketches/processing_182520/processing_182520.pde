
int x = 150, y = 700; // chelovechek
int kvx = 1020, kvy=685, k2=1270, k3=1520, k4=1770, k5=2020;  // kamen
int x1=200, f=2, prig=0, c=850, sch=2252;
int xd=-100, yd1=500, yd=500;  //trees
void setup() {
  size(1000, 800);
}
void draw() {
  background(0, 0, 200);   
  stroke(255, 255, 0);  /////////////  sun
  strokeWeight(5);
  fill(255, 255, 0);
  ellipse(c, 150, 100, 100);
  line(850, 45, 850, 255);// 1
  line(930, 75, 770, 230);// 2
  line(745, 150, 955, 150);// 3
  line(780, 75, 930, 230);// 4
  noStroke();  ////////////////////  oblako
  fill(255);
  ellipse(125, 125, 50, 50);
  ellipse(160, 125, 70, 50);
  ellipse(225, 150, 50, 50);
  ellipse(150, 160, 70, 50);
  ellipse(200, 175, 50, 50);
  ellipse(200, 140, 70, 50);
  stroke(0);  ////////////////////   pol
  strokeWeight(1);
  line(0, 700, 1000, 700);
  fill(0, 95, 0);  //////////////  trava 
  rect(500, 700, 1000, 370);

  for (int i = 0; i < 9; i++) {   //trees  
    fill(100, 48, 28);
    rectMode(CENTER);
    rect(i*200+xd+100, yd+112, 15, 25);
    rect(i*200+xd+180, yd1+75, 8, 40);
    rect(i*200+xd+248, yd1+15, 6, 60);
    fill(50, 150, 50);
    beginShape();
    vertex(i*200+xd+100, yd);
    vertex(i*200+xd+150, yd+50); 
    vertex(i*200+xd+120, yd+50);
    vertex(i*200+xd+170, yd+100);
    vertex(i*200+xd+30, yd+100);
    vertex(i*200+xd+80, yd+50);
    vertex(i*200+xd+50, yd+50); 
    endShape(CLOSE);
    fill(70, 230, 50);
    ellipse(i*200+xd+180, yd1, 60, 120);
    fill(128, 255, 0);
    ellipse(i*200+xd+248, yd1-50, 100, 100);
  }

  fill(108, 34, 0);  /////////      school
  rect(sch, 600, 200, 200);
  fill(0);
  rect(sch, 650, 50, 100);
  fill(251, 105, 0);
  triangle(sch-100, 500, sch, 400, sch+100, 500);
  fill(0, 155, 255);
  ellipse(sch, 462, 46, 46);
  fill(245);
  textAlign(CENTER);
  textSize(35);
  text("school", sch, 540);

  stroke(200, 0, 0);  /////////////// chelovechek
  strokeWeight(10);
  fill(200, 0, 0);
  ellipse(x, y-235, 70, 70);// golova
  line(x, y-200, x, y);// tulovishe
  line(x, y-100, x1, y);// noga vpered
  line(x, y-170, x+70, y-150);// ruka verxnaa
  line(x, y-170, x+50, y-100);// ruka nisnaa  

  stroke(0);  //////////////////////// kamen
  strokeWeight(3);
  fill(150);
  rectMode(CENTER);
  rect(kvx, kvy, 50, 30, 20, 20, 0, 0);
  rect(k2, kvy, 50, 30, 20, 20, 0, 0);
  rect(k3, kvy, 50, 30, 20, 20, 0, 0);
  rect(k4, kvy, 50, 30, 20, 20, 0, 0);
  rect(k5, kvy, 50, 30, 20, 20, 0, 0);

  frameRate(45);
  float rast = dist(kvx, kvy, x1, y);
  float rast2 = dist(k2, kvy, x1, y);
  float rast3 = dist(k3, kvy, x1, y);
  float rast4 = dist(k4, kvy, x1, y);
  float rast5 = dist(k5, kvy, x1, y);

  if (rast>20 && rast2>20 && rast3>20 && rast4>20 && rast5>20) { 
    if (keyCode == 39) { //shag
      if (x1==200) f=-2;
      if (x1==120) f=+2;
      x1+=f;
      kvx-=2;
      k2-=2;
      k3-=2;
      k4-=2;
      k5-=2;
      sch-=2;
      xd--;
    }    
    if (keyCode == 38) { //prig
      if (prig<70) {
        if (y==700) f=-2;
        if (y==630) f=+2;  
        y+=f;
        prig++;
        kvx-=2;
        k2-=2;
        k3-=2;
        k4-=2;
        k5-=2;
        sch-=2;
      }
    } else {
      prig*=0;
      y=700;
    }
  } else {
    fill(150, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text("GAME OVER!", width/2, 300); // igra zakoncheha!
  }
  if (x>=sch) {
    fill(200, 0, 0);                                                   
    textAlign(CENTER);
    textSize(100);
    text("YOU DIDN'T LATE!", width/2, 300); // pobeda!
    // sch=150;
    stop();
  }
}

