
PImage rbc;  

PImage rbc2;  

PImage wbc1;  

PImage love1;  

PImage fight1;  

PImage virus1;

PFont alswl;  

int card = 0;  

PImage Backgroundimage;



void setup() {  

  size(600,600);  

  noStroke();  

  background(255);
}  

int wbc1_begin=100;
int wbc1_end=350;
int wbc1_x=230;
int wbc1_xMove=4;

void draw() {  

  Backgroundimage = loadImage("bg1.png");
  background(Backgroundimage);
  float cellA = random(30,40);
  float cellB = random(30,40);
  float a1 = random(1,3);  

  float a2 = random(0.5,0.7);  

  float a3 = random(0.5, 0.7);  

  float c = random(1,1.1);
  float c2 = random(1,1.1);
  if (card == 0) {  

    alswl = loadFont("Candara-20.vlw");  

    textFont(alswl);  

    fill(255);  

    textSize(20);  

    text("Two Red Blood Sell loves White Blood Sell......", 30,30);   
    fill(240,121,121,40);
    ellipse(320,100,cellA+10+a1,cellB+10+a1);
    fill(240,121,121,80);
    ellipse(310,110,cellA,cellB);
    fill(252,141,141,100);
    ellipse(110,450,cellA+50,cellB+50); 



    rbc1(80,100,a1,a1,c);  

    rbc2(420,130,a1,a1,c2);  

    wbc1(230,350,a1,a1);  

    love1(230, 250,a2,a1,a1);   

    love1(320, 250,a3,a1,a1);
  }  



  else if (card == 1) {  
    Backgroundimage = loadImage("bg1.png");
    background(Backgroundimage);


    loadFont("Candara-20.vlw");  

    textFont(alswl);  

    fill(255);  

    textSize(20);  

    text("Two Red Blood Sell fight each other", 30,30);   

    fill(240,121,121,40);
    ellipse(320,100,cellA+10+a1,cellB+10+a1);
    fill(240,121,121,80);
    ellipse(310,110,cellA,cellB); 
    fill(252,141,141,100);
    ellipse(110,450,cellA+50,cellB+50);
    fight1(250, 220,a3,a1,a1);  

    rbc1(80,100,a1,a1,c);  

    rbc2(420,130,a1,a1,c2);  

    wbc1(wbc1_x,350,a1,a1);
    wbc1_x+=wbc1_xMove;
    if(wbc1_x<=wbc1_begin || wbc1_x>=wbc1_end) {
      wbc1_xMove=-wbc1_xMove;
    }

    println(wbc1_x);
  }

  else if (card == 2) {

    loadFont("Candara-20.vlw");  

    textFont(alswl);  

    fill(255);  

    textSize(a1+30);  

    text("Suddenly, The Virus is invade", 30,30); 

    virus1(250,250,a1,a1,c2);
  }
}  
















void rbc1(int x, int y,float a, float b, float c) {  

  pushMatrix();  

  translate(x,y);  



  rbc = loadImage("rbc1.png");  

  scale(c);
  image(rbc, a,b);  




  popMatrix();
}  

void rbc2(int x, int y,float a, float b,float c) {  

  pushMatrix();  

  translate(x,y);  



  rbc2 = loadImage("rbc2.png");  
  scale(c);
  image(rbc2,a,b);  

  popMatrix();
}  

void wbc1(int x, int y,float a, float b) {  

  pushMatrix();  

  translate(x,y);  



  wbc1 = loadImage("wbc1.png");  

  image(wbc1,a,b);  

  popMatrix();
}  



void love1(int x, int y,float s,float a, float b) {  

  pushMatrix();  

  translate(x,y);  

  scale(s);  

  love1 = loadImage("love1.png");  

  image(love1,a,b);  

  popMatrix();
}  
void virus1(int x, int y,float s,float a, float b) {  

  pushMatrix();  

  translate(x,y);  

  scale(s);  

  virus1 = loadImage("virus1.png");  

  image(virus1,a,b);  

  popMatrix();
}  

void fight1(int x, int y,float s,float a, float b) {  

  pushMatrix();  

  translate(x,y);  

  scale(s);  

  fight1 = loadImage("fight1.png");  

  image(fight1,a,b);  

  popMatrix();
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


