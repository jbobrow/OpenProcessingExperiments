
void accessories(){
  /***Garbage Bin****/
  pushMatrix();
  
  translate(50,450,0);
  int fps = 15;
  
  if(ourCurrentFrame%fps==0 && numInGB!=0) numInGB--;
  
  pushMatrix();
    translate(0,0,-.50);    
    image(garbageBin, 0,0);
  popMatrix();
  
  pushMatrix();
    translate(0,0,-.25);
    float num = numInGB;
    if(num == 0) num = 1;    
    if(numInGB <= 80) tint(0,255,0);
    else tint(255,0,0);
    
    image(gbBlogXtra,0,0);
    image(gbBlog, 0,40-((.63*num)/2), 80,(.63*num));    
  popMatrix();
  
  tint(200, 200);
  for(int i=enemies.size()-1; i>=0; i--){
    Enemy sprite = (Enemy) enemies.get(i);    
    if(sprite.overTrashBin == true) tint(255, 200);
  }
  
  checkingYourGarbage();
  image(garbageBin, 0,0);
  tint(255);
  
  popMatrix();
  
  /******Top Bar******/
  pushMatrix();
  
  translate(400,(25/2),1);  
  fill(0);
  rect(0,0, 800,25);  
  
  textFont(fontQuestions, 20);
  
  //Points
    fill(200);   
    text("Points: "+points+" / "+requiredPointsToPassLvl, 200,8,1);
  
  //Countdown
    fill(255); 
    if(runCountDown == true){    
      if(secNum > 9) text(minNum+":"+secNum, -10,8,1);
      else text(minNum+":0"+secNum, -10,8,1);
      
      if(frameRate2SecConverter4Countdown%30==0 && pause==false){
        if(secNum==0){
          minNum--;
          secNum = 60;
        }
        
        secNum--;
      }
      
      if(minNum==0 && secNum==0){
        if(points >= requiredPointsToPassLvl){
          itemsLoaded = false;
          lvl ++;
          minNum = 3;
          secNum = 0;
        }
        else{
          reset();
        }
      }
      
      if(pause == false) frameRate2SecConverter4Countdown++;   
    }
    
  //% of glass left
    fill(200); 
    text("Glass: "+POG+"%", -375,8,1);
  
  popMatrix();
  /*******************/
  
  /*****Answer Box****/
  pushMatrix();
  
  translate(742,412,0);
  
  tint(150);
  for(int i=enemies.size()-1; i>=0; i--){
    Enemy sprite = (Enemy) enemies.get(i);
    if(sprite.overAnsBox == true) tint(255);
  }
  
  checkSubmittedAns();
  image(answerBox, 0,0);
  tint(255);
  
  popMatrix();
  /*******************/
  
  /******Monster******/
  if(enemies.size()==0 && protagonists.size()==0){
    isTheMonsterDoingHisThing = NOPE;
    haveTheMonstersBeenMade = NOPE;
  }
  
  if(isTheMonsterDoingHisThing == YUP){
    if(haveTheMonstersBeenMade == NOPE){
      haveTheMonstersBeenMade = YUP;
      for(int i=0; i<enemies.size(); i++){
        for(int j=enemies.size()-1; j>=0; j--){
          Enemy sprite = (Enemy) enemies.get(j);
          
          protagonists.add(new monster(sprite.x, sprite.y, sprite.z));
        }
      }
      
      haveTheMonstersBeenMade = YUP;
    }
  }
  
  /*******************/ 
}

void checkSubmittedAns(){
  if(ansSubmitted==true){
    if(questionType==USCAPITOLS){
      if(submittedSAns == sAnswer){
        points+=300;
        numSpitesMade = 0;
        questionAnswered = true;
        isTheMonsterDoingHisThing = YUP;
      }
      else points-=150;
    }
    if(questionType==MATH){
      if(submittedFAns == fAnswer){
        points+=300;
        numSpitesMade = 0;
        questionAnswered = true;
        isTheMonsterDoingHisThing = YUP;
      }
      else points-=150;
    }
    
    ansSubmitted = false;
  }
}

void checkingYourGarbage(){
  if(threwAwayAnOption==true){
    if(questionType==USCAPITOLS){
      if(submittedSAns == sAnswer){
        reencarnateDeadAns = true;
      }
    }
    if(questionType==MATH){
      if(submittedFAns == fAnswer){
        reencarnateDeadAns = true;
      }
    }
    
    numInGB+=20;
    threwAwayAnOption = false;
  }
}

