
float x=random(200);
float y=random(200);
float randomx=Y+40;
float randomy=x+50;
int[] xpos=new int[50];  
int[] ypos=new int[50];
int[] xpos1=new int[50];  
int[] ypos1=new int[50];
int[] xpos2=new int[50];  
int[] ypos2=new int[50];
int[] xpos3=new int[50];  
int[] ypos3=new int[50];
int[] xpos4=new int[50];  
int[] ypos4=new int[50];
int[] xpos5=new int[50];  
int[] ypos5=new int[50];
int[] xpos6=new int[50];  
int[] ypos6=new int[50];
int[] xpos7=new int[50];  
int[] ypos7=new int[50];
int[] xpos8=new int[50];  
int[] ypos8=new int[50];
int[] xpos9=new int[30];  
int[] ypos9=new int[10];
int[] xpos10=new int[30];  
int[] ypos10=new int[10];
int j=350; //x coordinatefor ellipse
int k=50; //y coordinate for ellipse



int leftSide;
//int value = 0;
int playerx;
int playery;
int movex;   //Right and Left
int movey;   //Up and Down 
//int enemysize=20;
//int getRandomX()
 

//int[]enemy= {
  // getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
 
PImage img;

void setup() {
  img = loadImage("outerspace.jpg");
  
  background(50);
  ellipseMode(CENTER);
  

  playerx=400;
  playery=690;
  size(800, 800);
  fill(0, 200, 0);
 // for (int i = 0; i < 50; i= +1) {
    //int r =int(random(0, -300));
   // int leftSide=int(random(0, 700));
   // xpos[i]=r;
    //ypos[i]=leftSide;
  }


void draw() {

image(img, 0, 0);
  //background(50);
  //int r=int(random(0, 200));
  
  
  for (int i = 0; i < 10; i= i+1) {
    fill(0, 250, 0);
    rect(xpos[i], ypos[i], 100, 100);
    fill(0, 250, 0);
    rect(xpos1[i], ypos[i], 65, 65);
    fill(0, 250, 0);
    rect(xpos2[i], ypos2[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos3[i], ypos3[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos4[i], ypos4[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos5[i], ypos5[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos6[i], ypos6[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos7[i], ypos7[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos8[i], ypos8[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos9[i], ypos9[i], 50, 50);
     fill(0, 250, 0);
    rect(xpos10[i], ypos10[i], 30, 30);
    xpos[i]+=1;
    ypos[i]+=1;
    xpos1[i]+=4;
    ypos1[i]+=4;
    xpos2[i]+=4;
    ypos2[i]+=4;
    xpos3[i]+=4;
    ypos3[i]+=4;
    xpos4[i]+=4;
    ypos4[i]+=4;
    xpos5[i]+=4;
    ypos5[i]+=4;
    xpos6[i]+=3;
    ypos6[i]+=3;
    xpos7[i]+=2;
    ypos7[i]+=2;
    xpos8[i]+=7;
    ypos8[i]+=7;
    xpos9[i]+=6;
    ypos9[i]+=6;
  
     
    xpos10[i]+=1;
    ypos10[i]+=1;
    



  if (xpos[i]<playerx+50 && xpos[i]>playerx-50 && ypos[i]<playery+50 && ypos[i]>playery-50) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);
    }
  if (xpos1[i]<playerx+45 && xpos1[i]>playerx-45 && ypos1[i]<playery+20 && ypos1[i]>playery-20) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);
  }
    if (xpos2[i]<playerx+45 && xpos2[i]>playerx-45 && ypos2[i]<playery+20 && ypos2[i]>playery-20) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);
    }
  

 if (j<playerx+45 && j>playerx-45 && k<playery+45 && k>playery-45) {
   fill(255, 52, 52);
text("YOU WIN!!", 100, 100); 
textSize(30);
  }
  if (xpos3[i]<playerx+45 && xpos3[i]>playerx-45 && ypos3[i]<playery+45 && ypos3[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos4[i]<playerx+45 && xpos4[i]>playerx-45 && ypos4[i]<playery+45 && ypos4[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos5[i]<playerx+45 && xpos5[i]>playerx-45 && ypos5[i]<playery+45 && ypos5[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos6[i]<playerx+45 && xpos6[i]>playerx-45 && ypos6[i]<playery+45 && ypos6[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos7[i]<playerx+45 && xpos7[i]>playerx-45 && ypos7[i]<playery+45 && ypos7[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos8[i]<playerx+45 && xpos8[i]>playerx-45 && ypos8[i]<playery+45 && ypos8[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos9[i]<playerx+45 && xpos9[i]>playerx-45 && ypos9[i]<playery+45 && ypos9[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);

  }
  if (xpos10[i]<playerx+45 && xpos10[i]>playerx-45 && ypos10[i]<playery+45 && ypos10[i]>playery-45) {
      //x=x+10;
      //y=y+10;
      background(150);
fill(255, 52, 52);
text("GAME OVER", 350, 350); 
textSize(30);


  }
  }

  
 
  
    stroke(20, 20, 20);
    strokeWeight(2.5);
    fill(0, 0, 225);
    ellipseMode(CENTER);
    ellipse(j, k, 50, 50);
    
  
 
 
 
  fill(0, 225, 0);
  triangle(playerx+25, playery, playerx-25, playery, playerx, playery-50);
 
  if (playerx==x) {
    fill(225, 225, 0);
  }
  if (movex ==1) {
    playerx=playerx + 10;
  }
  
  if (movex == -1) {
    playerx=playerx -10;
  }
  if (movey ==1) {
    playery =playery+10;
  }
  if (movey ==-1) {
    playery =playery-10;
  }
}
void keyPressed() {
  if (key=='a')
  {

    movex=-1;
  }
  if (key=='d')
  {
    movex=1;
  }
  if (key=='w')
  {
    movey=-1;
  }
  if (key=='s')
  {
    movey=1;
  }
}
 

void keyReleased() {
  movex=0;
  movey=0;
}


