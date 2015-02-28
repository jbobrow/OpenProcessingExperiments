

int card = 0; 
int textX = 30;
int textY = 450;
int Mx=500;
int My=420;

int Mx1=580;
int My1=420;

int down=0;
int side=0;
int rt=0;
int rt1=0;

PFont f;

PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(640, 480);
  smooth();
  noStroke();

  f= loadFont("AgencyFB-Bold-25.vlw");
  img= loadImage("tree.png");
  img1= loadImage("tree02.png");
  img2= loadImage("people1.png");
  img3= loadImage("book.jpg");
  img4= loadImage("sky.jpg");
}

void draw() {

  if (card  == 0) { 
    image(img4,0,0,width,height);
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

      //11111111111111111111111111111111
    }
  }
  else if (card  == 1) {  



    image(img4,0,0,width,height);

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


      fill(0);
      ellipse(Mx,My,20,20);
      text("Click       >                    or           ",420,425);
      noFill();
      stroke(0.5);
      ellipse(Mx1,My1,20,20);
      noLoop();
      noLoop();
      //22222222222222222222222222222222222222
    }
  } 
  else if (card  == 2) {  

    image(img4,0,0,width,height);

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
      noLoop();
      //333333333333333333333333333333333333333333333333333333
    }
  } 
  else if (card  == 3) {  
    noStroke();
    image(img4,0,0,width,height);
    image(img1,90,180,550,250);
    image(img1,250,180,550,250);
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
noLoop();
      
      //4444444444444444444444444444444444444
    }
  } 
  else if (card == 4) {  
    image(img1,90,180,550,250);
    image(img1,250,180,550,250);


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

     


      noLoop();
      //55555555555555555555555
    }
  }

  else if (card == 5) {   
    background(0);


    image(img3,60,60,400,300);


    maple(100,100,0.5,120,0,0);
    maple(100,350,1,0,0,0);
    maple(350,370,0.7,20,0,0);
    maple(500,170,0.7,20,0,0);



    fill(255);
    //6666666666666666666666666666
  }
  else if (card  ==6) {  

    image(img4,0,0,width,height);
    frameRate(50);
    maple(side++,down++,0.7,rt++,220,30);
    for(int i=10; i<=width; i+=20) {
      float ra=random(20);
      float ca=random(200);
      maple(i,down*ra,0.3,rt1++,200,ca);
    }
    if((side>width)||(down>height))
      side=0;
    if((side>width)||(down>height))
      down=0;


    //maple drop
  }
}





void mousePressed() {  

  if (card == 0) {
    card=1;
    loop();
  }

  else if (card == 1) {  
    float d = dist(mouseX, mouseY, Mx, My);
    float d1 = dist(mouseX, mouseY, Mx1, My1);
    if (d < 20) {  
      card = 6;
      loop();
    }
    if (d1 < 20) {  
      card = 3;
      loop();
    }
  }
  else if (card == 3) {
    card = 4;
    loop();
  }

  else if (card == 4) {
    card = 5;
    loop();
  }  ///////////////////////////
  else if (card == 5) {
    card = 0;
    loop();
  }
  else if (card == 6) {
    card = 2;
    loop();
  }
  else if (card == 2) {
    card = 0;
    loop();
  }
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


