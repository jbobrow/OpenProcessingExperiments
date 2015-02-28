
int[] array = new array[0];
int num = 0;
int rock, paper, sciss;
int toss = 0;
int sat = 160;
int wins = 0;
int loss = 0;

void setup(){
  size(512,512);
  array[0] = 0;
  frameRate(30);
  colorMode(HSB);
}

void draw(){
  background(sat,128,128);
  textSize(32);
  
  text("your throw",128,128);
  
  text("skynet's throw",128,256);  
  
  if(array[num] == 1){
    text("rock",128,192);
  }
  if(array[num] == 2){
    text("paper",128,192);
  }
  if(array[num] == 3){
    text("scissors",128,192);
  }
  
  if(toss == 1){
    text("rock",128,320);
  }
  if(toss == 2){
    text("paper",128,320);
  }
  if(toss == 3){
    text("scissors",128,320);
  }
  
  text("r="+int(rock),128,384);
  text("p="+int(sciss),256,384);
  text("s="+int(paper),384,384);
  text("wins="+wins,96,448);
  text("losses="+loss,320,448);
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      array[num+1] = 1;
      num += 1;
      skynet();
    }
    if(keyCode == UP){
      array[num+1] = 2;
      num += 1;
      skynet();
    }
    if(keyCode == RIGHT){
      array[num+1] = 3;
      num += 1;
      skynet();
    }
    if(keyCode == DOWN){
      array[num+1] = int(random(3)+1);
      num += 1;
      skynet();
    }
  }
}

void skynet(){
  rock = 0;
  paper = 0;
  sciss = 0;
  for(i = 3; i < num-1; i++){
    if(array[i-1] == array[num-1] && array[i-2] == array[num-2]){
      if(array[i] == 1){
        paper +=sqrt(i);
      }
      if(array[i] == 2){
        sciss +=sqrt(i);
      }
      if(array[i] == 3){
        rock +=sqrt(i);
      }
    }
  }
  
  
  if(rock > paper && rock > sciss){
    toss = 1;
  }
  else{
    if(paper > sciss){
      toss = 2;
    }
    else{
      if(sciss > paper){
        toss = 3;
      }
      else{
        toss = int(random(3)+1);
      }
    }
  }
  
  if(array[num] != toss ){
    if(array[num] == toss+1 || array[num] == toss-2){
      wins++;
    }
    else{
      loss++;
    }
  }
}


