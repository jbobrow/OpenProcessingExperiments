
void patternFour(){
  for (int y = 1; y < height-1; y++) {
    for (int x = 1; x < width-1; x++){
      //int loc = video.width*y + x;
      int loc = width*y + x;
      //rules
      if( mousePressed == true && dist (x,y,mouseX,mouseY) < 5) {
        world0[loc] = 1;
      } 
      if (world0[loc] == 1){
        counterStart[loc] = true;
      }
      if (counterStart[loc] == true){
      if (bgCounter[loc] <= stopOne[loc]){
        rule1[loc] = 2;
        rule2[loc] = 1;
        rule3[loc] = 8;
        cLive = cred;
        bgCounter[loc]++;
      }
      if ((bgCounter[loc] > stopOne[loc]) && (bgCounter[loc] <= stopTwo[loc])){
        rule1[loc] = 7;
        rule2[loc] = 7;
        rule3[loc] = 8;
        cLive = cgreen;
        bgCounter[loc]++;
      }
      if (bgCounter[loc] > stopTwo[loc]){ 
        counterStart[loc] = false;
        bgCounter[loc] = 0;
      }
    }
      if (counterStart[loc] == false){
        if (mainCounter < mainStopOne){
          rule1[loc] = 3;
          rule2[loc] = 4;
          rule3[loc] = 5;
          cLive = cred;
          mainCounter++;
        }
        if ( (mainCounter >= mainStopOne) && (mainCounter < mainStopTwo) ){
          rule1[loc] = 4;
          rule2[loc] = 4;
          rule3[loc] = 5;
          cLive = cgreen;
          mainCounter++;
        }
        if ( (mainCounter >= mainStopTwo) && (mainCounter < mainStopThree) ){
          rule1[loc] = 2;
          rule2[loc] = 1;
          rule3[loc] = 1;
          cLive = cblue;
          mainCounter++;
        }
        if (mainCounter == mainStopThree) {
          mainCounter = 0;
          rule1[loc] = 8;
          rule2[loc] = 8;
          rule3[loc] = 8;
        }

      }
      int count = neighbors(loc); 
      
      if (count >= rule1[loc] && world0[loc] == 0) 
      { 
        world1[loc] = 1;
      } 
      if ((count < rule2[loc] || count < rule3[loc]) && world0[loc] == 1) 
      { 
        world1[loc] = -1;
      }
      
      if (world0[loc] == 1 || world1[loc] == 1){
        pixels[loc] = cLive;
      }
      else{
        pixels[loc] = black;
      }
      loc++;
    }
  }
}

