
float uX = 0, uY=0,  tX1=300, tY1=0, tX2=300, tY2=300;
boolean goRight = true;
float score = 0;
float rad = 0;
float theta = 0;
boolean P_1 = false, P_2 = false, D_1 = false, D_2 = false;
float count1= 0, count2 = 0;
float timer = 0;
float s = 0;


void setup(){
size(1000,1000);
}


void keyPressed(){
  
  if ( key == 's') s = 1;
  if ( key == '1') D_1 = true;
  
  if ( key == 'z') P_1 = true;
  if ( key == 'x') P_1 = false;
  
  if ( key == '2') D_2 = true;

  if ( key == '.') P_2 = true;
  if ( key == '/') P_2 = false;
  
  //else P_1 = P_2 = false;
  
}


  


void draw(){
  
 
  
  background(255);
  stroke(255,0,0);
  strokeWeight(10);
  
  float tVecX = 300*cos(rad)+width/2 - width/2;
  float tVecY = 300*sin(rad)+height/2 - height/2;
  float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);
  float uVecX = 280 * cos(theta)+width/2 - width/2;
  float uVecY = 280 * sin(theta)+height/2 - height/2;
  float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);
  float dot = tVecX * uVecX + tVecY * uVecY;
  float cosine = dot / (tVecMag * uVecMag);
  score = cosine * 100;
  
  
  gamestart();

if (timer > 280){
  D_1 = true;
  background(255);
  stroke(255,0,0);
  strokeWeight(10);
  
  if (D_1 == true){
  

  line(width/2, height/2, 300*cos(rad)+width/2, 300*sin(rad)+height/2);

    if (P_1 == true){
    
      rad += 0.1;
      P_1 = false;
    
    }
      
    if (rad >= 6.2)
    {
      rad=0;
     count1 ++; 
    }
  
  
  }

  if (D_1 == true){
  
  
    stroke(0);
    line(width/2,height/2,280 * cos(theta)+width/2,280 * sin(theta)+height/2);
  
    if (P_2 == true){
    
      theta += 0.1;
      P_2 = false;
      
    }
    
     if (theta >= 6.2)
    {
      theta=0;
      count2 ++; 
    }
 


  }
  
  GameEnd();
}

}

void gamestart(){
  
  background(255);
  stroke(255,0,0);
  strokeWeight(10);
  
  if (s == 0){
  fill(0);
  textSize(30);
  text("press 's' button",width/2 - 50,height/2);
  
}

if ( s > 0) {
  textSize(30);
  text(" Player 1 press a 'z' button\n Player 2 press a '>' button",width/2- 100, height/2);
  timer ++;
  s ++;
  if (timer > 120){
      background(255);
      textSize(30);
      text(" ready? ",width/2- 100, height/2);
      timer ++;
      if (timer > 200) {
       background(255);
       textSize(30);
       text(" start ",width/2- 100, height/2);
      } 

    
  }
}
}

void GameEnd(){
  
  if (count1 >= 2)
  {
    background(255,0,0);
    fill(255);
    textSize(30);
    text(" congratulation \n Player 1 win!",width/2,height/2);
    
  }
  
  if (count2 >= 2)
  {
    background(0);
    fill(255);
    textSize(30);
    text(" congratulation \n Player 2 win!",width/2,height/2);
    
  }
}
