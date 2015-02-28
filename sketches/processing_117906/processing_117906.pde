
int hikari;
int x, y;
int vx;
int vy;


void setup() {
  hikari=0;
  size(650, 650);

  x=height/2;
  y=height/2;
  vx=5;
  vy=5;
}
void  draw() {
  background(200, x, y);

  if (mousePressed) {
    background(88);
  }
  
pushMatrix();
  moji(0, 0);


  kixyara(x-10, y-70);


  kixyara(x-70, y-90);

  kixyara(x-30, y-99);

  kixyara(x-60, y-80);
  popMatrix();

  pushMatrix();
  if ( mouseButton == RIGHT )
  
  
    haikei(0, 0);
    
    if(frameCount%10<5) hikari=0;
    else if(frameCount%10<10) hikari=1;
    
    
    
    moji(0,0);
    moji3(0,0);
  popMatrix();



  x=x+vx;
  if (x>width -160) {
    vx=-10;
  }

  if (x<50) {
    vx=5;
  }


  y=y+vy;
  if (y>width-65) {
    vy=-5;
  }

  if (y<50) {
    vy=5;
  }





  if (mousePressed) {

    if ((mouseX> x-50)&&(mouseX< x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {

      x=mouseX;
      y=mouseY;
    }
  }
}

void haikei(int a, int b) {

  pushMatrix();

  if ( mouseButton == RIGHT )



    background(50);

  stroke(255);

  fill(255, x, y);

  ellipse(325, 325, 370, 370);

  fill(200, x, y);

  ellipse(325, 325, 350, 350);

  fill(150, x, y);

  ellipse(325, 325, 330, 330);

  fill(100, x, y);

  ellipse(325, 325, 325, 325);

  fill(50, x, y);

  ellipse(325, 325, 300, 300);


  translate(280, 280);  

  noStroke();
  if(hikari==0)
 
  fill(10);
  
  else if(hikari==1)
  
  fill(255);
  

  rect(10, 25, 80, 60 );
  fill(250);
  triangle(50, 55, 62, 70, 38, 70 );
  fill(250);
  ellipse(30, 45, 15, 15);
  fill(250);
  ellipse(30, 45, 10, 10);
  fill(250);
  ellipse(70, 45, 15, 15);
  fill(250);
  ellipse(30, 45, 5, 5);
  fill(250);
  ellipse(70, 45, 10, 10);
  fill(250);
  ellipse(70, 45, 5, 5);
  //rect(10, 10, 80,60 );
  
  if(hikari==0)
 
  fill(10);
  
  else if(hikari==1)
  
  fill(255);
  
  rect(0, 35, 10, 40 );
  
  if(hikari==0)
 
  fill(10);
  
  else if(hikari==1)
  
  fill(255);
  
  rect(90, 35, 10, 40 );
  rect(20, 10, 20, 25);
  rect(60, 10, 20, 25);
  ellipse(50, 94, 45, 20);
  ellipse(75, 94, 10, 10);
  ellipse(80, 90, 5, 5);


  //denngeki
  fill(250, 241, 63);
  triangle(-220, 350, -105, 200, -20, 75);

  triangle(320, 350, 205, 200, 120, 75);

  triangle(-240, 370, -125, 220, -40, 95);

  triangle(340, 370, 225, 220, 140, 95);






  //neji

  fill(255, x, y);
  ellipse(120, 50, 20, 10);
  ellipse(-20, 50, 20, 10);
  rect(-25, 52, 10, 30);
  rect(115, 52, 10, 30);
  fill(250);
  line(95, 80, 100, 80);


  pushMatrix();

  translate(10, 125);
  fill(50, 80, 80);

  textSize(33);
  text("charging …", -46, 8); 

  popMatrix();


  popMatrix();
}

void kixyara(int a, int b) {

  translate(a, b);

  pushMatrix();


  noStroke();
  fill(155, 76, a, b);

  //moji
  fill(124,255,85);

  textSize(random(100, 100));

  text(int(random(2)), random(width), random(height));
  
 
  
  
  //kao
  
  if(mousePressed);
  pushMatrix();
  fill(200,x,y);
  translate(45,60);
  ellipse(0,0,280,280);
  popMatrix();
  
  fill(155, 76, a, b);
  rect(10, 25, 80, 60 );
  //kuti
  fill(250);
  triangle(50, 55, 62, 70, 38, 70 );
  //hitomi
  fill(250);
  stroke(10);
  ellipse(30, 45, a/15, b/15);
  fill(250);
  stroke(10);
  ellipse(30, 45, 10, 10);
  fill(250);
  stroke(10);
  ellipse(70, 45, a/15, b/15);
  fill(10);
  ellipse(30, 45, 5, 5);
  fill(250);
  ellipse(70, 45, 10, 10);
  fill(10);
  ellipse(70, 45, 5, 5);

  //ifhitomi
  if (mousePressed) {
    fill(234, 255, 8);
    stroke(10);
    ellipse(30, 45, a/15, b/15);
    fill(234, 255, 8);
    stroke(10);
    ellipse(30, 45, 10, 10);
    fill(234, 255, 8);
    stroke(10);
    ellipse(70, 45, a/15, b/15);
    fill(255,8,45);
    ellipse(30, 45, 5, 5);
    fill(234,255,8);
    ellipse(70, 45, 10, 10);
    fill(255,8,45);
    ellipse(70, 45, 5, 5);
  }


  fill(155, 76, a, b);
  noStroke();
  rect(0, 35, 10, 40 );
  fill(155, 76, a, b);
  rect(90, 35, 10, 40 );
  //mimi
  rect(20, 10, 20, 15);
  rect(60, 10, 20, 15);
  //sippo
  ellipse(50, 94, 45, 20);




//ifhane

  if (mousePressed) {
    pushMatrix();
    
   
    
    fill(10);    
    triangle(-210, 250, -80, 20, -30, 75);
    fill(150);    
    triangle(-180, 250, -80, 20, -30, 75);
    fill(a, b, 10);
    triangle(-160, 250, -50, 20, 0, 75);


    fill(10);
    triangle(310, 250, 180, 20, 130, 75);
    fill(150);
    triangle(280, 250, 180, 20, 130, 75);
    fill(a, b, 10);
    triangle(250, 250, 150, 20, 100, 75);
    popMatrix();
  }

  //neji
  fill(150);
  ellipse(120, 50, 20, 10);
  ellipse(-20, 50, 20, 10);
  rect(-25, 52, 10, 30);
  rect(115, 52, 10, 30);
  fill(250);
  line(95, 80, 100, 80);


  pushMatrix();
  translate(100, 50);
  rotate(map(a, 0, 400, 0, 35));
  fill(14, 34, a, b);
  ellipse(90, -50, 20, 10);
  rect(85, -45, 10, 30);
  popMatrix();



  //pushMatrix();
  //translate(-20,50);
  //rotate(map(mouseX,0,400,0,35));
  //fill(150);
  //ellipse(35, -50, 20,10);
  //rect(30,-50,10,30);

  //popMatrix();

  pushMatrix();
  translate(0, 50);
  rotate(map(a, 0, 500, 0, 25 ));
  fill(14, 34, a, b);
  ellipse(90, -50, 20, 10);
  rect(85, -45, 10, 30);
  popMatrix();

  if (mousePressed) {



    pushMatrix();


    fill(14, 34, a, b);

    textSize(33);
    text("INUROBO Ω", -46, 8);

    text("KAI GAN!!", -27, 135);

    translate(70, 94);
    rotate(map(a, 0, 400, 0, 35));
    fill(155, 76, a, b);
    ellipse(5, 0, 10, 10);
    ellipse(10, -4, 5, 5);
    popMatrix();
  }


  popMatrix();
}

//moji
void moji(int a, int b) {

  translate(a, b);

  pushMatrix();

  fill(124,255,85);

  textSize(random(50, 80));

  text(int(random(2)), random(width), random(height));
  
  popMatrix();
}
//moji
void moji2(int a, int b) {

  translate(a, b);

  pushMatrix();

  fill(124,255,85);

  textSize(random(200, 200));

  text(int(random(2)), random(width), random(height));
  
  popMatrix();
}
//moji
void moji3(int a, int b) {

  translate(a, b);

  pushMatrix();

  fill(124,255,85);

  textSize(random(200, 200));

  text(int(random(2)), random(width), random(height));
  
  popMatrix();
}


