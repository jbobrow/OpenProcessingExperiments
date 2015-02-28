
int position = 0;
int speed = 2;
int x_p1 = 50;
int y_p1 = 50;
int x_vel_p1 = 10;
int y_vel_p1 = 0;
int x_p2 = 50;
int y_p2 = 50;
int x_vel_p2 = -10;
int y_vel_p2 = 0;
int pellet_x = (int)random(10, width - 10);
int pellet_y = (int)random(10, height - 10);
int box_x = (int)random(10, width - 10);
int box_y = (int)random(10, height - 10);
int past_x_p1[] = new int[1];
int past_y_p1[] = new int[1];
int past_x_p2[] = new int[1];
int past_y_p2[] = new int[1];
int deaths_p1 = 0;
int deaths_p2 = 0;

boolean play = false;


void setup(){
  size(500,600);
  pellet_x = (int)random(20, width - 20);
  pellet_y = (int)random(20, height - 20);
  pellet_x = (pellet_x - pellet_x%10);
  pellet_y = (pellet_y - pellet_y%10);
  box_x = (int)random(20, width - 20);
  box_y = (int)random(20, height - 20);
  box_x = (box_x - box_x%10);
  box_y = (box_y - box_y%10);
  x_p2 = width - 50;
  y_p2 = height - 50;

}

void draw(){

if(play){
  offscreen_p1();
  pellet_p1();
  box_p1();
  offscreen_p2();
  pellet_p2();
  box_p2();
  
  for(int i = past_x_p1.length - 1; i > 0; i--){
    past_x_p1[i] = past_x_p1[i-1];
  }
  for(int i = past_y_p1.length - 1; i > 0; i--){
    past_y_p1[i] = past_y_p1[i-1];
  }
  past_x_p1[0] = x_p1;
  past_y_p1[0] = y_p1;
  
  
  for(int i = past_x_p2.length - 1; i > 0; i--){
    past_x_p2[i] = past_x_p2[i-1];
  }
  for(int i = past_y_p2.length - 1; i > 0; i--){
    past_y_p2[i] = past_y_p2[i-1];
  }
  past_x_p2[0] = x_p2;
  past_y_p2[0] = y_p2;

  background(0);
  

  position = position + 1;
  if(position >= speed){
    position = 0;
    x_p1 = x_p1 + x_vel_p1;
    y_p1 = y_p1 + y_vel_p1;
    x_p2 = x_p2 + x_vel_p2;
    y_p2 = y_p2 + y_vel_p2;
    boolean isdead_p1 = false;
    boolean isdead_p2 = false;
    for(int i = 1; i < past_x_p1.length; i++){
      if(past_x_p1[i] == x_p1 && past_y_p1[i] == y_p1){
        isdead_p1 = true;
      }
      if(past_x_p1[i] == x_p2 && past_y_p1[i] == y_p2){
        isdead_p2 = true;
      }
    }
    for(int i = 1; i < past_x_p2.length; i++){
      if(past_x_p2[i] == x_p2 && past_y_p2[i] == y_p2){
        isdead_p2 = true;
      }
      if(past_x_p2[i] == x_p1 && past_y_p2[i] == y_p1){
        isdead_p1 = true;
      }
    }
    if(isdead_p1){
      die_p1();
    }
    if(isdead_p2){
      die_p2();
    }
  }


  stroke(255,8,8);
  ellipse(x_p2,y_p2,10,10);
  for(int i = 0; i < past_x_p2.length; i++){
    ellipse(past_x_p2[i],past_y_p2[i],10,10);
  }
  
  fill(255,8,8);
  text(deaths_p1, width - 30, height - 20);
  noFill();
  
  stroke(21,202,255);
  ellipse(x_p1,y_p1,10,10);
  for(int i = 0; i < past_x_p1.length; i++){
    ellipse(past_x_p1[i],past_y_p1[i],10,10);
  }
  
  fill(21,202,255);
  text(deaths_p2,30, 20);
  noFill();
  
  stroke(255,255,255);
  ellipse(pellet_x, pellet_y, 10, 10);
  rect(box_x - 5, box_y - 5, 10, 10);
  noFill();
  stroke(21,202,255);
  rect(10, 10, width - 20, height - 20);
}
else{
  text("Push to play!", 50, 50);
  fill(125);
  rect(50, 100, 100, 50);
  
}
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if(y_vel_p1 == 10 && past_x_p1.length > 1 &&  past_x_p1[0] == past_x_p1[1]){  
      }
      else{
        y_vel_p1 = -10;
        x_vel_p1 = 0;
      }
    }
    if (keyCode == RIGHT) {
      if(x_vel_p1 == -10 && past_x_p1.length > 1 &&  past_y_p1[0] == past_y_p1[1]){    
      }
      else{
        y_vel_p1 = 0;
        x_vel_p1 = 10;
      }
    }
    if (keyCode == LEFT) {
      if(x_vel_p1 == 10 && past_x_p1.length > 1 &&  past_y_p1[0] == past_y_p1[1]){    
      }
      else{
        y_vel_p1 = 0;
        x_vel_p1 = -10;
      }
    }
    if (keyCode == DOWN) {
      if(y_vel_p1 == -10 && past_x_p1.length > 1 && past_x_p1[0] == past_x_p1[1]){     
      }
      else{
        y_vel_p1 = 10;
        x_vel_p1 = 0;
      }
    }

  }
  else{
    if(key == 'w' || key == 'W'){
      
      if(y_vel_p2 == 10 && past_x_p2.length > 1 &&  past_x_p2[0] == past_x_p2[1]){  
      }
      else{
        y_vel_p2 = -10;
        x_vel_p2 = 0;
      }
    }
    else if(key == 'a' || key == 'A'){
      if(x_vel_p2 == 10 && past_x_p2.length > 1 &&  past_y_p2[0] == past_y_p2[1]){    
      }
      else{
        y_vel_p2 = 0;
        x_vel_p2 = -10;
      }
    }
    if (key == 'd' || key == 'D') {
      if(x_vel_p2 == -10 && past_x_p2.length > 1 &&  past_y_p2[0] == past_y_p2[1]){    
      }
      else{
        y_vel_p2 = 0;
        x_vel_p2 = 10;
      }
    }
    if (key == 's' || key == 'S') {
      if(y_vel_p2 == -10 && past_x_p2.length > 1 && past_x_p2[0] == past_x_p2[1]){     
      }
      else{
        y_vel_p2 = 10;
        x_vel_p2 = 0;
      }
    }
  }
}

