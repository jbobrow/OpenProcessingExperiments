

//int x, y ;
//int vx;
//int vy;
int a;
int b;
int[] xx = new int[100];
int[] yy = new int[100];
float x, y;
float vx, vy;

//PImage img;

void setup() {

  size(600, 600);
  x=200;//0;
  y=200;//height/2;
  vx=5;
  vy=5;
  a=mouseX;
  b=mouseY;
 // img =loadImage("image035.jpg");
}

void draw() {

  background(#F7E837);
//  image(img,0,0);
  
  if (mousePressed) {
    background(#37F74B);
  }
  // translate(mouseX-50,mouseY-70);
  //translate(x-50, y-70);
  //ellipse(0,50,

  //  chara(int(x-50), int(y-70));

  // noStroke();

  // fill(#54B25E);
  // triangle(0, 0, 100, 20, 0, 80);

  stroke(3);

  x=x+vx;
  y=y+vy;

  vy=vy+0.03;//0.09;

  //  for (int i=99; i>0; i-=10) {
  //   pushMatrix();
  // translate(xx[i], yy[i]);

  //   chara(int(x-300), int(y-500));

  //  popMatrix();
  // }

  if (x>width-105)vx=-vx;
  if (x<85)vx=-vx;
  if (y>height-25)vy=-vy*0.9;
  if (y<25)vy=-vy*0.5;


  if (mousePressed) {
    pushMatrix();
    translate(50, 120);
    translate(x-50, y-70);
    rotate(map(mouseX, 0, 400, 0, 6.28));
    //noStroke();
    //fill(#FBFF89);
    fill(x, y, 150);
    
 
    
    
    
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    rotate(PI/6);
    triangle(150, 0, 230, -15, 230, 15);
    
    popMatrix();
    
    pushMatrix();
 translate(50, 120);
    translate(x-50, y-70);
   rotate(map(-mouseX, 0, 400, 0, 6.28));
    //second
    fill(x, y, 500);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    rotate(PI/6);
    triangle(300, 0, 480, -15, 480, 15);
    popMatrix();
    chara(int(x-290), int(y-70));
    chara(int(x-170), int( y-70));
    chara(int(x+70), int(y-70));
    chara(int(x+190), int( y-70));
     chara2(int(x-50), int(y-70));

  }
  //ellipse()

  for (int i=99; i>0; i--) {
    xx[i] =xx[i-1];
    yy[i] =yy[i-1];
  }

  xx[0] =mouseX ;
  yy[0] =mouseY ;

  chara(int(x-50), int(y-70));



  if (mouseButton == RIGHT) {

    pushMatrix();
    translate(50, 120);
    translate(x-50, y-70);
    en(0, 0);
    popMatrix();  

chara3(int(x-50), int(y-70));
    chara(int(x-290), int (y-70));
    chara(int(x-170), int ( y-70));
    chara(int(x+70), int ( y-70));
    chara(int(x+190), int ( y-70));
    chara(int(x-410), int (y-70));
    chara(int(x-530), int (y-70));
    chara(int(x+310), int ( y-70));
    chara(int(x+430), int ( y-70));
 

  }

 if ((keyPressed == true) && (key == 's')) {
    pushMatrix();
    translate(50, 120);
    translate(x-50, y-70);
    // en(0, 0);
    popMatrix();  

 background(0,mouseX,mouseY);
 
   // if mouseDragged(){
      //fill(mouseX, mouseY);
    
  //  }
 //else{
   //fill(255);
 //}
 
 
   chara(int(x-50), int(y-70));
    chara(int(x-290), int (y-70));
    chara(int(x-170), int ( y-70));
    chara(int(x+70), int ( y-70));
    chara(int(x+190), int ( y-70));
    chara(int(x-410), int (y-70));
    chara(int(x-530), int (y-70));
    chara(int(x+310), int ( y-70));
    chara(int(x+430), int ( y-70));

    chara(int(x-650), int (y-70));
    chara(int(x-770), int ( y-70));
    chara(int(x+550), int ( y-70));
    chara(int(x+670), int ( y-70));
    chara(int(x-890), int (y-70));
    chara(int(x-1010), int (y-70));
    chara(int(x+790), int ( y-70));
    chara(int(x+910), int ( y-70));
    chara(int(x-1130), int (y-70));
    chara(int(x-1250), int (y-70));
    chara(int(x+1030), int ( y-70));
    chara(int(x+1150), int ( y-70));


    chara(int(x-50), int(y-300));
    chara(int(x-290), int (y-300));
    chara(int(x-170), int ( y-300));
    chara(int(x+70), int ( y-300));
    chara(int(x+190), int ( y-300));
    chara(int(x-410), int (y-300));
    chara(int(x-530), int (y-300));
    chara(int(x+310), int ( y-300));
    chara(int(x+430), int ( y-300));

    chara(int(x-650), int (y-300));
    chara(int(x-770), int ( y-300));
    chara(int(x+550), int ( y-300));
    chara(int(x+670), int ( y-300));
    chara(int(x-890), int (y-300));
    chara(int(x-1010), int (y-300));
    chara(int(x+790), int ( y-300));
    chara(int(x+910), int ( y-300));
    chara(int(x-1130), int (y-300));
    chara(int(x-1250), int (y-300));
    chara(int(x+1030), int ( y-300));
    chara(int(x+1150), int ( y-300));


    chara(int(x-50), int(y-530));
    chara(int(x-290), int (y-530));
    chara(int(x-170), int ( y-530));
    chara(int(x+70), int ( y-530));
    chara(int(x+190), int ( y-530));
    chara(int(x-410), int (y-530));
    chara(int(x-530), int (y-530));
    chara(int(x+310), int ( y-530));
    chara(int(x+430), int ( y-530));

    chara(int(x-650), int (y-530));
    chara(int(x-770), int ( y-530));
    chara(int(x+550), int ( y-530));
    chara(int(x+670), int ( y-530));
    chara(int(x-890), int (y-530));
    chara(int(x-1010), int (y-530));
    chara(int(x+790), int ( y-530));
    chara(int(x+910), int ( y-530));
    chara(int(x-1130), int (y-530));
    chara(int(x-1250), int (y-530));
    chara(int(x+1030), int ( y-530));
    chara(int(x+1150), int ( y-530));



    chara(int(x-50), int(y-760));
    chara(int(x-290), int (y-760));
    chara(int(x-170), int ( y-760));
    chara(int(x+70), int ( y-760));
    chara(int(x+190), int ( y-760));
    chara(int(x-410), int (y-760));
    chara(int(x-530), int (y-760));
    chara(int(x+310), int ( y-760));
    chara(int(x+430), int ( y-760));

    chara(int(x-650), int (y-760));
    chara(int(x-770), int ( y-760));
    chara(int(x+550), int ( y-760));
    chara(int(x+670), int ( y-760));
    chara(int(x-890), int (y-760));
    chara(int(x-1010), int (y-760));
    chara(int(x+790), int ( y-760));
    chara(int(x+910), int ( y-760));
    chara(int(x-1130), int (y-760));
    chara(int(x-1250), int (y-760));
    chara(int(x+1030), int ( y-760));
    chara(int(x+1150), int ( y-760));


    chara(int(x-50), int(y+160));
    chara(int(x-290), int (y+160));
    chara(int(x-170), int ( y+160));
    chara(int(x+70), int ( y+160));
    chara(int(x+190), int ( y+160));
    chara(int(x-410), int (y+160));
    chara(int(x-530), int (y+160));
    chara(int(x+310), int ( y+160));
    chara(int(x+430), int ( y+160));

    chara(int(x-650), int (y+160));
    chara(int(x-770), int ( y+160));
    chara(int(x+550), int ( y+160));
    chara(int(x+670), int ( y+160));
    chara(int(x-890), int (y+160));
    chara(int(x-1010), int (y+160));
    chara(int(x+790), int ( y+160));
    chara(int(x+910), int ( y+160));
    chara(int(x-1130), int (y+160));
    chara(int(x-1250), int (y+160));
    chara(int(x+1030), int ( y+160));
    chara(int(x+1150), int ( y+160));
    
    
    
        chara(int(x-50), int(y+390));
    chara(int(x-290), int (y+390));
    chara(int(x-170), int ( y+390));
    chara(int(x+70), int ( y+390));
    chara(int(x+190), int ( y+390));
    chara(int(x-410), int (y+390));
    chara(int(x-530), int (y+390));
    chara(int(x+310), int ( y+390));
    chara(int(x+430), int ( y+390));

    chara(int(x-650), int (y+390));
    chara(int(x-770), int ( y+390));
    chara(int(x+550), int ( y+390));
    chara(int(x+670), int ( y+390));
    chara(int(x-890), int (y+390));
    chara(int(x-1010), int (y+390));
    chara(int(x+790), int ( y+390));
    chara(int(x+910), int ( y+390));
    chara(int(x-1130), int (y+390));
    chara(int(x-1250), int (y+390));
    chara(int(x+1030), int ( y+390));
    chara(int(x+1150), int ( y+390));
  
  if (mousePressed){

 fill(random(256));
  textSize(random(300, 300));
  textAlign(CENTER);
  text(int(random(10)), random(width), random(height));
  }


if( mouseButton == RIGHT ) {
 chara4(int(x-50), int(y-70));
}
}


if ((keyPressed == true) && (key == 'q')) {
chara2(int(x-50), int(y-70));
}


if ((keyPressed == true) && (key == 'w')) {
chara3(int(x-50), int(y-70));
}


if ((keyPressed == true) && (key == 'e')) {
chara4(int(x-50), int(y-70));
}

  // if (mousePressed) {
  x=x+vx;
  y=y+vy;
  if (mousePressed) {
    if ((mouseX>x-25)&&(mouseX<x+25)&&(mouseY>y-25)&&(mouseY<y+25)) {
      x=mouseX;
      y=mouseY;
      vx=mouseX-pmouseX;
      vy=mouseY-pmouseY;
    }
    //if (mousePressed) {
    //background(mouseX, mouseY);
    //}
    //if(mousePressed){
    // if ((a>x-50)&&(a<x+50)&&(b>y-50)&&(b<y+50)) {
    // x=a;
    //  y=b;
    //}
  }
  if (x>width -80) {
    vx=-1;
  }
  if (x<80) {
    vx=3;
  }



  y=y+vy;

  if (mousePressed) {
    if (y>height -120) {
      vy=-3;
    }
    if (y<80) {
      vy=5;
    }
  }



  if (y>height -120) {
    vy=-3;
  }
  if (y<80) {
    vy=2;
  }
}
//}


void chara(int a, int b) {
  pushMatrix();
  translate(a, b);

//足
pushMatrix();
  translate(20,150);
  rotate(map(mouseX,0,400,0,3.14));
  fill(221, 71, 0);
  ellipse(0,40,25,80);
  //ellipse(20, 190, 25, 80);
  popMatrix();
  ellipse(80,190,25,80);
//end

  //Mimi
  fill(221, 71, 0);
  ellipse(0, 50, 30, 30);
  fill(221, 71, 0);
  ellipse(100, 50, 30, 30);
  //karada
  fill(221, 71, 0);
  ellipse(50, 130, 90, 90);
  stroke(0, 40, 100);
  fill(221, 71, 0);
  ellipse(50, 50, 90, 90);
  fill(255, 233, 178);
  ellipse(50, 58, 75, 75);
  //ellipse(50,40,70,70);
  //fill(255, 41, 116);
  fill(x,100,y);
  //rect(30,60,40,30,0,0,80,80);
  stroke(200, 0, 0);
  //fill(247,22,75);
  //line(20,40,40,40);
  //line(60,40,80,40);
  ellipse(20, 55, 20, 10);
  ellipse(80, 55, 20, 10);
  //fill(255,0,0);
  //rect(30,80,40,10,0,0,80,80);
  stroke(0, 0, 0);
  fill(0, 0, 0);
 // rect(25, 60, 50, 25);
  fill(255, 255, 255);
  //rect(20,65,10,10);
   fill(0, 0, 0);
  rect(25, 60, 50, max(mouseY-200,0 ));

  fill(255, 255, 255);
  //rect(20,65,10,10);
  rect(25, 60, 10, 10);
  rect(35, 60, 10, 10);
  rect(45, 60, 10, 10);
  rect(55, 60, 10, 10);
  rect(65, 60, 10, 10);
  rect(25, max(mouseY-150, 70), 10, 10);
  rect(35, max(mouseY-150, 70), 10, 10);
  rect(45, max(mouseY-150, 70), 10, 10);
  rect(55, max(mouseY-150, 70), 10, 10);
  rect(65, max(mouseY-150, 70), 10, 10);

  //ellipse(33, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(30, 33, 12, 23);
  //fill(255, 255, 255);
  //ellipse(67, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(64, 33, 12, 23);
  //fill(255, 0, 0);
  //ellipse(50, 45, 5, 5);
  //ellipse()
   ellipse(33, 33, 20, mouseX/10);
  //pushMatrix();
  // translate(mouseX,mouseY);
  fill(0, 0, 0);
  ellipse(30, 33, 12, mouseX/10);
  fill(255, 255, 255);
  //popMatrix();

  ellipse(67, 33, 20, mouseX/10);
  fill(0, 0, 0);
  ellipse(64, 33, 12, mouseX/10);
  fill(255, 0, 0);
  ellipse(50, 45, 5, 5);

  //pushMatrix();
  //translate(25,50);
  //rotate(map(mouseY,0,400,0,3.14));
  strokeWeight(2);

  pushMatrix();
  translate(10, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));

  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);

  popMatrix();

  pushMatrix();
  translate(90, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));
  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);
  popMatrix();

  popMatrix();
}


