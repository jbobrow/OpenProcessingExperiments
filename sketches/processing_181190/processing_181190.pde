
float sz = 100;
float sze= 80;
int v=3;
int w=3;
int colors=6;
int l;
int m;
int n;
int sub;
int [][][]block = new int [v][w][colors];
void setup(){
size(600,600,P3D);
//noStroke();
  strokeWeight(10);
  noFill();
  rectMode(CENTER);
  for(int l=0; l<3; l++){
    for(int m=0; m<3; m++){
    for(int n=0; n<6; n++){
    block[l][m][n]=n;
    }
    }
    }
}
void draw(){
  background(0,200,200);
  translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  noFill();
  box(2.99*sz);
  for(int l=0; l<3; l++){
    for(int m=0; m<3; m++){
  for(int n=0; n<6; n++){
    //block[l][m][n]=n;
    if (n==0){ //green
      pushMatrix();
      translate(1.5*sz,0,0);
      rotateY(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    if (n==1){ //blue
      pushMatrix();
      translate(-1.5*sz,0,0);
      rotateY(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    if (n==2){ //white
      pushMatrix();
      translate(0,1.5*sz,0);
      rotateX(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    if (n==3){ //yellow
      pushMatrix();
      translate(0,-1.5*sz,0);
      rotateX(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    if (n==4){ //red
      pushMatrix();
      translate(0,0,1.5*sz);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    if (n==5){ //orange
      pushMatrix();
      translate(0,0,-1.5*sz);
      colored(block[l][m][n]);
      rect(sz*(l-1),sz*(m-1),sze,sze);
      popMatrix();
    }
    
  }
    }
  }
}
void keyPressed(){
  if(key == 'n'){
    restart();
  }
  /*************************/
  if(key == 'r'){
    CW1();
  }
  if(key == 'R'){
    CCW1();
  }
  if(key == 'm'){
    MCW1();
  }
  if(key == 'M'){
    MCCW1();
  }
  if(key == 'l'){
    CW0();
  }
  if(key == 'L'){
    CCW0();
  }
  /************************/
  if(key == 'u'){
    CW2();
  }
  if(key == 'U'){
    CCW2();
  }
  if(key == 'e'){
    MCW2();
  }
  if(key == 'E'){
    MCCW2();
  }
  if(key == 'd'){
    CW3();
  }
  if(key == 'D'){
    CCW3();
  }
  /***************************************/
  if(key == 'f'){
    CW4();
  }
  if(key == 'F'){
    CCW4();
  }
  if(key == 's'){
    MCW4();
  }
  if(key == 'S'){
    MCCW4();
  }
  if(key == 'b'){
    CW5();
  }
  if(key == 'B'){
    CCW5();
  }
  if(key == 'x'){
    CW1();
    MCW1();
    CCW0();
  }
  if(key == 'X'){
    CCW1();
    MCCW1();
    CW0();
  }
  if(key == 'y'){
    CW2();
    MCW2();
    CCW3();
  }
  if(key == 'Y'){
    CCW2();
    MCCW2();
    CW3();
  }
  if(key == 'z'){
    CW4();
    MCW4();
    CCW5();
  }
  if(key == 'Z'){
    CCW4();
    MCCW4();
    CW5();
  }
  if(key == 't'){
    CW1();
    MCW1();
  }
  if(key == 'T'){
    CCW1();
    MCCW1();
  }
  if(key == 'i'){
    CW2();
    MCW2();
  }
  if(key == 'I'){
    CCW2();
    MCCW2();
  }
  if(key == 'g'){
    CW4();
    MCW4();
  }
  if(key == 'G'){
    CCW4();
    MCCW4();
  }
}
void colored(int COLOR){
  if (COLOR==0){
    fill(0,0,255);
  }
  if (COLOR==1){
    fill(0,255,0);
  }
  if (COLOR==2){
    fill(255,255,0);
  }
  if (COLOR==3){
    fill(255);
  }
  if (COLOR==4){
    fill(255,0,0);
  }
  if (COLOR==5){
    fill(255,150,0);
  }
  if (COLOR==6){
    fill(150);
  }
}
void restart(){
  for(int l=0; l<v; l++){
    for(int m=0; m<w; m++){
    for(int n=0; n<colors; n++){
    block[l][m][n]=n;
    }
    }
    }
}
void CW1(){
  sub = block[0][0][2];
  block[0][0][2]=block[0][2][4];
  block[0][2][4]=block[0][2][3];
  block[0][2][3]=block[0][0][5];
  block[0][0][5]= sub;
  
  sub = block[0][1][2];
  block[0][1][2]=block[0][1][4];
  block[0][1][4]=block[0][1][3];
  block[0][1][3]=block[0][1][5];
  block[0][1][5]= sub;
  
  sub = block[0][2][2];
  block[0][2][2]=block[0][0][4];
  block[0][0][4]=block[0][0][3];
  block[0][0][3]=block[0][2][5];
  block[0][2][5]= sub;
  //edges
  sub = block[2][1][1];
  block[2][1][1] = block[1][2][1];
  block[1][2][1] = block[0][1][1];
  block[0][1][1] = block[1][0][1];
  block[1][0][1] = sub;
  //corners
  sub = block[2][0][1];
  block[2][0][1] = block[2][2][1];
  block[2][2][1] = block[0][2][1];
  block[0][2][1] = block[0][0][1];
  block[0][0][1] = sub;
}
void MCW1(){
          sub = block[1][0][2];
          block[1][0][2]=block[1][2][4];
          block[1][2][4]=block[1][2][3];
          block[1][2][3]=block[1][0][5];
          block[1][0][5]= sub;
         
          sub = block[1][1][2];
          block[1][1][2]=block[1][1][4];
          block[1][1][4]=block[1][1][3];
          block[1][1][3]=block[1][1][5];
          block[1][1][5]= sub;
          
          sub = block[1][2][2];
          block[1][2][2]=block[1][0][4];
          block[1][0][4]=block[1][0][3];
          block[1][0][3]=block[1][2][5];
          block[1][2][5]= sub;
}
void CCW0(){
  sub = block[2][0][2];
          block[2][0][2]=block[2][2][4];
          block[2][2][4]=block[2][2][3];
          block[2][2][3]=block[2][0][5];
          block[2][0][5]= sub;
         
          sub = block[2][1][2];
          block[2][1][2]=block[2][1][4];
          block[2][1][4]=block[2][1][3];
          block[2][1][3]=block[2][1][5];
          block[2][1][5]= sub;
          
          sub = block[2][2][2];
          block[2][2][2]=block[2][0][4];
          block[2][0][4]=block[2][0][3];
          block[2][0][3]=block[2][2][5];
          block[2][2][5]= sub;
          
          //edges
          sub = block[2][1][0];
          block[2][1][0] = block[1][2][0];
          block[1][2][0] = block[0][1][0];
          block[0][1][0] = block[1][0][0];
          block[1][0][0] = sub;
          //corners
          sub = block[2][0][0];
          block[2][0][0] = block[2][2][0];
          block[2][2][0] = block[0][2][0];
          block[0][2][0] = block[0][0][0];
          block[0][0][0] = sub;
}
void CCW1(){
  sub = block[0][2][5];
          block[0][2][5]=block[0][0][3];
          block[0][0][3]=block[0][0][4];
          block[0][0][4]=block[0][2][2];
          block[0][2][2]= sub;
          
          sub = block[0][1][5];
          block[0][1][5]=block[0][1][3];
          block[0][1][3]=block[0][1][4];
          block[0][1][4]=block[0][1][2];
          block[0][1][2]= sub;
          
          sub = block[0][0][5];
          block[0][0][5]=block[0][2][3];
          block[0][2][3]=block[0][2][4];
          block[0][2][4]=block[0][0][2];
          block[0][0][2]= sub;
          
          //edges
          sub = block[1][0][1];
          block[1][0][1] = block[0][1][1];
          block[0][1][1] = block[1][2][1];
          block[1][2][1] = block[2][1][1];
          block[2][1][1] = sub;
          //corners
          sub = block[0][0][1];
          block[0][0][1] = block[0][2][1];
          block[0][2][1] = block[2][2][1];
          block[2][2][1] = block[2][0][1];
          block[2][0][1] = sub;
}
void MCCW1(){
  sub = block[1][2][5];
          block[1][2][5]=block[1][0][3];
          block[1][0][3]=block[1][0][4];
          block[1][0][4]=block[1][2][2];
          block[1][2][2]= sub;
          
          sub = block[1][1][5];
          block[1][1][5]=block[1][1][3];
          block[1][1][3]=block[1][1][4];
          block[1][1][4]=block[1][1][2];
          block[1][1][2]= sub;
          
          sub = block[1][0][5];
          block[1][0][5]=block[1][2][3];
          block[1][2][3]=block[1][2][4];
          block[1][2][4]=block[1][0][2];
          block[1][0][2]= sub;
}
void CW0(){
  sub = block[2][2][5];
          block[2][2][5]=block[2][0][3];
          block[2][0][3]=block[2][0][4];
          block[2][0][4]=block[2][2][2];
          block[2][2][2]= sub;
          
          sub = block[2][1][5];
          block[2][1][5]=block[2][1][3];
          block[2][1][3]=block[2][1][4];
          block[2][1][4]=block[2][1][2];
          block[2][1][2]= sub;
          
          sub = block[2][0][5];
          block[2][0][5]=block[2][2][3];
          block[2][2][3]=block[2][2][4];
          block[2][2][4]=block[2][0][2];
          block[2][0][2]= sub;
          
          //edges
          sub = block[1][0][0];
          block[1][0][0] = block[0][1][0];
          block[0][1][0] = block[1][2][0];
          block[1][2][0] = block[2][1][0];
          block[2][1][0] = sub;
          //corners
          sub = block[0][0][0];
          block[0][0][0] = block[0][2][0];
          block[0][2][0] = block[2][2][0];
          block[2][2][0] = block[2][0][0];
  block[2][0][0] = sub;
}
/*8*8*8*8*8*8*8*8*8*            *8*8*8*8*8*8**8*8*8*8*8*8*8*8*8*        *8*8*8*8*8*8*8*8*8*/
void CW2(){
          sub = block[0][2][0];
          block[0][2][0]=block[0][2][4];
          block[0][2][4]=block[2][2][1];
          block[2][2][1]=block[2][2][5];
          block[2][2][5]= sub;
          
          sub = block[1][2][0];
          block[1][2][0]=block[1][2][4];
          block[1][2][4]=block[1][2][1];
          block[1][2][1]=block[1][2][5];
          block[1][2][5]= sub;
          
          sub = block[2][2][0];
          block[2][2][0]=block[2][2][4];
          block[2][2][4]=block[0][2][1];
          block[0][2][1]=block[0][2][5];
          block[0][2][5]= sub;
          
          //edges
          sub = block[0][1][2];
          block[0][1][2] = block[1][0][2];
          block[1][0][2] = block[2][1][2];
          block[2][1][2] = block[1][2][2];
          block[1][2][2] = sub;
          //corners
          sub = block[0][0][2];
          block[0][0][2] = block[2][0][2];
          block[2][0][2] = block[2][2][2];
          block[2][2][2] = block[0][2][2];
  block[0][2][2] = sub;
}
void MCW2(){
  sub = block[0][1][0];
          block[0][1][0]=block[0][1][4];
          block[0][1][4]=block[2][1][1];
          block[2][1][1]=block[2][1][5];
          block[2][1][5]= sub;
          
          sub = block[1][1][0];
          block[1][1][0]=block[1][1][4];
          block[1][1][4]=block[1][1][1];
          block[1][1][1]=block[1][1][5];
          block[1][1][5]= sub;
          
          sub = block[2][1][0];
          block[2][1][0]=block[2][1][4];
          block[2][1][4]=block[0][1][1];
          block[0][1][1]=block[0][1][5];
          block[0][1][5]= sub;
}
void CCW3(){
  sub = block[0][0][0];
          block[0][0][0]=block[0][0][4];
          block[0][0][4]=block[2][0][1];
          block[2][0][1]=block[2][0][5];
          block[2][0][5]= sub;
          
          sub = block[1][0][0];
          block[1][0][0]=block[1][0][4];
          block[1][0][4]=block[1][0][1];
          block[1][0][1]=block[1][0][5];
          block[1][0][5]= sub;
          
          sub = block[2][0][0];
          block[2][0][0]=block[2][0][4];
          block[2][0][4]=block[0][0][1];
          block[0][0][1]=block[0][0][5];
          block[0][0][5]= sub;
          
          //edges
          sub = block[0][1][3];
          block[0][1][3] = block[1][0][3];
          block[1][0][3] = block[2][1][3];
          block[2][1][3] = block[1][2][3];
          block[1][2][3] = sub;
          //corners
          sub = block[0][0][3];
          block[0][0][3] = block[2][0][3];
          block[2][0][3] = block[2][2][3];
          block[2][2][3] = block[0][2][3];
          block[0][2][3] = sub;
}
void CCW2(){
  sub = block[2][2][5];
          block[2][2][5] = block[2][2][1];
          block[2][2][1] = block[0][2][4];
          block[0][2][4] = block[0][2][0];
          block[0][2][0] = sub;
          
          sub = block[1][2][5];
          block[1][2][5] = block[1][2][1];
          block[1][2][1] = block[1][2][4];
          block[1][2][4] = block[1][2][0];
          block[1][2][0] = sub;
          
          sub = block[0][2][5];
          block[0][2][5] = block[0][2][1];
          block[0][2][1] = block[2][2][4];
          block[2][2][4] = block[2][2][0];
          block[2][2][0] = sub;
          
          //edges
          sub = block[1][2][2];
          block[1][2][2] = block[2][1][2];
          block[2][1][2] = block[1][0][2];
          block[1][0][2] = block[0][1][2];
          block[0][1][2] = sub;
          //corners
          sub = block[0][2][2];
          block[0][2][2] = block[2][2][2];
          block[2][2][2] = block[2][0][2];
          block[2][0][2] = block[0][0][2];
          block[0][0][2] = sub;
}
void MCCW2(){
  sub = block[2][1][5];
          block[2][1][5] = block[2][1][1];
          block[2][1][1] = block[0][1][4];
          block[0][1][4] = block[0][1][0];
          block[0][1][0] = sub;
          
          sub = block[1][1][5];
          block[1][1][5] = block[1][1][1];
          block[1][1][1] = block[1][1][4];
          block[1][1][4] = block[1][1][0];
          block[1][1][0] = sub;
          
          sub = block[0][1][5];
          block[0][1][5] = block[0][1][1];
          block[0][1][1] = block[2][1][4];
          block[2][1][4] = block[2][1][0];
          block[2][1][0] = sub;
}
void CW3(){
  sub = block[2][0][5];
          block[2][0][5] = block[2][0][1];
          block[2][0][1] = block[0][0][4];
          block[0][0][4] = block[0][0][0];
          block[0][0][0] = sub;
          
          sub = block[1][0][5];
          block[1][0][5] = block[1][0][1];
          block[1][0][1] = block[1][0][4];
          block[1][0][4] = block[1][0][0];
          block[1][0][0] = sub;
          
          sub = block[0][0][5];
          block[0][0][5] = block[0][0][1];
          block[0][0][1] = block[2][0][4];
          block[2][0][4] = block[2][0][0];
          block[2][0][0] = sub;
          
          //edges
          sub = block[1][2][3];
          block[1][2][3] = block[2][1][3];
          block[2][1][3] = block[1][0][3];
          block[1][0][3] = block[0][1][3];
          block[0][1][3] = sub;
          //corners
          sub = block[0][2][3];
          block[0][2][3] = block[2][2][3];
          block[2][2][3] = block[2][0][3];
          block[2][0][3] = block[0][0][3];
          block[0][0][3] = sub;
}
/*8*8*8*8*8*8*8*8*8*            *8*8*8*8*8*8**8*8*8*8*8*8*8*8*8*        *8*8*8*8*8*8*8*8*8*/
void CW4(){
  sub = block[0][0][0];
    block[0][0][0] = block[0][2][3];
    block[0][2][3] = block[0][2][1];
    block[0][2][1] = block[2][2][2];
    block[2][2][2] = sub;
    
    sub = block[0][1][0];
    block[0][1][0] = block[1][2][3];
    block[1][2][3] = block[0][1][1];
    block[0][1][1] = block[1][2][2];
    block[1][2][2] = sub;
    
    sub = block[0][2][0];
    block[0][2][0] = block[2][2][3];
    block[2][2][3] = block[0][0][1];
    block[0][0][1] = block[0][2][2];
    block[0][2][2] = sub;
    
    //edges
    sub = block[0][1][4];
    block[0][1][4] = block[1][2][4];
    block[1][2][4] = block[2][1][4];
    block[2][1][4] = block[1][0][4];
    block[1][0][4] = sub;
    //corners
    sub = block[0][0][4];
    block[0][0][4] = block[0][2][4];
    block[0][2][4] = block[2][2][4];
    block[2][2][4] = block[2][0][4];
    block[2][0][4] = sub;
}
void MCW4(){
  sub = block[1][0][0];
    block[1][0][0] = block[0][1][3];
    block[0][1][3] = block[1][2][1];
    block[1][2][1] = block[2][1][2];
    block[2][1][2] = sub;
    
    sub = block[1][1][0];
    block[1][1][0] = block[1][1][3];
    block[1][1][3] = block[1][1][1];
    block[1][1][1] = block[1][1][2];
    block[1][1][2] = sub;
    
    sub = block[1][2][0];
    block[1][2][0] = block[2][1][3];
    block[2][1][3] = block[1][0][1];
    block[1][0][1] = block[0][1][2];
    block[0][1][2] = sub;
}
void CCW5(){
  sub = block[2][0][0];
    block[2][0][0] = block[0][0][3];
    block[0][0][3] = block[2][2][1];
    block[2][2][1] = block[2][0][2];
    block[2][0][2] = sub;
    
    sub = block[2][1][0];
    block[2][1][0] = block[1][0][3];
    block[1][0][3] = block[2][1][1];
    block[2][1][1] = block[1][0][2];
    block[1][0][2] = sub;
    
    sub = block[2][2][0];
    block[2][2][0] = block[2][0][3];
    block[2][0][3] = block[2][0][1];
    block[2][0][1] = block[0][0][2];
    block[0][0][2] = sub;
    
    //edges
    sub = block[0][1][5];
    block[0][1][5] = block[1][2][5];
    block[1][2][5] = block[2][1][5];
    block[2][1][5] = block[1][0][5];
    block[1][0][5] = sub;
    //corners
    sub = block[0][0][5];
    block[0][0][5] = block[0][2][5];
    block[0][2][5] = block[2][2][5];
    block[2][2][5] = block[2][0][5];
    block[2][0][5] = sub;
}
void CCW4(){
  sub = block[2][2][2];
    block[2][2][2] = block[0][2][1];
    block[0][2][1] = block[0][2][3];
    block[0][2][3] = block[0][0][0];
    block[0][0][0] = sub;
    
    sub = block[1][2][2];
    block[1][2][2] = block[0][1][1];
    block[0][1][1] = block[1][2][3];
    block[1][2][3] = block[0][1][0];
    block[0][1][0] = sub;
    
    sub = block[0][2][2];
    block[0][2][2] = block[0][0][1];
    block[0][0][1] = block[2][2][3];
    block[2][2][3] = block[0][2][0];
    block[0][2][0] = sub;
    
    //edges
    sub = block[1][0][4];
    block[1][0][4] = block[2][1][4];
    block[2][1][4] = block[1][2][4];
    block[1][2][4] = block[0][1][4];
    block[0][1][4] = sub;
    //corners
    sub = block[2][0][4];
    block[2][0][4] = block[2][2][4];
    block[2][2][4] = block[0][2][4];
    block[0][2][4] = block[0][0][4];
    block[0][0][4] = sub;
}
void MCCW4(){
  sub = block[2][1][2];
    block[2][1][2] = block[1][2][1];
    block[1][2][1] = block[0][1][3];
    block[0][1][3] = block[1][0][0];
    block[1][0][0] = sub;
    
    sub = block[1][1][2];
    block[1][1][2] = block[1][1][1];
    block[1][1][1] = block[1][1][3];
    block[1][1][3] = block[1][1][0];
    block[1][1][0] = sub;
    
    sub = block[0][1][2];
    block[0][1][2] = block[1][0][1];
    block[1][0][1] = block[2][1][3];
    block[2][1][3] = block[1][2][0];
    block[1][2][0] = sub;
}
void CW5(){
  sub = block[2][0][2];
    block[2][0][2] = block[2][2][1];
    block[2][2][1] = block[0][0][3];
    block[0][0][3] = block[2][0][0];
    block[2][0][0] = sub;
    
    sub = block[1][0][2];
    block[1][0][2] = block[2][1][1];
    block[2][1][1] = block[1][0][3];
    block[1][0][3] = block[2][1][0];
    block[2][1][0] = sub;
    
    sub = block[0][0][2];
    block[0][0][2] = block[2][0][1];
    block[2][0][1] = block[2][0][3];
    block[2][0][3] = block[2][2][0];
    block[2][2][0] = sub;
    
    //edges
    sub = block[1][0][5];
    block[1][0][5] = block[2][1][5];
    block[2][1][5] = block[1][2][5];
    block[1][2][5] = block[0][1][5];
    block[0][1][5] = sub;
    //corners
    sub = block[2][0][5];
    block[2][0][5] = block[2][2][5];
    block[2][2][5] = block[0][2][5];
    block[0][2][5] = block[0][0][5];
    block[0][0][5] = sub;
}
