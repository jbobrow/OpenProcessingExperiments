

int card = 0; 
int textX = 30;
int textY = 450;
PFont f; 
PImage img;
PImage img1;
PImage img2;
PImage img3;

void setup() {
  size(640, 480);
  smooth();
  noStroke();

  f = loadFont("BookmanOldStyle-Italic-17.vlw");
  textFont(f);
  img= loadImage("tree.png");
  img1= loadImage("tree02.png");
  img2= loadImage("people1.png");
  img3= loadImage("book.jpg");
}

void draw() {

  if (card == 0) {

    background(223);
    fill(180);
    rect(130,0,width,480);
    rect(80,0,-width,480);
    filter(BLUR,10);
    fill(255);
    rect(100,0,20,480);
    filter(BLUR,5);
    fill(255);
    rect(103,0,10,480);

    /*   
     code here to draw something for the first page,     
     or create page funtions such as 
     cardOne();
     */


    noStroke();

    fill(0);
    rect(0,430,width,height);
    image(img,60,30,600,400);
    for(float a=100; a<=180; a+=1) {

      float u= random(80,580);
      float k= random(100,270);
      float z= random(0.07,0.15);

      maple(u,k,z,k,a,130);
      maple(u,k,z,k,a,130);
      text("The back yard that nobody comes..",textX, textY);
      noLoop();
    }
  }  
  else if (card == 1) {  

    background(255);
    fill(164, 202, 234);
    rect(0,0,width,50);
    filter(BLUR,30);

    fill(0);
    rect(0,430,width,height);


    image(img,60,30,600,400);
    for(float a=100.0; a<=180.0; a+=1) {

      float u= random(80,580);
      float k= random(100,270);
      float z= random(0.07,0.15);

      maple(u,k,z,k,a,50);
      maple(u,k,z,k,a,50);
      text("There is a maple tree whose dream is to spread in red an autumn days.", textX, textY);
      cardTwo();
      noLoop();
    }
  } 

  else if (card  == 2) {  

    background(255);


    image(img1,60,30,500,300);
    for(float a=50; a<=180; a+=0.5) {

      float u= random(80,520);
      float u1= random(120,480);
      float k= random(80,240);
      float k1= random(50,240);
      float z= random(0.05,0.1);

      maple(u,k,z,k,a,100);
      maple(u1,k1,z,k,a,150);

      fill(180);
      rect(0,0,170,480);

      rect(450,0,300,480);
      
      maple(500,350,1.5,-30,50,150);
      fill(0);
      rect(0,430,width,height);
      fill(255);
      text("He was always jelous of the maple trees in the plaza.", textX, textY);
      text("'I  want to be a gorgeous foliage like them ...'", textX, 475);
      noLoop();
    }
  }
  else if (card  == 3) { 
    background(255);
    fill(164, 202, 234);
    rect(0,0,width,50);
    filter(BLUR,30);
    image(img1,20,100,600,300);
    for(float a=130; a<=200; a+=0.3) {

      float u= random(50,550);
      float e= random(100,500);
      float k= random(180,320);
      float k1= random(130,290);
      float z= random(0.05,0.1);
      float h= random(130,200);
      maple(u,k,z,k,a,h);
      maple(e,k1,z,k,a,h);

      text("The Fall is comming after the maple trees were beautifully covered  ", textX, textY);
      text("with autumn leaves in the plaza..", textX, 475);
      noLoop();
    }
  }
  else if (card  == 4) {  



    background(255);

    fill(164, 202, 234);
    rect(0,0,width,50);
    filter(BLUR,30);
    image(img1,20,100,600,300);
    for(float a=130; a<=200; a+=0.5) {

      float u= random(50,550);
      float u1= random(100,500);
      float u2= random(-300,900);
      float k= random(180,320);
      float k1= random(130,290);
      float k2= random(370,400);
      float z= random(0.05,0.1);

      float h= random(50,200);
      maple(u,k,z,k,a,h);
      maple(u1,k1,z,k,a,h);
      maple(u2,k2,z,k,a,h);

      text("Square's maple trees are getting red..", textX, textY);
      noLoop();
    }
  } 
  else if (card  == 5) {  
    background(255);
    fill(164, 202, 234);
    rect(0,0,width,50);
    filter(BLUR,30);

    image(img1,20,100,600,300);
    for(float a=130; a<=200; a+=0.2) {

      float u= random(50,550);
      float u1= random(100,500);
      float u2= random(0,700);
      float k= random(180,320);
      float k1= random(130,290);
      float k2= random(360,400);
      float z= random(0.05,0.1);

      float h= random(0,150);


      maple(u2,k2,z,k,a,h);
      text(" As time goes by, when autumn almost disappeared...", textX, textY);
      noLoop();
    }
  } 
  else if (card  == 6) {  
    background(223);
    fill(180);
    rect(130,0,width,480);
    rect(80,0,-width,480);
    filter(BLUR,10);
    fill(255);
    rect(100,0,20,480);
    filter(BLUR,5);
    fill(255);
    rect(103,0,10,480);

    fill(0);
    rect(0,430,width,height);
    image(img,60,30,600,400);

    for(float a=180; a<=200; a+=0.4) {

      float u= random(50,600);
      float u1= random(100,500);
      float u2= random(0,680);
      float k= random(180,280);
      float k1= random(130,270);
      float k2= random(428,430);
      float z= random(0.05,0.1);

      float h= random(0,150);

      maple(u,k,z,k,a,h);
      maple(u1,k1,z,k,a,h);
      maple(u2,k2,z,k,a,h);
      text("The Fall has stolen up on him and only then did he turned red under fences.",textX, textY);
      noLoop();
    }
  } 
  else if (card == 7) {  
    background(223);
    fill(180);
    rect(130,0,width,480);
    rect(80,0,-width,480);
    filter(BLUR,10);
    fill(255);
    rect(100,0,20,480);
    filter(BLUR,5);
    fill(255);
    rect(103,0,10,480);

    fill(0);
    rect(0,430,width,height);
    image(img,60,30,600,400);
    image(img2,120,280,50,150);
    for(float a=180; a<=200; a+=0.4) {

      float u= random(50,600);
      float u1= random(100,500);
      float u2= random(0,680);
      float k= random(180,280);
      float k1= random(130,270);
      float k2= random(420,430);
      float z= random(0.05,0.1);

      float h= random(0,150);

      maple(u,k,z,k,a,h);
      maple(u1,k1,z,k,a,h);
      maple(u2,k2,z,k,a,h);
      maple(170,280,0.1,30,200,30);
      text("The back yard that nobody seem to comes.", textX, textY);
      noLoop();
    }
  }

  else if (card == 8) {   
    background(0);


    image(img3,60,60,400,300);


    maple(100,100,0.5,120,0,0);
    maple(100,350,1,0,0,0);
    maple(350,370,0.7,20,0,0);
    maple(500,170,0.7,20,0,0);



fill(255);
    text("He is no more jealous of the maple trees in the plaza.", textX, textY);
  }
}