void chara2(int a, int b) {
  pushMatrix();
  translate(a, b);

textSize(60);
text("UKIKIKIKIIIIIIIIIIIIIIII!!!",-230,0);
//足
pushMatrix();
  translate(20,150);
  rotate(map(mouseX,0,400,0,3.14));
  fill(221, 71, 0);
  ellipse(0,40,25,80);
  //ellipse(20, 190, 25, 80);
  popMatrix();
  ellipse(80,190,25,80);
//end

  //Mimi
  fill(221, 71, 0);
  ellipse(0, 50, 30, 30);
  fill(221, 71, 0);
  ellipse(100, 50, 30, 30);
  //karada
  fill(221, 71, 0);
  ellipse(50, 130, 90, 90);
  stroke(0, 40, 100);
  fill(221, 71, 0);
  ellipse(50, 50, 90, 90);
  fill(255, 233, 178);
  ellipse(50, 58, 75, 75);
  //ellipse(50,40,70,70);
  //fill(255, 41, 116);
  fill(x,100,y);
  //rect(30,60,40,30,0,0,80,80);
  stroke(200, 0, 0);
  //fill(247,22,75);
  //line(20,40,40,40);
  //line(60,40,80,40);
  ellipse(20, 55, 20, 10);
  ellipse(80, 55, 20, 10);
  //fill(255,0,0);
  //rect(30,80,40,10,0,0,80,80);
  stroke(0, 0, 0);
  fill(0, 0, 0);
 // rect(25, 60, 50, 25);
  fill(255, 255, 255);
  //rect(20,65,10,10);
   fill(0, 0, 0);
  rect(25, 60, 50, max(mouseY-200,0 ));

  fill(255, 255, 255);
  //rect(20,65,10,10);
  rect(25, 60, 10, 10);
  rect(35, 60, 10, 10);
  rect(45, 60, 10, 10);
  rect(55, 60, 10, 10);
  rect(65, 60, 10, 10);
  rect(25, max(mouseY-150, 70), 10, 10);
  rect(35, max(mouseY-150, 70), 10, 10);
  rect(45, max(mouseY-150, 70), 10, 10);
  rect(55, max(mouseY-150, 70), 10, 10);
  rect(65, max(mouseY-150, 70), 10, 10);

  //ellipse(33, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(30, 33, 12, 23);
  //fill(255, 255, 255);
  //ellipse(67, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(64, 33, 12, 23);
  //fill(255, 0, 0);
  //ellipse(50, 45, 5, 5);
  //ellipse()
   ellipse(33, 33, 20, mouseX/10);
  //pushMatrix();
  // translate(mouseX,mouseY);
  fill(0, 0, 0);
  ellipse(30, 33, 12, mouseX/10);
  fill(255, 255, 255);
  //popMatrix();

  ellipse(67, 33, 20, mouseX/10);
  fill(0, 0, 0);
  ellipse(64, 33, 12, mouseX/10);
  fill(255, 0, 0);
  ellipse(50, 45, 5, 5);

  //pushMatrix();
  //translate(25,50);
  //rotate(map(mouseY,0,400,0,3.14));
  strokeWeight(2);

  pushMatrix();
  translate(10, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));

  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);

  popMatrix();

  pushMatrix();
  translate(90, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));
  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);
  popMatrix();

  popMatrix();
}


