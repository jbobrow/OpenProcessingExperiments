
/**************************************

            Seiya Iwasaki
                2014-04-16
                
***************************************/

/** dec gloval ver**/
int scr_s = 600;                            //screen size
int cir_n = 30;                             //number of circle
int Sat = 40;                               //saturation
int Bri = 90;                               //brightness
int Opa = 80;                               //opacity

int[][] cir_p = new int[cir_n][2];          //circle position = [][X, Y]
float[][] cir_s = new float[cir_n][3];      //circle size = [][max, current, flag]
int[][] cir_c = new int[cir_n][3];          //circle color = [][H, S, B]

int[] player = new int[2];                  //player position = [X, Y]
int p_size = 30;                            //player size
float HP = 100;                             //player life point
float damage = 0.3;                         //damage point

int count = 100;
int ct = 0;
int ctt = 0;
int ct_f = 0;
int ct_ff = 0;
int score = 0;

/*---------------------------------------*/

/*** Setup ***/
void setup(){
  size(scr_s, scr_s);
  colorMode(HSB, 360, 100, 100);
  background(#FFFFFF);
  smooth();
  strokeWeight(2);
  textAlign(CENTER);
  PFont f = createFont("Ã£ï¿½Â¡Ã£ï¿½Â¤Ã£ï¿½ÂªÃ£ï¿½Âª", 20);
  textFont(f);
  
  /** all circle's setup **/
  for(int i = 0; i < cir_n; i++){
    setpos(i);
    setsize(i);
    setcolor(i);
  }
}

/*** Main ***/
void draw(){
  
  /** Game Start **/
  if(count == 100){
    
    background(#FFFFFF);
    GameStart();
    
  }else if(HP > 0 && score <= 100000){
  
  /** Game **/
    
    /** reset scr **/
    background(#FFFFFF);
  
    /** draw cage **/
    noFill();
    stroke(0,0,0,Opa);
    strokeWeight(1);
    rect(100,100,400,400);
    strokeWeight(2);
    
    /** draw circles **/
    dCir();
    
    /** draw player **/
    dPlayer();
    
    /** draw HP gage **/
    stroke(235,80,85,Opa+10);
    line(scr_s - (scr_s * HP / 100), 50, scr_s, 50);
    
    /** draw score gage **/
    stroke(0,80,85,Opa+10);
    line(scr_s - (scr_s * score / 100000), scr_s - 50, scr_s, scr_s - 50);
    
    /** collision detection **/
    for(int i = 0; i < (count / 100); i++){
      if(int(sqrt(sq(player[0] - cir_p[i][0]) + sq(player[1] - cir_p[i][1]))) <= (cir_s[i][1] / 2) + (p_size / 2 ) - 3 && cir_s[i][1] != 0){
        HP -= damage;
      }
    }
    
    /** add count **/
    if(count < (cir_n * 100)){
      count++;
    }
    
    /** add score **/
    score += (int)(count / 150);

  }

  /** Game Over **/
  if(HP <= 0 || score > 100000){
    if(score > 100000){
      score = 100000;
    }
    textSize(70);
    GameOver();
  }
}

/*-------------------------------------------------------*/

/*** Game Start ***/
void GameStart(){
  
  fill(235,80,85,100);
  textSize(50);
  text("Escape!!", scr_s / 2, 200);

  fill(0,0,0,ct);
  stroke(0,20,0,ct);
  ellipse(scr_s / 2, scr_s / 2, p_size / 2 + ct / 10 + 10, p_size / 2 + ct / 10 + 10);
    
  dPlayer();
  if(((scr_s / 2) - 10) <= mouseX && mouseX <= ((scr_s / 2) + 10) && ((scr_s / 2) - 10) <= mouseY && mouseY <= ((scr_s / 2) + 10)){
    count++;
  }
  
  if(ct_f == 0){
    ct += 2;
  }else{
    ct -= 2;
  }
  
  if(ct == 100){
    ct_f = 1;
  }else if(ct == 20){
    ct_f = 0;
  }
}

/*** Game Over ***/
void GameOver(){

  background(#FFFFFF);
  switch(ct_ff){
    case 0:
      stroke(0,80,85);
      line((scr_s - (scr_s * score / 100000)) - ((scr_s - (scr_s * score / 100000)) / 2 * (ctt / 150.0)), (scr_s - 50) - ((scr_s - 50) - (scr_s / 2 + 50)) * (ctt / 150.0), scr_s - ((scr_s - (scr_s * score / 100000)) / 2 * (ctt / 150.0)), (scr_s - 50) - ((scr_s - 50) - (scr_s / 2 + 50)) * (ctt / 150.0));
      
      ctt++;
      if(ctt == 151){
        ct_ff++;
        ctt = 0;
      }
      break;
    case 1:
      stroke(0,80,85);
      line(((scr_s - (scr_s * score / 100000)) - ((scr_s - (scr_s * score / 100000)) / 2)) + ((scr_s / 2) - ((scr_s - (scr_s * score / 100000)) - ((scr_s - (scr_s * score / 100000)) / 2))) * ctt / score, (scr_s - 50) - ((scr_s - 50) - (scr_s / 2 + 50)), (scr_s - ((scr_s - (scr_s * score / 100000)) / 2)) - ((scr_s / 2) - ((scr_s - (scr_s * score / 100000)) - ((scr_s - (scr_s * score / 100000)) / 2))) * ctt / score, (scr_s - 50) - ((scr_s - 50) - (scr_s / 2 + 50)));
      fill(0,0,0);
      text((int)(ctt / 10), scr_s / 2, scr_s / 2);
      if(ctt <= score){
        ctt += 10 + (ctt / 30);
      }else{
        ct_ff++;
      }
      break;
    case 2:
      fill(0,0,0,ct+30);
      stroke(0,20,0,ct);
      text((int)(ctt / 10), scr_s / 2, scr_s / 2);
      
      if(ct_f == 0){
        ct += 2;
      }else{
        ct -= 2;
      }
   
      if(ct == 100){
        ct_f = 1;
      }else if(ct == 20){
        ct_f = 0;
      }
      if(keyPressed){
        count = 100;
        ct = 0;
        ctt = 0;
        ct_f = 0;
        ct_ff = 0;
        score = 0;
        HP = 100;
        setup();
      }
      break;
  }
}

/*-------------------------------------------------------*/

/*** draw circles ***/
void dCir(){
  
  /** draw circles **/
  for(int i = 0; i < int(count/100); i++){
    fill(cir_c[i][0],cir_c[i][1],cir_c[i][2],Opa);
    stroke(cir_c[i][0],cir_c[i][1]+20,cir_c[i][2],Opa);
    ellipse(cir_p[i][0],cir_p[i][1],cir_s[i][1],cir_s[i][1]);
    
    /* add circle size */
    if(cir_s[i][2] == 0){
      cir_s[i][1] += 1.0 + (float)(score / 25000.0); 
    }else{
      cir_s[i][1] -= 1.0 + (float)(score / 25000.0);
    }
    
    /* compare max size and current size */
   if(cir_s[i][0] <= cir_s[i][1]){
     cir_s[i][2] = 1;                  // flag = 1
   }else if(cir_s[i][1] <= 0){         // if current size == 0 then update circle setting
     setpos(i);
     setsize(i);
     setcolor(i);
   } 
  }
}

/*** draw player ***/
void dPlayer(){
  if(100 <= mouseX && mouseX <= 500 && 100 <= mouseY && mouseY <= 500){
    noCursor();
    player[0] = mouseX;
    player[1] = mouseY;
  }else{
    cursor();
  }
  fill(0,0,0,HP);
  stroke(0,20,0,HP);
  ellipse(player[0], player[1], p_size, p_size);
}

/*--------------------------------------------------*/

/*** setting circle position ***/
void setpos(int n){
  cir_p[n][0] = int(random(-100, (scr_s - 100)));  // X
  cir_p[n][1] = int(random(-100, (scr_s - 100)));  // Y
}

/*** setting circle size ***/
void setsize(int n){
  cir_s[n][0] = random(60, (scr_s / 2));        // size = 60 - scr_s / 2
  cir_s[n][1] = 0;                              // current size = 0
  cir_s[n][2] = 0;                              // flag = 0
}

/*** setting circle color ***/
void setcolor(int n){
  cir_c[n][0] = int(random(0,359));   // H
  cir_c[n][1] = Sat;           // S
  cir_c[n][2] = Bri;           // B
}
  
  
