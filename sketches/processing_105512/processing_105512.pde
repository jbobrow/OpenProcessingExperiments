
PImage money,bowl,bomb;
int i,missCount=0,hitCount=0,hitBombCount=0,life=100;
int NUM = 50;
float posX, posY;
// [] means generating a group of variables x[3] => x[0],x[1],x[2]
float[] x = new float[NUM]; // x position
float[] y = new float[NUM]; // y position
float[] v = new float[NUM]; // v velocity
float[] bx = new float[NUM]; // bomb x position
float[] by = new float[NUM]; // bomb y position
float[] bv = new float[NUM]; // bomb v velocity
boolean[] hit = new boolean[NUM];
boolean[] miss = new boolean[NUM];
boolean[] hitBomb = new boolean[NUM];
boolean[] missBomb = new boolean[NUM];

void setup() {
  size(500,500);
  fill(200,0,200);

  // generate the position and velocity of money and bomb in the total number of NUMs
  for(i=0;i<NUM;i++){
    x[i]=random(0,width-50);
    y[i]=random(-2000,0); // y initial position
    v[i]=random(0.9,1.8);
    bx[i]=random(0,width-25);
    by[i]=random(-2000,0);
    bv[i]=random(0.5,2);
  }
  
  money = loadImage("money.png");
  bowl = loadImage("bowl.png");
  bomb = loadImage("bomb.png");
}

void draw() {
  background(255);
  textSize(20);
  noCursor();

  //draw NUM's money
  for(i=0;i<NUM;i++){
    image(money, x[i],y[i]);
  }
  
  //draw NUM*0.01's bomb, because bombs are much less than money
  for(i=0;i<NUM/10;i++){
    image(bomb, bx[i],by[i]);
  }  
  
  //generate drop effect for money and bomb
  for(i=0;i<NUM;i++){
    y[i]=y[i]+v[i];
    by[i]=by[i]+bv[i];
  }
  
  // collision validation
  // if take the money using bowl or not?
  for(i=0;i<NUM;i++){
      hit[i]=false;
      miss[i]=false;
      hitBomb[i]=false;
      missBomb[i]=false;
      
      // hit money
      if(y[i]>height-30&&y[i]<height){
        if(x[i]>mouseX-25&&x[i]<mouseX+25){
           hit[i]=true;   
        } else {
           miss[i]=true;
        }
      }
      
      if (hit[i]==true) {
          hitCount++;
          text("good!", 10, 30);
          hit[i]=false; 
          x[i]=width+50; //remove
          y[i]=height+30; //remove
      }
     
      if (miss[i]==true) {
          missCount++; 
          text("miss!", 65, 30);
          miss[i]=false; 
          x[i]=width+50; //remove
          y[i]=height+30; //remove
      }
      
      // hit bomb
      if(by[i]>height-30&&by[i]<height-5){
        if(bx[i]>mouseX-10&&bx[i]<mouseX+10){
           hitBomb[i]=true;
        } else {
           missBomb[i]=true; 
        }
      }
      
      if (hitBomb[i]==true) {
          hitBombCount++;
          if (life<=0) {
            life = 0;
          } else {
            life=life-100;
          }
          text("bomb!", 120, 30);
          hitBomb[i]=false; 
          bx[i]=width+999; //remove bomb
          by[i]=height+999; //remove bomb 
      }
      
      if (missBomb[i]==true) {
          missBomb[i]=false; 
          bx[i]=width+999; //remove bomb
          by[i]=height+999; //remove bomb 
      }
      
      
      if (life<=0) {
        text("Game Over!", width/2-60, height/2-10);
      } else {
          if (hitCount+missCount>=NUM) {
            text("Congratulations! \n You have collected "+hitCount+" pieces of gold", width/200, height/2-10);
          }
      }
  }
  
  // control the bowl to take the money and avoid bombs
  // the bowl follow the mouse along X axis, Keep Y as 470
  posX=mouseX;
  posY=height-30;
  
  // make the movement of the bowl between 0 and 500 in the screen
  if(mouseX>width-10) {
    posX=width-50;
  }
  else if (mouseX<=0) {
    posX=0;
  }
  image(bowl, posX, posY); // draw the bowl image
  smooth();
  
  // print text information
  text("hitCounts: "+hitCount+"/"+NUM, 10, 50);
  //text("missCounts: "+missCount+"/"+NUM, 10, 70);
  //text("lifes: "+life, 10, 95);
  //rect(10,100,life,20); // draw blood bar
  
}