void mousePressed() {  

  if (card == 0) {  
    card = 1;
    loop();
  } 
  else if (card == 1) {  
    card = 2;
    loop();
  }
  else if (card == 2) {
    card = 3;
    loop();
  }
  else if (card == 3) {
    card = 4;
    loop();
  }  
  else if (card == 4) {
    card = 5;
    loop();
  }  
  else if (card == 5) {
    card = 6;
    loop();
  } 
  else if (card == 6) {
    card = 7;
    loop();
  }
  else if (card == 7) {
    card = 8;
    loop();
  }
  else if (card == 8) {
    card = 0;
    loop();
  }
}




void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


void maple(float x, float y,float s,float r,float c,float g) {
  noStroke();
  pushMatrix();
  translate(x,y);
  scale(s);
  rotate(radians(r));
  fill(c,g,0);
  smooth();
  strokeWeight(1);

  beginShape();
  vertex(0,-150);
  bezierVertex(-20,-40,-40,-30,-15,0);
  bezierVertex(-50,-50,-50,-30,-120,-70);
  bezierVertex(-70,-10,-70,20,-25,20);
  bezierVertex(-120,30,-70,70,-120,100);
  bezierVertex(-120,100,-90,100,-15,40);
  bezierVertex(-10,40,-30,40,-40,80);
  bezierVertex(-10,60,-10,60,-2,45);
  bezierVertex(-2,120,-10,160,0,150);
  endShape();


  translate(200,-200);
  beginShape();
  vertex(-200,50);
  bezierVertex(-170,150,-170,170,-185,200);
  bezierVertex(-150,150,-150,150,-60,130);
  bezierVertex(-130,210,-150,220,-175,220);
  bezierVertex(-80,230,-110,250,-80,300);
  bezierVertex(-80,300,-110,300,-185,240);
  bezierVertex(-190,240,-170,240,-160,280);
  bezierVertex(-190,260,-190,260,-198,245);
  bezierVertex(-198,300,-190,360,-200,350);
  endShape();
  popMatrix();
}


