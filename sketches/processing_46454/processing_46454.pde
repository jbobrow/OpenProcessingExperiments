
void setup(){
  size (500,500);
  noStroke();
  PFont font;
  font = loadFont("Bebas-48.vlw");
  textFont (font);
}

void draw(){
  int s = second();
  int m = minute();
  int h = hour();
  int d = day();
  int z = month();
  int y = year();
  int a = 23*h;
    if (h<3) {background(h*23,m,s);}
    if ((h>=3)&&(h<6)) {background(h*23,65+m,65+s);}
    if ((h>=6)&&(h<9)) {background(h*23,130+m,130+s);}
    if ((h>=9)&&(h<12)) {background(h*23,195+m,195+s);}
    if ((h>=12)&&(h<15)) {background(531-a,255-m,255-s);}
    if ((h>=15)&&(h<18)) {background(531-a,190-m,190-s);}
    if ((h>=18)&&(h<21)) {background(531-a,125-m,125-s);}
    if (h>=21) {background(531-a,60-m,60-s);}
  
  pushMatrix();
  translate(250,250);
  rotate(radians(h*30));
  fill(180,150);
  ellipse(-200,0,30,30);
  ellipse(200,0,30,30);
  ellipse(0,210,50,50);
  ellipse(142,142,40,40);
  ellipse(-142,142,40,40);
  ellipse(140,-140,20,20);
  ellipse(-140,-140,20,20);
  fill(50,200);
  ellipse(0,-200,10,10);
  popMatrix();

  pushMatrix();
  translate(250,250);
  rotate(radians(m*6));
  fill(238,80);
  bezier(0,-200, 100,100,  100,100, 0,200);
  bezier(0,-200, -100,100,  -100,100, 0,200);
  bezier(0,-200, -100,-100,  -100,-100, 0,200);
  bezier(0,-200, 100,-100,  100,-100, 0,200);
  bezier(-200,0, 100,100,  100,100, 200,0);
  bezier(-200,0, 100,-100,  100,-100, 200,0);
  bezier(-200,0, -100,-100,  -100,-100, 200,0);
  bezier(-200,0, -100,100,  -100,100, 200,0);
  fill(80,150);
  triangle(0,-200,  -7,-180, 7,-180);
  popMatrix();
  
  pushMatrix();
  translate(250,250);
  rotate(radians(s*6));
  fill(80,100);
  triangle(0,-50, -10,0, 10,0);
  triangle(0,50, -10,0, 10,0);
  triangle(-50,0, 0,-10, 0,10);
  triangle(50,0, 0,-10, 0,10);
  fill(0,80);
  triangle(0,-50, -2,-40, 2,-40);
  popMatrix();
  
  pushMatrix();
  translate(250,250);
  if (mousePressed == true) 
  {fill(30,200);} else {fill(30,0);}
  translate(120*cos(radians(m*6)),120*sin(radians(m*6)));
  textAlign(CENTER);
    if (z==1) {text("Jan",0,20); }
    if (z==2) {text("Feb",0,20); }
    if (z==3) {text("Mar",0,20); }
    if (z==4) {text("Apr",0,20); }
    if (z==5) {text("May",0,20); }  
    if (z==6) {text("June",0,20); }
    if (z==7) {text("July",0,20); }
    if (z==8) {text("Aug",0,20); }
    if (z==9) {text("Sept",0,20); }
    if (z==10) {text("Oct",0,20); }
    if (z==11) {text("Nov",0,20); }
    if (z==12) {text("Dec",0,20); }
  popMatrix();
  pushMatrix();
  translate(250,250);
  translate(120*cos(radians(m*6+90)),120*sin(radians(m*6+90)));
  text(d,0,20);
  popMatrix();
  pushMatrix();
  translate(250,250);
  translate(120*cos(radians(m*6+180)),120*sin(radians(m*6+180)));
  text(y,0,20);
  popMatrix();
  pushMatrix();
  translate(250,250);
  translate(120*cos(radians(m*6+270)),120*sin(radians(m*6+270)));
  textAlign(RIGHT);
    if (h==0) {text("00",-5,20); }
    if (h==1) {text("01",-5,20); }
    if (h==2) {text("02",-5,20); }
    if (h==3) {text("03",-5,20); }
    if (h==4) {text("04",-5,20); }
    if (h==5) {text("05",-5,20); }  
    if (h==6) {text("06",-5,20); }
    if (h==7) {text("07",-5,20); }
    if (h==8) {text("08",-5,20); }
    if (h==9) {text("09",-5,20); }
    if (h>=10) {text(h,-5,20); }
  textAlign(CENTER);
  text(":",0,20);
  textAlign(LEFT);
    if (m==0) {text("00",5,20); }  
    if (m==1) {text("01",5,20); }
    if (m==2) {text("02",5,20); }
    if (m==3) {text("03",5,20); }
    if (m==4) {text("04",5,20); }
    if (m==5) {text("05",5,20); }  
    if (m==6) {text("06",5,20); }
    if (m==7) {text("07",5,20); }
    if (m==8) {text("08",5,20); }
    if (m==9) {text("09",5,20); }
    if (m>=10) {text(m,5,20); }
  popMatrix();
}