void die_p1(){
  past_x_p1 = new int[1];
  past_y_p1 = new int[1];
  x_p1 = 50;
  y_p1 = 50;
  x_vel_p1 = 10;
  y_vel_p1 = 0;
  past_x_p1[0] = 40;
  past_y_p1[0] = 50;
  deaths_p1 = deaths_p1 + 1;
}

void die_p2(){
  past_x_p2 = new int[1];
  past_y_p2 = new int[1];
  x_p2 = width - 50;
  y_p2 = height - 50;
  x_vel_p2 = -10;
  y_vel_p2 = 0;
  past_x_p2[0] = width - 40;
  past_y_p2[0] = 50;
  deaths_p2 = deaths_p2 + 1;
}

void offscreen_p1(){
  if(x_p1 >= width - 10 || x_p1 <= 10 || y_p1 >= height - 10 || y_p1 <= 10){
    die_p1();
  }
}

void pellet_p1(){
  if(x_p1 == pellet_x && y_p1 == pellet_y){
    pellet_x = (int)random(20, width - 20);
    pellet_x = (pellet_x - pellet_x%10);
    pellet_y = (int)random(20, height - 20);
    pellet_y = (pellet_y - pellet_y%10);
    int temp[] = new int[past_x_p1.length + 3];
    for(int k = 0; k < past_x_p1.length; k++){
      temp[k] = past_x_p1[k];
    }
    past_x_p1 = temp;
    int temp2[] = new int[past_y_p1.length + 3];
    for(int k = 0; k < past_y_p1.length; k++){
      temp2[k] = past_y_p1[k];
    }
    past_y_p1 = temp2;

  }
}


void offscreen_p2(){
  if(x_p2 >= width - 10 || x_p2 <= 10 || y_p2 >= height - 10 || y_p2 <= 10){
    die_p2();
  }
}

void pellet_p2(){
  if(x_p2 == pellet_x && y_p2 == pellet_y){
    pellet_x = (int)random(20, width - 20);
    pellet_x = (pellet_x - pellet_x%10);
    pellet_y = (int)random(20, height - 20);
    pellet_y = (pellet_y - pellet_y%10);
    int temp[] = new int[past_x_p2.length + 3];
    for(int k = 0; k < past_x_p2.length; k++){
      temp[k] = past_x_p2[k];
    }
    past_x_p2 = temp;
    int temp2[] = new int[past_y_p2.length + 3];
    for(int k = 0; k < past_y_p2.length; k++){
      temp2[k] = past_y_p2[k];
    }
    past_y_p2 = temp2;

  }
}

void box_p1(){
  if(x_p1 == box_x && y_p1 == box_y){
    box_x = (int)random(20, width - 20);
    box_x = (box_x - box_x%10);
    box_y = (int)random(20, height - 20);
    box_y = (box_y - box_y%10);
    int temp[] = past_x_p2;
    past_x_p2 = new int[(past_x_p2.length + 1)/2];
    for(int i = 0; i < past_x_p2.length; i++){
      past_x_p2[i] = temp[i];
    }
    int temp2[] = past_y_p2;
    past_y_p2 = new int[(past_y_p2.length + 1)/2];
    for(int i = 0; i < past_y_p2.length; i++){
      past_y_p2[i] = temp2[i];
    }
  }
}


void box_p2(){
  if(x_p2 == box_x && y_p2 == box_y){
    box_x = (int)random(20, width - 20);
    box_x = (box_x - box_x%10);
    box_y = (int)random(20, height - 20);
    box_y = (box_y - box_y%10);
    int temp[] = past_x_p1;
    past_x_p1 = new int[(past_x_p1.length + 1)/2];
    for(int i = 0; i < past_x_p1.length; i++){
      past_x_p1[i] = temp[i];
    }
    int temp2[] = past_y_p1;
    past_y_p1 = new int[(past_y_p1.length + 1)/2];
    for(int i = 0; i < past_y_p1.length; i++){
      past_y_p1[i] = temp2[i];
    }
  }
}

void mousePressed(){
  if(play == false && mouseX >= 50 && mouseY >= 100 && mouseX <= 150 && mouseY <= 150){
    play = true;
  }
}

