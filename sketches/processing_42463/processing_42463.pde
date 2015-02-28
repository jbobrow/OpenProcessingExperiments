
void checkPuzzle(){
  boolean richtig=true;
  for(int i=0;i<16;i++){
    if(puzzle[i]!=vorlage[i]){
      richtig=false;
   
    }
  }
  if(richtig==true){
    aktBild=(aktBild+1)%maxLevel;
    for(int i=0;i<16;i++){
    puzzle[i]=12;
  }
  wahl[0]=0;
  wahl[1]=4;
  wahl[2]=12;
  wahl[3]=2;  
  waitForClick=true;
  fill(0,255,0);
  rect(400,450,200,25);
  fill(0);
  text("         Next Puzzle!",400,453,200,25);
    
  }
}

