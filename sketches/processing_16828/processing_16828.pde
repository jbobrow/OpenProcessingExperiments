
int card = 0;  

PFont f;
int x = 550;
int y =320;



PImage aa;
PImage ba;  

PImage bb;  

PImage bc;  

PImage bd;  

PImage be;  

PImage bf;  

PImage bg;  

PImage bh;  

PImage bi;  

PImage bj;  

PImage vacuume;

PImage trashcan;

PImage frame;







void setup() {  

  size(700,700);  
  f = loadFont("ArialMT-48.vlw");
  textFont(f);


  smooth();  

  noStroke();  

  aa = loadImage("aa.png");

  ba = loadImage("ba.png");  

  bb = loadImage("bb.png");  

  bc = loadImage("bc.png");  

  bd = loadImage("bd.png");  

  be = loadImage("be.png");  

  bf = loadImage("bf.png");  

  bg = loadImage("bg.png");  

  bh = loadImage("bh.png");  

  bi = loadImage("bi.png");  

  bj = loadImage("bj.png");

  vacuume = loadImage("vacuume.png");

  trashcan = loadImage("trashcan.png");

  frame = loadImage("frame.png");



  smooth();
}  

void draw() {  

  noStroke();  

  if (card == 0) {  



    image(bi, -45, 0,1070,1000) ;  
    text("The Trashcan's Life",150,200);


    stroke(0,200,0,80);    

    strokeWeight(5);    



    fill(0,10,80);    







    quad(342,385,480,435,400,500,265,417);  









    stroke(255,255,255);    



    strokeWeight(5);    



    fill(0,70,80);    



    quad(260,420,400,500,400,665,285,560);  









    stroke(255,255,500);    



    strokeWeight(5);    



    fill(0,70,80);    

    quad(260,420,400,500,400,665,285,560);  









    stroke(255,255,500);    



    strokeWeight(5);    



    fill(0,70,80);    



    quad(400,500,480,440,460,560,400,660);
  }  





  else if (card == 1) {  





    image(ba, -45, 0, 1070,1000) ;  

    stroke(0,200,0,80);    



    strokeWeight(5);    



    fill(0,10,80);    


    quad(342,385,480,435,400,500,265,417);  

    stroke(0,0,0,0);  

    strokeWeight(5);  

    fill(255,255,255);  



    ellipse(360,430,40,40);  

    ellipse(390,465,70,70);  

    ellipse(340,460,50,50);  

    ellipse(430,480,40,40);  











    stroke(255,255,255);    



    strokeWeight(5);    



    fill(0,70,80);    



    quad(260,420,400,500,400,665,285,560);  









    stroke(255,255,500);    



    strokeWeight(5);    



    fill(0,70,80);    



    quad(400,500,480,440,460,560,400,660);

    text("The Trashcan has been filled",50,650);
  }  





  if (card == 2) {  



    image(bc, -69, 0,1186,1000) ;
    text("Kicked over here",50,650);
  }  





  if (card == 3) {  



    image(bd, -45, 0,1070,1000) ;

    text(" And there",430,650);
  }  



  if (card == 4) {  



    image(be, -45, 0,1070,1000) ;


    stroke(255,255,500);    



    strokeWeight(5);    


    fill(0,70,80);    

    text(" poor trashcan...",80,100);  
    text(" would you help him?",80,140);  
    fill(255,0,0);
    text(" yes",500,290);  
    fill(255,0,0);
    ellipse(x,y,40, 40);
    text(" no",400,550);  



    fill(255,0,0);
    ellipse(440, 580, 40, 40);
    /*
     image(bc, -69, 0,1186,1000) ;
     image(bd, -45, 0,1070,1000) ;
     
     image(be, -45, 0,1070,1000) ;
     */
  }  



  if (card == 5) {  



    image(bf, -45, 0,1070,1000) ;
  }  



  if (card == 6) {  



    image(bg, -45,0,1070,1000) ;
  }  



  if (card == 7) {  



    image(bh, -45, 0,1070,1000) ;
  }  

  if (card == 8) {  



    image(bi, -45, 0,1070,1000) ;
  }  



  if (card == 9) {  



    image(bj, -45, 0,1070,1000) ;

    stroke(255,255,500);    



    strokeWeight(5);    


    fill(0,70,80);    

    text(" thanks!!",450,480);
  }

  if (card == 10) {  
    image(bc, -69, 0,1186,1000) ;
  }
  if (card == 11) {  
    image(bd, -69, 0,1186,1000) ;
  }
  if (card == 12) {  
    image(be, -69, 0,1186,1000) ;
    stroke(255,255,500);    



    strokeWeight(5);    


    fill(0,70,80);    

    text("It's all because of you....",80,100);
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

    if((mouseX > 530) && (mouseX < 570) && (mouseY > 300) && (mouseY < 340)) {  

      card = 5;
    }  

    else if((mouseX> 400) && (mouseX<460)&& (mouseY > 560) && (mouseY < 600)) {  

      card = 11;
    }
    else card = 5;
  }
  else if (card == 5) {    



    card = 6;
  }     



  else if (card == 6) {    



    card = 7;
  }    



  else if (card == 7) {    



    card = 8;
  }    



  else if (card == 6) {    



    card = 7;
  }    



  else if (card == 7) {    



    card = 8;
  }    



  else if (card == 6) {    



    card = 7;
  }    



  else if (card == 7) {    



    card = 8;
  }    



  else if (card == 6) {    



    card = 7;
  }    



  else if (card == 7) {    



    card = 8;
  }    





  else if (card == 6) {    



    card = 7;
  }    



  else if (card == 7) {    



    card = 8;
  }    



  else if(card == 8) {  



    card = 9;
  }  

  else if (card == 9) {  

    card = 0;
  }
  else if (card == 11) {  

    card = 12;
  }
  else if (card == 12) {  

    card = 0;
}  }



