
int card = 0; 
int textX = 400;
int textY = 530;
PFont f; 

float a = 245;

void setup(){
  size(600,600);
   f = loadFont("Arial-BoldMT-32.vlw");
  textFont(f);
  smooth();
}
void draw(){
   if (card == 0) {
    background(255,250,0);
      
  fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);

fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

strokeWeight(4);
line(305,70,300,100);
strokeWeight(4);
line(135,140,158,158);
strokeWeight(4);
line(220,115,200,90);
strokeWeight(4);
line(85,220,110,235);
strokeWeight(4);
line(440,120,420,140);
strokeWeight(4);
line(460,180,490,170);
strokeWeight(4);
line(490,230,520,220);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);
    text("eyelash",textX, textY);
   
  }  
  
  else if (card == 1) {  
    background(255,250,0);
      fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);


fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

strokeWeight(4);
line(305,70,300,100);
strokeWeight(4);
line(135,140,158,158);
strokeWeight(4);
line(220,115,200,90);
strokeWeight(4);
line(85,220,110,235);
strokeWeight(4);
line(440,120,420,140);
strokeWeight(4);
line(460,180,490,170);
strokeWeight(4);
line(490,230,520,220);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);

strokeWeight(2);
line(150,220,170,230);
strokeWeight(2);
line(145,230,170,230);
strokeWeight(2);
line(160,210,170,230);
strokeWeight(2);
line(450,220,430,230);
strokeWeight(2);
line(455,230,430,230);
strokeWeight(2);
line(440,210,430,230);

  text("perm", textX, textY);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(255,250,0);
    fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);

fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

fill(255,250,0);
strokeWeight(4);
ellipse(300,80,40,40);
strokeWeight(4);
ellipse(146,149,40,40);
strokeWeight(4);
ellipse(210,102,40,40);
strokeWeight(4);
ellipse(97,214,40,40);
strokeWeight(4);
ellipse(433,125,40,40);
strokeWeight(4);
ellipse(480,175,40,40);
strokeWeight(4);
ellipse(508,225,40,40);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);

strokeWeight(2);
line(150,220,170,230);
strokeWeight(2);
line(145,230,170,230);
strokeWeight(2);
line(160,210,170,230);
strokeWeight(2);
line(450,220,430,230);
strokeWeight(2);
line(455,230,430,230);
strokeWeight(2);
line(440,210,430,230);

fill(255,50,0);

    text("laugh", textX, textY);
  }
  
    else if (card  == 3) {  
    background(255,250,0);
    fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);

fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

fill(255,250,0);
strokeWeight(4);
ellipse(300,80,40,40);
strokeWeight(4);
ellipse(146,149,40,40);
strokeWeight(4);
ellipse(210,102,40,40);
strokeWeight(4);
ellipse(97,214,40,40);
strokeWeight(4);
ellipse(433,125,40,40);
strokeWeight(4);
ellipse(480,175,40,40);
strokeWeight(4);
ellipse(508,225,40,40);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);

strokeWeight(2);
line(150,220,170,230);
strokeWeight(2);
line(145,230,170,230);
strokeWeight(2);
line(160,210,170,230);
strokeWeight(2);
line(450,220,430,230);
strokeWeight(2);
line(455,230,430,230);
strokeWeight(2);
line(440,210,430,230);

fill(255,50,0);
strokeWeight(1);
triangle(280,315,320,315,300,400);
    text("runny nose", textX, textY);
  }
  else if (card  == 4) { 
    background(255,250,0);
      fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);

fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

fill(255,250,0);
strokeWeight(4);
ellipse(300,80,40,40);
strokeWeight(4);
ellipse(146,149,40,40);
strokeWeight(4);
ellipse(210,102,40,40);
strokeWeight(4);
ellipse(97,214,40,40);
strokeWeight(4);
ellipse(433,125,40,40);
strokeWeight(4);
ellipse(480,175,40,40);
strokeWeight(4);
ellipse(508,225,40,40);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);

strokeWeight(2);
line(150,220,170,230);

strokeWeight(2);
line(150,220,170,230);
strokeWeight(2);
line(145,230,170,230);
strokeWeight(2);
line(160,210,170,230);
strokeWeight(2);
line(450,220,430,230);
strokeWeight(2);
line(455,230,430,230);
strokeWeight(2);
line(440,210,430,230);

fill(255,50,0);
strokeWeight(1);
triangle(280,315,320,315,300,400);

float x = 50;
float y = 100;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 50;

strokeWeight(15);
  a = a + 2;
  if (a < 0) { 
    a = height; 
  }
  line(320,245,320, a);  
    
    
    text("end", textX, textY);
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

  
  
 