void chara3(int a, int b) {
  pushMatrix();
  translate(a, b);

fill(0);
textSize(100);
text("UKIKIKIKIIIIIIIIIIIIIIII!!!",-430,0);
//足
pushMatrix();
  translate(20,150);
  rotate(map(mouseX,0,400,0,3.14));
  fill(221, 71, 0);
  ellipse(0,40,25,80);
  //ellipse(20, 190, 25, 80);
  popMatrix();
  ellipse(80,190,25,80);
//end

  //Mimi
  fill(221, 71, 0);
  ellipse(0, 50, 30, 30);
  fill(221, 71, 0);
  ellipse(100, 50, 30, 30);
  //karada
  fill(221, 71, 0);
  ellipse(50, 130, 90, 90);
  stroke(0, 40, 100);
  fill(221, 71, 0);
  ellipse(50, 50, 90, 90);
  fill(255, 233, 178);
  ellipse(50, 58, 75, 75);
  //ellipse(50,40,70,70);
  //fill(255, 41, 116);
  fill(x,100,y);
  //rect(30,60,40,30,0,0,80,80);
  stroke(200, 0, 0);
  //fill(247,22,75);
  //line(20,40,40,40);
  //line(60,40,80,40);
  ellipse(20, 55, 20, 10);
  ellipse(80, 55, 20, 10);
  //fill(255,0,0);
  //rect(30,80,40,10,0,0,80,80);
  stroke(0, 0, 0);
  fill(0, 0, 0);
 // rect(25, 60, 50, 25);
  fill(255, 255, 255);
  //rect(20,65,10,10);
   fill(0, 0, 0);
  rect(25, 60, 50, max(mouseY-200,0 ));

  fill(255, 255, 255);
  //rect(20,65,10,10);
  rect(25, 60, 10, 10);
  rect(35, 60, 10, 10);
  rect(45, 60, 10, 10);
  rect(55, 60, 10, 10);
  rect(65, 60, 10, 10);
  rect(25, max(mouseY-150, 70), 10, 10);
  rect(35, max(mouseY-150, 70), 10, 10);
  rect(45, max(mouseY-150, 70), 10, 10);
  rect(55, max(mouseY-150, 70), 10, 10);
  rect(65, max(mouseY-150, 70), 10, 10);

  //ellipse(33, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(30, 33, 12, 23);
  //fill(255, 255, 255);
  //ellipse(67, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(64, 33, 12, 23);
  //fill(255, 0, 0);
  //ellipse(50, 45, 5, 5);
  //ellipse()
   ellipse(33, 33, 20, mouseX/10);
  //pushMatrix();
  // translate(mouseX,mouseY);
  fill(0, 0, 0);
  ellipse(30, 33, 12, mouseX/10);
  fill(255, 255, 255);
  //popMatrix();

  ellipse(67, 33, 20, mouseX/10);
  fill(0, 0, 0);
  ellipse(64, 33, 12, mouseX/10);
  fill(255, 0, 0);
  ellipse(50, 45, 5, 5);

  //pushMatrix();
  //translate(25,50);
  //rotate(map(mouseY,0,400,0,3.14));
  strokeWeight(2);

  pushMatrix();
  translate(10, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));

  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);

  popMatrix();

  pushMatrix();
  translate(90, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));
  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);
  popMatrix();

  popMatrix();
}


