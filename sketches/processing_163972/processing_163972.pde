
/*still in its fledgling stage--you have to remove stones yourself, for example*/

int sts=30, bw=19, bl=19, b0x=sts, b0y=sts; /*Technically the board size is 18x18 but there are 19x19 stone spaces*/
int[][][] stones0 = new int[2][bw][bl];
int[][][] stones1 = new int[2][bw][bl];
int move=0, turn;
int undones = 0;
IntList Moves = new IntList();

void setup() {
  size((bw+1)*sts, (bl+1)*sts);
  println(stones0[0][0].length);
}

void draw() {
  turn=move%2;
  background(#F0B010);
  strokeWeight(1);
  for (int i=1; i<=bw; ++i) {
    line(i*sts, b0y, i*sts, height-sts);
    line(b0x, i*sts, width-sts, i*sts);
  }
  if (bw==19 && bl==19) {
    strokeWeight(4);
    for (int i=4; i<=19; i+=6) {
      for (int j=4; j<=19; j+=6) {
        point(i*sts, j*sts);
      }
    }
  }
  
  strokeWeight(1);
  
  for(int i=0;i<bw;++i){
    for(int j=0;j<bl;++j){
      if(stones0[0][i][j]==1){
        drawstones(i,j,0); //Black stones
      }
      if(stones0[1][i][j]==1){
        drawstones(i,j,1);
      }
    }
  }
}

void drawstones(int x, int y, int t){
  fill(t*#FFFFFF);
  ellipse(b0x+x*sts, b0y+y*sts, sts, sts);
}

void mouseReleased() {
  if (stones0[0][floor((mouseX-sts/2.0)/sts)][floor((mouseY-sts/2.0)/sts)]==0 && stones0[1][floor((mouseX-sts/2.0)/sts)][floor((mouseY-sts/2.0)/sts)]==0){
    stones0[turn][floor((mouseX-sts/2.0)/sts)][floor((mouseY-sts/2.0)/sts)]=1;
    ++move;
    Moves.append(floor((mouseX-sts/2.0)/sts));
    Moves.append(floor((mouseY-sts/2.0)/sts));
  }
  else{
    stones0[turn][floor((mouseX-sts/2.0)/sts)][floor((mouseY-sts/2.0)/sts)]=0;
  }
  
  for(int y=0;y<bl;++y){
    for(int x=0;x<bw;++x){
      //print(stones0[1][x][y]+", ");
    }
    print('\n');
  }
//  println(Moves);
//  println();
//  println();
  println(move);
  println(Moves);
}

void Undo(){
  if(undones<2*move){
    stones0[abs((turn-1-undones/2)%2)][Moves.get(2*move-undones-2)][Moves.get(2*move-undones-1)] = 0;
    undones+=2;
  }
}

void Redo(){
  if(undones>=0){
    stones0[abs((turn-1+undones/2)%2)][Moves.get(2*move-undones-2)][Moves.get(2*move-undones-1)] = 1;
    undones-=2;
  }
}

void keyPressed(){
  if(key=='u' || key=='U'){
    Undo();
  }
  else if(key=='r'||key=='R'){
    Redo();
  }
  else if(key=='c'||key=='C'){
    for(int t=0;t<2;++t){
      for(int i=0;i<bw;++i){
        for(int j=0;j<bl;++j){
          stones0[t][i][j]=0;
        }
      }
    }
  }
}


/*
void removestones(int stones[][][], int temp[][][], int t){
  opp = (t+1)%2;
  for(int x=0;x<bw;++x){
    for(int y=0;y<bl;++y){
      oppadj = groupAdjacentStones(stones[opp]);
      
    }
  }
}
*/
