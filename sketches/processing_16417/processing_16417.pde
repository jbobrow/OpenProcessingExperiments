

int card = 0; 
int textX = 500;
int textY = 430;
PFont f; 
PImage img;
PImage img1;

void setup() {
  size(640, 480);
  smooth();
  noStroke();

  f = loadFont("Arial-BoldMT-32.vlw");
  textFont(f);
  img= loadImage("tree.png");
  img1= loadImage("tree02.png");
}

void draw() {

  if (card == 0) {
    background(255);
    text("Start",textX, textY);
    /*   
     code here to draw something for the first page,     
     or create page funtions such as 
     cardOne();
     */

    background(180);
    noStroke();
    fill(255);
    rect(100,0,30,430);
    fill(0);
    rect(0,430,width,height);
    image(img,60,30,600,400);
    for(float a=100; a<=180; a+=1) {

      float u= random(80,580);
      float k= random(100,270);
      float z= random(0.07,0.15);

      maple(u,k,z,k,a,130);
      maple(u,k,z,k,a,130);
    }
  }  
  else if (card == 1) {  

    background(210);

    text("Card1", textX, textY);
    cardTwo();
    image(img,60,30,600,400);
    for(float a=100.0; a<=180.0; a+=1) {

      float u= random(80,580);
      float k= random(100,270);
      float z= random(0.07,0.15);

      maple(u,k,z,k,a,50);
      maple(u,k,z,k,a,50);
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
      text("Card2", textX, textY);
    }
  }
  else if (card  == 3) { 
    background(150);

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

      text("Card3", textX, textY);
    }
  }
  else if (card  == 4) {  



    background(255);


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

      text("Card4", textX, textY);
    }
  } 
  else if (card  == 5) {  
     background(255);
  
  
  image(img1,20,100,600,300);
  for(float a=130; a<=200; a+=0.2){
  
  float u= random(50,550);
  float u1= random(100,500);
  float u2= random(0,700);
  float k= random(180,320);
  float k1= random(130,290);
  float k2= random(360,400);
  float z= random(0.05,0.1);
  
  float h= random(0,150);
  
  
  maple(u2,k2,z,k,a,h);
}
    text("Card5", textX, textY);
 
 
  } 
  else if (card  == 6) {  
    background(40);
    text("Card6",textX, textY);
  } 
  else if (card == 7) {  
    background(0);
    text("Card7", textX, textY);
  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
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