void chara4(int a, int b) {
  pushMatrix();
  translate(a, b);
 strokeWeight(3);
fill(255);
textSize(200);
text("THANK YOU♪",0,0);


//足
pushMatrix();
  translate(20,150);
  fill(#FEFF24);
 
  ellipse(30,-40,300,300);
  
  rotate(map(-mouseX,0,400,0,3.14));
  fill(221, 71, 0);
  ellipse(0,40,25,80);
  //ellipse(20, 190, 25, 80);
  popMatrix();
  ellipse(80,190,25,80);
//end

  //Mimi
  fill(221, 71, 0);
  ellipse(0, 50, 30, 30);
  fill(221, 71, 0);
  ellipse(100, 50, 30, 30);
  //karada
  fill(221, 71, 0);
  ellipse(50, 130, 90, 90);
  stroke(0, 40, 100);
  fill(221, 71, 0);
  ellipse(50, 50, 90, 90);
  fill(255, 233, 178);
  ellipse(50, 58, 75, 75);
  //ellipse(50,40,70,70);
  //fill(255, 41, 116);
  fill(x,100,y);
  //rect(30,60,40,30,0,0,80,80);
  stroke(200, 0, 0);
  //fill(247,22,75);
  //line(20,40,40,40);
  //line(60,40,80,40);
  ellipse(20, 55, 20, 10);
  ellipse(80, 55, 20, 10);
  //fill(255,0,0);
  //rect(30,80,40,10,0,0,80,80);
  stroke(0, 0, 0);
  fill(0, 0, 0);
 // rect(25, 60, 50, 25);
  fill(255, 255, 255);
  //rect(20,65,10,10);
   fill(0, 0, 0);
 // rect(25, 60, 50, 200);

  fill(255, 255, 255);
  //rect(20,65,10,10);
  rect(25, 60, 10, 10);
  rect(35, 60, 10, 10);
  rect(45, 60, 10, 10);
  rect(55, 60, 10, 10);
  rect(65, 60, 10, 10);
  rect(25,  70, 10, 10);
  rect(35, 70, 10, 10);
  rect(45, 70, 10, 10);
  rect(55,  70, 10, 10);
  rect(65, 70, 10, 10);

  //ellipse(33, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(30, 33, 12, 23);
  //fill(255, 255, 255);
  //ellipse(67, 33, 20, 40);
  //fill(0, 0, 0);
  //ellipse(64, 33, 12, 23);
  //fill(255, 0, 0);
  //ellipse(50, 45, 5, 5);
  //ellipse()
   ellipse(33, 33, 20, mouseY/10);
  //pushMatrix();
  // translate(mouseX,mouseY);
  fill(0, 0, 0);
  ellipse(30, 33, 12, mouseY/10);
  fill(255, 255, 255);
  //popMatrix();

  ellipse(67, 33, 20, mouseY/10);
  fill(0, 0, 0);
  ellipse(64, 33, 12, mouseY/10);
  fill(255, 0, 0);
  ellipse(50, 45, 5, 5);

  //pushMatrix();
  //translate(25,50);
  //rotate(map(mouseY,0,400,0,3.14));
  strokeWeight(2);

  pushMatrix();
  translate(10, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));

  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);

  popMatrix();

  pushMatrix();
  translate(90, 100);
  rotate(map(mouseX, 0, 400, 0, 3.14));
  fill(221, 71, 0);
  ellipse(40, 0, 80, 20);
  popMatrix();

  popMatrix();
}

void en(int a,int b){
  
  rotate(map(mouseX, 0, 400, 0, 6.28));
      fill(x,y,0);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
rotate(PI/6);
triangle(550,0,630,-15,630,15);
  
  
}





