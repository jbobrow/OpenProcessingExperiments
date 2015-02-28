
void mouseClicked(){
  generateBranches();
  windDirection = random(TWO_PI);
  redrawTrees();
}

void keyTyped(){
  if(key == 'm'){
    drawWind = !drawWind;
    println(drawWind);
  }
  if(key== 'n')
    drawVeins = !drawVeins;
  if(key=='c')
    blackLeaves = !blackLeaves;
  if(key=='l')
    drawLeaves = !drawLeaves;
    
  if(key == 'p'){
    pauseWind = !pauseWind;
    if(pauseWind)
      windVelocity = 0;
  }

  if(key == '='){
    if(transparency<240){
      transparency +=10;
      leafColor = color(5,113,3,transparency);
    }
    println("transparency: "+transparency);
  }
  if(key == '-'){
    if(transparency>0){
      transparency -=10;
      leafColor = color(5,113,3,transparency);
    }
    println("transparency: "+transparency);
  }
  
  //more/less wiggly
  if(key=='q'){
    if(maxdThetaWander==0)
      maxdThetaWander = .01;
    maxdThetaWander = maxdThetaWander*1.2;
    generateBranches();
  }
  if(key=='a'){
    maxdThetaWander = maxdThetaWander/1.2;
    generateBranches();
  }
  
  //more/less branches
  if(key=='w'){
    if(branchSpawnOdds<1)
      branchSpawnOdds += .1;
    generateBranches();
  }
  if(key=='s'){
    if(branchSpawnOdds>0)
      branchSpawnOdds -= .1;
    generateBranches();    
  }

  
  //fatter/thinner branches
  if(key=='e'){
    maxBranchThickness = maxBranchThickness*1.2;
    maxBranchSizeForLeaves = maxBranchSizeForLeaves*1.2;
    minBranchThickness = minBranchThickness*1.2;
    generateBranches();
  }
  if(key=='d'){
    maxBranchThickness = maxBranchThickness/1.2;
    maxBranchSizeForLeaves = maxBranchSizeForLeaves/1.2;
    minBranchThickness = minBranchThickness/1.2;
    generateBranches();
  }

  //more/less leaves
  if(key=='r'){
    if(leafSpawnOdds<1)
      leafSpawnOdds += .1;
    generateBranches();
  }
  if(key=='f'){
    if(leafSpawnOdds>0)
      leafSpawnOdds -= .1;
    generateBranches();    
  }
  
  //bigger/smaller leaves
  if(key=='t'){
    minLength = minLength*1.2; //leaf length
    maxLength = maxLength*1.2; //leaf length
    generateBranches();
  }
  if(key=='g'){
    minLength = minLength/1.2; //leaf length
    maxLength = maxLength/1.2; //leaf length
    generateBranches();
  }
  
  if(key =='['){
    if(nLeafPoints > 6){
      nLeafPoints-=2;
      defineLeafOutline();
      defineVeins();
      println("nLeafPoints: "+nLeafPoints);
    }
  }
  if(key ==']'){
    nLeafPoints+=2;
    defineLeafOutline();
    defineVeins();
    println("nLeafPoints: "+nLeafPoints);
  }
  
  //reset
  if(key =='1')//natural-ish tree. looks healthy!
    initializeTreeValues();

  //hand-picked tree types!
  if(key =='2'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 10;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 1; 
    minSpawnDistance = .3;
    branchSpawnOdds = .8; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = PI/2;
    maxdThetaSplit = PI/2;
    maxdThetaWander = 0;
    dBranchSize = 0;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .7;
    generateBranches();
  }
  if(key =='3'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 10;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 2;
    minSpawnDistance = .2;
    branchSpawnOdds = .8; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = PI/3;
    maxdThetaSplit = PI/3;
    maxdThetaWander = 0;
    dBranchSize = 0;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .7;
    generateBranches();
  }
  if(key =='4'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 10;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 2;
    minSpawnDistance = .2;
    branchSpawnOdds = .8; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = PI/4;
    maxdThetaSplit = PI/4;
    maxdThetaWander = 0;
    dBranchSize = 0;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .7;
    generateBranches();
  }
  if(key =='5'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 10;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 2;
    minSpawnDistance = .1;
    branchSpawnOdds = .3; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = 0;
    maxdThetaSplit = PI/4;
    maxdThetaWander = PI/4;
    dBranchSize = .2;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .7;
    generateBranches();
  }
  
  if(key =='6'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 40;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 2;
    minSpawnDistance = .5;
    branchSpawnOdds = .3; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = 0;
    maxdThetaSplit = PI/2;
    maxdThetaWander = PI/8;
    dBranchSize = 0;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .4;
    generateBranches();
  }
  
  if(key =='7'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 5;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 2;
    minSpawnDistance = .1;
    branchSpawnOdds = .2; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = 0;
    maxdThetaSplit = .3;
    maxdThetaWander = PI/30;
    dBranchSize = 0;
    //leaves
    minLength = 30;
    maxLength = 60;
    minWidth = .1;
    maxWidth = .2;
    leafSpawnOdds = .7;
    generateBranches();
  }
  
  if(key =='8'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = false;
    drawLeaves = true;
    //branch
    nSegments = 15;
    totalBranchLength = 400;
    maxBranchThickness = 5;
    maxBranchSizeForLeaves = 1;
    minBranchThickness = .5;
    minSpawnDistance = .7;
    branchSpawnOdds = 1; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = 0;
    maxdThetaSplit = PI/6;
    maxdThetaWander = PI/30;
    dBranchSize = 0;
    //leaves
    minLength = 30;
    maxLength = 60;
    minWidth = .3;
    maxWidth = .5;
    leafSpawnOdds = 1;
    generateBranches();
  }
  
 if(key=='9'){
    pauseWind = false;
    drawWind = false;
    drawVeins = false;
    blackLeaves = true;
    drawLeaves = true;
    //branch
    nSegments = 20;
    totalBranchLength = 400;
    maxBranchThickness = 10;
    maxBranchSizeForLeaves = 4;
    minBranchThickness = 1.5;
    minSpawnDistance = .2;
    branchSpawnOdds = .3; 
    branchSpawnOddsOfSecond = 0;
    mindThetaSplit = PI/7;
    maxdThetaSplit = PI/6;
    maxdThetaWander = PI/10;
    dBranchSize = 0;
    //leaves
    minLength = 10;
    maxLength = 30;
    minWidth = .4;
    maxWidth = .5;
    leafSpawnOdds = .1;
    generateBranches();
 }
  
  redrawTrees();
}


