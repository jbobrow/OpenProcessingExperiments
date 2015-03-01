
int v=3;
int w=3;
int colors=6;

int l;
int m;
int n;
int sub;

float sz = 240/v;
float sze= sz*.8;

int [][][]block = new int [v][w][colors];

int millisecs;
int seconds;
int minutes;
boolean start = false;
boolean starter;

void setup(){
  size(600,600,P3D);
  //noStroke();
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  for(int l=0; l<v; l++){
    for(int m=0; m<w; m++){
    for(int n=0; n<colors; n++){
    block[l][m][n]=n;
    }
    }
    }
}
void draw(){
  background(100,100,150);
  fill(255);
  stroke(0);
  rect(40, 15, 70, 20);
  textAlign(CENTER);
  fill(0);
  textSize(15);
  text(minutes + ":" + nf(seconds, 2)
  + "." + nf(millisecs, 1) , mouseX, mouseY);
  //text(nf(millisecs,1),mouseX,mouseY);
  translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  //noFill();
  box(239);
  for(int l=0; l<v; l++){
  for(int m=0; m<w; m++){
  for(int n=0; n<colors; n++){
    if (n==0){ //green
      pushMatrix();
      translate(v*sz/2,0,0);
      rotateY(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==1){ //blue
      pushMatrix();
      translate(-v*sz/2,0,0);
      rotateY(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==2){ //white
      pushMatrix();
      translate(0,w*sz/2,0);
      rotateX(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==3){ //yellow
      pushMatrix();
      translate(0,-w*sz/2,0);
      rotateX(PI/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==4){ //red
      pushMatrix();
      translate(0,0,w*sz/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==5){ //orange
      pushMatrix();
      translate(0,0,-w*sz/2);
      colored(block[l][m][n]);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
  }
  }
  }
  if(start){
  if (int(millis()/100)  % 10 != millisecs){
    millisecs++;
  }
  if (millisecs >= 10){
    millisecs -= 10;
    seconds++;
  }
  if (seconds >= 60){
    seconds -= 60;
    minutes++;
  }
  }
}
void mouseClicked(){
  
    if(start == false){
      starter = true;
    }
   else if(start == true){
      starter = false;
    }
  start = starter;
}void colored(int COLOR){
  if (COLOR==0){
    fill(0,100,255);
  }
  if (COLOR==1){
    fill(0,150,0);
  }
  if (COLOR==2){
    fill(200,200,0);
  }
  if (COLOR==3){
    fill(200);
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
void keyPressed(){
  if(key == 'n'){
    restart();
  }
  if(key == ' '){
    millisecs = 0;
    seconds = 0;
    minutes = 0;
  }
  /**************************/
  if(key == 'r'){
    CW1();
  }
  if(key == 'R'){
    CCW1();
  }
  if(key == 'l'){
    CW0();
  }
  if(key == 'L'){
    CCW0();
  }
  /**************************/
  if(key == 'u'){
    CW2();
  }
  if(key == 'U'){
    CCW2();
  }
  if(key == 'd'){
    CW3();
  }
  if(key == 'D'){
    CCW3();
  }
  /**************************/
  if(key == 'f'){
    CW4();
  }
  if(key == 'F'){
    CCW4();
  }
  if(key == 'b'){
    CW5();
  }
  if(key == 'B'){
    CCW5();
  }
  /**************************/
  if(key == 'x'){
    CW1();
    CCW0();
    if(v>2){
      M1CW();
    }
  }
  if(key == 'X'){
    CCW1();
    CW0();
    if(v>2){
      M1CCW();
    }
  }
  if(key == 'y'){
    CW2();
    CCW3();
    if(v>2){
      E1CW();
    }
  }
  if(key == 'Y'){
    CCW2();
    CW3();
    if(v>2){
      E1CCW();
    }
  }
  if(key == 'z'){
    CW4();
    CCW5();
    if(v>2){
      S1CW();
    }
  }
  if(key == 'Z'){
    CCW4();
    CW5();
    if(v>2){
      S1CCW();
    }
  }
  /**************************/
  if(v>2){
    if(key == 'm'){
      M1CW();
    }
    if(key == 'M'){
      M1CCW();
    }
    if(key == 'e'){
      E1CW();
    }
    if(key == 'E'){
      E1CCW();
    }
    if(key == 's'){
      S1CW();
    }
    if(key == 'S'){
      S1CCW();
    }
  }
}
 void CW1(){//R
  for(int count=0; count<(w); count++){
    sub =                    block[0][count]    [2];
    block[0][count]    [2] = block[0][w-1-count][4];
    block[0][w-1-count][4] = block[0][w-1-count][3];
    block[0][w-1-count][3] = block[0][count]    [5];
    block[0][count]    [5] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[v-1]       [ecount]    [1];
    block[v-1]       [ecount]    [1] = block[v-1-ecount][w-1]       [1];
    block[v-1-ecount][w-1]       [1] = block[0]         [w-1-ecount][1];
    block[0]         [w-1-ecount][1] = block[ecount]    [0]         [1];
    block[ecount]    [0]         [1] = sub;
  }
}
void CCW0(){//L'
  for(int count=0; count<(w); count++){
    sub =                      block[v-1][count]    [2];
    block[v-1][count]    [2] = block[v-1][w-1-count][4];
    block[v-1][w-1-count][4] = block[v-1][w-1-count][3];
    block[v-1][w-1-count][3] = block[v-1][count]    [5];
    block[v-1][count]    [5] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[v-1]       [ecount]    [0];
    block[v-1]       [ecount]    [0] = block[v-1-ecount][w-1]       [0];
    block[v-1-ecount][w-1]       [0] = block[0]         [w-1-ecount][0];
    block[0]         [w-1-ecount][0] = block[ecount]    [0]         [0];
    block[ecount]    [0]         [0] = sub;
  }
}
void CCW1(){//R'
  for(int count=0; count<(w); count++){
    sub                    = block[0][count]    [5];
    block[0][count]    [5] = block[0][w-1-count][3];
    block[0][w-1-count][3] = block[0][w-1-count][4];
    block[0][w-1-count][4] = block[0][count]    [2];
    block[0][count]    [2] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[ecount]    [0]         [1];
    block[ecount]    [0]         [1] = block[0]         [w-1-ecount][1];
    block[0]         [w-1-ecount][1] = block[v-1-ecount][w-1]       [1];
    block[v-1-ecount][w-1]       [1] = block[v-1]       [ecount]    [1];
    block[v-1]       [ecount]    [1] = sub;
  }
}
void CW0(){//L
  for(int count=0; count<(w); count++){
    sub                      = block[v-1][count]    [5];
    block[v-1][count]    [5] = block[v-1][w-1-count][3];
    block[v-1][w-1-count][3] = block[v-1][w-1-count][4];
    block[v-1][w-1-count][4] = block[v-1][count]    [2];
    block[v-1][count]    [2] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[ecount]    [0]         [0];
    block[ecount]    [0]         [0] = block[0]         [w-1-ecount][0];
    block[0]         [w-1-ecount][0] = block[v-1-ecount][w-1]       [0];
    block[v-1-ecount][w-1]       [0] = block[v-1]       [ecount]    [0];
    block[v-1]       [ecount]    [0] = sub;
  }
}
/*8*8*8*8*8*8*8*   *8*8*8*8*8*8*8*   *8*8*8*8*8*8*8*/
void CW2(){//U
  for(int count=0; count<(v); count++){
    sub                      = block[count]    [w-1][0];
    block[count]    [w-1][0] = block[count]    [w-1][4];
    block[count]    [w-1][4] = block[v-1-count][w-1][1];
    block[v-1-count][w-1][1] = block[v-1-count][w-1][5];
    block[v-1-count][w-1][5] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[0]         [ecount]    [2];
    block[0]         [ecount]    [2] = block[v-1-ecount][0]         [2];
    block[v-1-ecount][0]         [2] = block[v-1]       [w-1-ecount][2];
    block[v-1]       [w-1-ecount][2] = block[ecount]    [w-1]       [2];
    block[ecount]    [w-1]       [2] = sub;
  }
}
void CCW3(){//D'
  for(int count=0; count<(v); count++){
    sub                    = block[count]    [0][0];
    block[count]    [0][0] = block[count]    [0][4];
    block[count]    [0][4] = block[v-1-count][0][1];
    block[v-1-count][0][1] = block[v-1-count][0][5];
    block[v-1-count][0][5] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[0]         [ecount]    [3];
    block[0]         [ecount]    [3] = block[v-1-ecount][0]         [3];
    block[v-1-ecount][0]         [3] = block[v-1]       [w-1-ecount][3];
    block[v-1]       [w-1-ecount][3] = block[ecount]    [w-1]       [3];
    block[ecount]    [w-1]       [3] = sub;
  }
}
void CCW2(){//U'
  for(int count=0; count<(v); count++){
    sub                      = block[v-1-count][w-1][5];
    block[v-1-count][w-1][5] = block[v-1-count][w-1][1];
    block[v-1-count][w-1][1] = block[count]    [w-1][4];
    block[count]    [w-1][4] = block[count]    [w-1][0];
    block[count]    [w-1][0] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[ecount]    [w-1]       [2];
    block[ecount]    [w-1]       [2] = block[v-1]       [w-1-ecount][2];
    block[v-1]       [w-1-ecount][2] = block[v-1-ecount][0]         [2];
    block[v-1-ecount][0]         [2] = block[0]         [ecount]    [2];
    block[0]         [ecount]    [2] = sub;
  }
}
void CW3(){//D
  for(int count=0; count<(v); count++){
    sub                    = block[v-1-count][0][5];
    block[v-1-count][0][5] = block[v-1-count][0][1];
    block[v-1-count][0][1] = block[count]    [0][4];
    block[count]    [0][4] = block[count]    [0][0];
    block[count]    [0][0] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[ecount]    [w-1]       [3];
    block[ecount]    [w-1]       [3] = block[v-1]       [w-1-ecount][3];
    block[v-1]       [w-1-ecount][3] = block[v-1-ecount][0]         [3];
    block[v-1-ecount][0]         [3] = block[0]         [ecount]    [3];
    block[0]         [ecount]    [3] = sub;
  }
}
/*8*8*8*8*8*8*8*   *8*8*8*8*8*8*8*   *8*8*8*8*8*8*8*/
void CW4(){//F
  for(int count=0; count<(v); count++){
    sub                            = block[0]        [count]    [0];
    block[0]        [count]    [0] = block[count]    [w-1]      [3];
    block[count]    [w-1]      [3] = block[0]        [w-1-count][1];
    block[0]        [w-1-count][1] = block[v-1-count][w-1]      [2];
    block[v-1-count][w-1]      [2] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[0]         [ecount]    [4];
    block[0]         [ecount]    [4] = block[ecount]    [w-1]       [4];
    block[ecount]    [w-1]       [4] = block[v-1]       [w-1-ecount][4];
    block[v-1]       [w-1-ecount][4] = block[v-1-ecount][0]         [4];
    block[v-1-ecount][0]         [4] = sub;
  }
}
void CCW5(){//B'
  for(int count=0; count<(v); count++){
    sub                            = block[v-1]      [count]    [0];
    block[v-1]      [count]    [0] = block[count]    [0]        [3];
    block[count]    [0]        [3] = block[v-1]      [w-1-count][1];
    block[v-1]      [w-1-count][1] = block[v-1-count][0]        [2];
    block[v-1-count][0]        [2] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[0]         [ecount]    [5];
    block[0]         [ecount]    [5] = block[ecount]    [w-1]       [5];
    block[ecount]    [w-1]       [5] = block[v-1]       [w-1-ecount][5];
    block[v-1]       [w-1-ecount][5] = block[v-1-ecount][0]         [5];
    block[v-1-ecount][0]         [5] = sub;
  }
}
void CCW4(){//F'
  for(int count=0; count<(v); count++){
    sub                            = block[v-1-count][w-1]      [2];
    block[v-1-count][w-1]      [2] = block[0]        [w-1-count][1];
    block[0]        [w-1-count][1] = block[count]    [w-1]      [3];
    block[count]    [w-1]      [3] = block[0]        [count]    [0];
    block[0]        [count]    [0] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[v-1-ecount][0]         [4];
    block[v-1-ecount][0]         [4] = block[v-1]       [w-1-ecount][4];
    block[v-1]       [w-1-ecount][4] = block[ecount]    [w-1]       [4];
    block[ecount]    [w-1]       [4] = block[0]         [ecount]    [4];
    block[0]         [ecount]    [4] = sub;
  }
}
void CW5(){//B
  for(int count=0; count<(v); count++){
    sub                            = block[v-1-count][0]        [2];
    block[v-1-count][0]        [2] = block[v-1]      [w-1-count][1];
    block[v-1]      [w-1-count][1] = block[count]    [0]        [3];
    block[count]    [0]        [3] = block[v-1]      [count]    [0];
    block[v-1]      [count]    [0] = sub;
  }
  //corners
  for(int ecount=0; ecount<w-1; ecount++){
    sub                              = block[v-1-ecount][0]         [5];
    block[v-1-ecount][0]         [5] = block[v-1]       [w-1-ecount][5];
    block[v-1]       [w-1-ecount][5] = block[ecount]    [w-1]       [5];
    block[ecount]    [w-1]       [5] = block[0]         [ecount]    [5];
    block[0]         [ecount]    [5] = sub;
  }

}

 void M1CW(){
    for(int count=0; count<(w); count++){
      sub =                    block[1][count]    [2];
      block[1][count]    [2] = block[1][w-1-count][4];
      block[1][w-1-count][4] = block[1][w-1-count][3];
      block[1][w-1-count][3] = block[1][count]    [5];
      block[1][count]    [5] = sub;
    }
  }
  void M1CCW(){
    for(int count=0; count<(w); count++){
      sub                    = block[0][count]    [5];
      block[0][count]    [5] = block[0][w-1-count][3];
      block[0][w-1-count][3] = block[0][w-1-count][4];
      block[0][w-1-count][4] = block[0][count]    [2];
      block[0][count]    [2] = sub;
    }
  }
  void E1CW(){
    for(int count=0; count<(v); count++){
      sub                      = block[count]    [w-2][0];
      block[count]    [w-2][0] = block[count]    [w-2][4];
      block[count]    [w-2][4] = block[v-1-count][w-2][1];
      block[v-1-count][w-2][1] = block[v-1-count][w-2][5];
      block[v-1-count][w-2][5] = sub;
    }
  }
  void E1CCW(){
    for(int count=0; count<(v); count++){
      sub                      = block[v-1-count][w-2][5];
      block[v-1-count][w-2][5] = block[v-1-count][w-2][1];
      block[v-1-count][w-2][1] = block[count]    [w-2][4];
      block[count]    [w-2][4] = block[count]    [w-2][0];
      block[count]    [w-2][0] = sub;
    }
  }
  void S1CW(){
    for(int count=0; count<(v); count++){
      sub                            = block[1]        [count]    [0];
      block[1]        [count]    [0] = block[count]    [w-2]      [3];
      block[count]    [w-2]      [3] = block[1]        [w-1-count][1];
      block[1]        [w-1-count][1] = block[v-1-count][w-2]      [2];
      block[v-1-count][w-2]      [2] = sub;
    }
  }
  void S1CCW(){
    for(int count=0; count<(v); count++){
      sub                            = block[v-1-count][w-2]      [2];
      block[v-1-count][w-2]      [2] = block[1]        [w-1-count][1];
      block[1]        [w-1-count][1] = block[count]    [w-2]      [3];
      block[count]    [w-2]      [3] = block[1]        [count]    [0];
      block[1]        [count]    [0] = sub;
    }
  }
