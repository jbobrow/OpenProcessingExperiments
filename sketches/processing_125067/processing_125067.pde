
float x, y;
float vx, vy;

void setup() {
  size(900, 800);
  x=200;
  y=200;
  vx=3;
  vy=0;
}

void draw() {
  background(#010008);

  //haikei
  stroke(#FFFFFF);
  fill(#010008);
  ellipse(30, 500, 800, 50);
  ellipse(90, 500, 305, 60);
  ellipse(220, 90, 500, 50);
  ellipse(600, 450, 500, 100); 
  fill(#FFFFFF);
  ellipse(500, 500, 20, 20);
  ellipse(360, 450, 10, 10);
  ellipse(150, 115, 10, 10);
  ellipse(580, 450, 20, 20);
  fill(#FFF303);
  ellipse(300, 65, 15, 15);
  ellipse(660, 600, 20, 20);
  ellipse(100, 470, 20, 20);



  if (mousePressed) {

    //aniki    
    stroke(#4EBC52);
    fill(#4EBC52);
    pushMatrix();
    translate(122, 333);
    rotate(map(x-10, y, 2, 0, 2));
    ellipse(120, 100, 15, 100);
    ellipse(150, 80, 15, 100);
    ellipse(180, 100, 15, 100);
    ellipse(150, 150, 250, 60);
    ellipse(150, 200, 60, 60);
    ellipse(150, 250, 140, 50);
    //sirome
    fill(#FFFFFF);    
    ellipse(130, 160, 50, 10);
    ellipse(180, 160, 50, 10);
    //kurome
    fill(#4EBC52);
    ellipse(130, 165, 10, 10);
    ellipse(180, 165, 10, 10); 
    popMatrix();   

    //otoosan
    stroke(#2AAFA3);
    fill(#2AAFA3);
    ellipse(550, 80, 170, 130);
    ellipse(550, 150, 350, 160);
    ellipse(550, 250, 70, 140);
    ellipse(550, 350, 240, 150);   
    //sirome
    fill(#FFFFFF);    
    pushMatrix();
    translate(572, 133);
    ellipse(0, 0, 70, 45);
    //kurome
    fill(60, 200, 80);
    rotate(map(x-10, y, 60, 0, 0));
    ellipse(0, 0, x/30, y/30);
    popMatrix();
    //sirome
    fill(250);
    pushMatrix();
    translate(498, 102); 
    ellipse(0, 0, 70, 45);    
    //kurome
    fill(60, 200, 80);
    rotate(map(x, y, 60, 0, 0));
    ellipse(0, 0, x/30, y/30);
    popMatrix();


    //okaasan
    stroke(#F7B734);
    fill(#F7B734);
    ellipse(250, 150, 100, 200);
    ellipse(250, 350, 400, 200);
    ellipse(250, 450, 150, 200);
    ellipse(250, 550, 300, 200);
    //sirome
    fill(#FFFFFF);    
    pushMatrix();
    translate(122, 333);
    rotate(map(x, y, 600, 0, 22));
    ellipse(0, 0, x/8, y/8);
    //kurome
    fill(60, 200, 80);
    ellipse(0, 0, 10, 10);
    popMatrix();
    //sirome
    fill(250);
    pushMatrix();
    translate(388, 322);
    rotate(map(x, y, 600, 0, -22));
    ellipse(0, 0, x/9, y/9);    
    //kurome
    fill(60, 200, 80);
    ellipse(0, 0, 10, 10);
    popMatrix();


    chara(int(x)-200, int(y)-200);
    chara(int(x)-150, int(y)-150);
    chara(int(x)+100, int(y)+100);
    chara(int(x)+200, int(y)+200);
  }



  chara(int(x)-50, int(y)-50);
  x = x+vx;
  y = y+vy;
  vy=vy+0.2;



  if (x>width-25)vx=-vx;
  if (x<25)vx=-vx;
  if (y>height-25)vy=-vy;
  if (y<25)vy=-vy;

  if (mousePressed) {
    if ((mouseX>x-25)&&(mouseX<x+25)&&(mouseY>y-25)&&(mouseY<y+25)) {
      x=mouseX;
      y=mouseY;
      vx=mouseX-pmouseX;
      vy=mouseY-pmouseY;
    }
  }
}


void chara(int a,int b){
  pushMatrix();
  translate(a,b);
  stroke(200, 20, 80);
  //asi
  //rotate((float)mouseX/100);
  fill(60, 200, 80);
  ellipse(25, 85, 8, b/5);
  ellipse(40, 88, 8, b/1.5);
  ellipse(60, 88, 8, b/1.5);
  ellipse(75, 85, 8, b/5);
  //doutai
  fill(200, 20, 80);
  ellipse(50, 10, a/5, b/2);
  ellipse(50, 30, 80, 30);
  ellipse(50, 55, b/3, 30);
  ellipse(50, 76, a/2, b/7);
  //sirome
  fill(255, 255, 255);
  stroke(200, 20, 80);
  ellipse(22, 25, 18, 18);
  ellipse(78, 25, 18, 18);
  //kurome
  fill(0,0,0);
  ellipse(22, 21, 5, 5);
  ellipse(78, 29, 5, 5);
    popMatrix();
}



