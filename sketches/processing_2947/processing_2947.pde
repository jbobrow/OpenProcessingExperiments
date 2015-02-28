
void mouseClicked(){ 
  noStroke();
  resetSome();
}

void keyTyped(){ 
  if(key=='r')//reset everything 
    resetAll(); 
  if(key==' ')//like resetting, but keeping previous settings 
    resetSome(); 
  if(key=='l'){ 
    randomStartingLocation = !randomStartingLocation; 
    resetSome(); 
  } 
  if(key=='i') 
    reincarnate = !reincarnate; 
  if(key=='b'){ 
    background(0); 
  } 
  if(key=='c') 
    useColors = !useColors; 
  if(key=='p') 
    checkPathHits = !checkPathHits; 
  if(key=='s')
    sineScaling = !sineScaling;
  if(key=='f'){
    if(fade){
      minColor = 0;
      background(minColor); 
    }
    else{
      minColor = floor(127/floor(fadeAlpha));
      background(minColor); 
    }
    fade = !fade;
  }
   
  if(key == '_')//bigger v_t 
    vtScaling = 1.5*vtScaling; 
  if(key == '-')//smaller v_t 
    vtScaling = vtScaling/1.5; 
     
  if(key == '+')//bigger v_r 
    vrScaling = 1.5*vrScaling; 
  if(key == '=')//smaller v_r 
    vrScaling = vrScaling/1.5; 
     
     
  if(key == '{')//bigger diam 
    diameterScaling = constrain(1.5*diameterScaling,.5,20); 
  if(key == '[')//smaller diam 
    diameterScaling = constrain(diameterScaling/1.5,.5,20); 
    
  if(key == '}'){//more movers 
    newnMovers = constrain(floor(nMovers*1.5),2,2000);
    println("nMovers: "+nMovers+" to "+newnMovers);
    mover[] movers2 = new mover[newnMovers]; 
    for(int i=0; i<nMovers; i++){
      movers2[i] = movers[i];
    }
    for(int i=nMovers; i<newnMovers; i++){ 
      int choice = (int)random(nMovers); //where to spawn it!
      movers2[i] = new mover(i,movers[choice].x,movers[choice].y); 
    } 
    nMovers = newnMovers;
    movers = movers2;
  }
  if(key == ']'){//fewer movers 
    newnMovers = constrain(floor(nMovers/1.5),1,2000); 
    println("nMovers: "+nMovers+" to "+newnMovers); 
    if(newnMovers != nMovers){ 
      mover[] movers2 = new mover[newnMovers];
      for(int i=0; i<newnMovers; i++){ 
          movers2[i] = movers[i]; 
      } 
      nMovers = newnMovers; 
      movers = movers2; 
    } 
  }
  
  
  if(key=='\"')//shorter sections
    frequency = frequency*1.2;
  if(key=='\'')//longer sections
    frequency = frequency/1.2;
    
  if(key==':')//changes the waist ratio, basically
    minDiam = constrain(minDiam*1.1, 0, maxDiam);    
  if(key==';')
    minDiam = constrain(minDiam/1.1, 0, maxDiam);
  
  
  if(key=='/'){//fading values!
    fadeAlpha = constrain(fadeAlpha-1, 1, 20);
    if(fade){
      minColor = floor(127/floor(fadeAlpha));
      background(minColor);
    }
  }
  if(key=='.'){
    fadeAlpha = constrain(fadeAlpha+1, 1, 20);
    if(fade){
      minColor = floor(127/floor(fadeAlpha));
      background(minColor);
    }
  }
  
  
  //these are the special settings!
  if(key=='1'){
    fadeAlpha = 5;
    minColor = 0;
    fade = false;
    
    randomStartingLocation = false; 
    reincarnate = true; 
    checkPathHits = true; 
    useColors = false;
    sineScaling = false;
     
    nMovers = 10; 
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/40; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1; 
    maxDiam = 1;
    minDiam = maxDiam*.5;
   
    diameterScaling = 1; 
    vrScaling = 1; 
    vtScaling = 1; 
     
    resetSome(); 
  }
  if(key=='2'){
    fadeAlpha = 5;
    minColor = floor(127/floor(fadeAlpha));
    fade = true;

    randomStartingLocation = true;
    reincarnate = true;
    checkPathHits = true;
    useColors = true;
    sineScaling = true;
    frequency = 1.5e-1;
    
    nMovers = 30;
    movers = new mover[nMovers];
   
    v_theta_max = PI/80;
    a_theta_max = v_theta_max/5; // d(v_theta)/dt
   
    v_r_max = 1;
    maxDiam = 5;
    minDiam = maxDiam*.3;
   
    diameterScaling = 1;
    vrScaling = 1;
    vtScaling = 1;
    
    resetSome();
  }
  if(key=='3'){
    fadeAlpha = 5;
    minColor = 0;
    fade = false;
    
    randomStartingLocation = false;
    reincarnate = false;
    checkPathHits = true;
    useColors = true;
    sineScaling = true;
    frequency = 1.5e-1;
    
    nMovers = 30;
    movers = new mover[nMovers];
   
    v_theta_max = 1e-1;
    a_theta_max = 1e-2; // d(v_theta)/dt
   
    v_r_max = 1;
    maxDiam = 3;
    minDiam = maxDiam*.3;
   
    diameterScaling = 1;
    vrScaling = 6;
    vtScaling = 1;
    
    resetSome();
  }
  if(key=='4'){
    fadeAlpha = 5;
    minColor = 0;
    fade = false;
    
    randomStartingLocation = false; 
    reincarnate = true; 
    checkPathHits = true; 
    useColors = false;
    sineScaling = false;
     
    nMovers = 50; 
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/40; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1; 
    maxDiam = .5;
    minDiam = maxDiam*.5;
   
    diameterScaling = 1; 
    vrScaling = 2; 
    vtScaling = 2; 
     
    resetSome(); 
  }
  if(key=='5'){
    fadeAlpha = 5;
    minColor = 0;
    fade = false;
    
    randomStartingLocation = false; 
    reincarnate = false; 
    checkPathHits = true; 
    useColors = true;
    sineScaling = true;
    frequency = 2e-2;
     
    nMovers = 14; 
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/40; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1; 
    maxDiam = 15;
    minDiam = maxDiam*.2;
   
    diameterScaling = 1; 
    vrScaling = 1; 
    vtScaling = .2; 
     
    resetSome(); 
  }
  if(key=='6'){
    fadeAlpha = 10;
    minColor = floor(127/floor(fadeAlpha));
    fade = true;
    
    randomStartingLocation = true;
    reincarnate = true;
    checkPathHits = true; 
    useColors = false;
    sineScaling = false;
     
    nMovers = 700;
    movers = new mover[nMovers]; 
   
    v_theta_max = 1e-3; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1;
    maxDiam = 7;
    minDiam = maxDiam*.6;
   
    diameterScaling = 1;
    vrScaling = 3;
    vtScaling = 1;
     
    resetSome(); 
  }
  if(key=='7'){
    fadeAlpha = 15;
    minColor = floor(127/floor(fadeAlpha));
    fade = true;
    
    randomStartingLocation = false;
    reincarnate = true;
    checkPathHits = true; 
    useColors = false;
    sineScaling = false;
     
    nMovers = 45;
    movers = new mover[nMovers]; 
   
    v_theta_max = 1e-3; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1;
    maxDiam = 1;
    minDiam = maxDiam*.6;
   
    diameterScaling = 1;
    vrScaling = 3;
    vtScaling = 1;
     
    resetSome(); 
  }
  if(key=='8'){
    fadeAlpha = 5;
    minColor = 0;
    fade = false;
    
    randomStartingLocation = true;
    reincarnate = false;
    checkPathHits = true; 
    useColors = true;
    sineScaling = true;
    frequency = 1.5e-1;
     
    nMovers = 80;
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/100; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1;
    maxDiam = 6;
    minDiam = maxDiam*.1;
   
    diameterScaling = 1;
    vrScaling = 1.5;
    vtScaling = .8;


    resetSome(); 
  }
  if(key=='9'){
    fadeAlpha = 10;
    minColor = floor(127/floor(fadeAlpha));
    fade = true;
    
    randomStartingLocation = false; 
    reincarnate = true; 
    checkPathHits = true; 
    useColors = false;
    sineScaling = false;
     
    nMovers = 400; 
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/40; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1; 
    maxDiam = 1.5;
    minDiam = maxDiam*.5;
   
    diameterScaling = 1; 
    vrScaling = 1; 
    vtScaling = 1; 
     
    resetSome(); 
  }
if(key=='0'){
    fadeAlpha = 20;
    minColor = floor(127/floor(fadeAlpha));
    fade = true;
    
    randomStartingLocation = false; 
    reincarnate = true; 
    checkPathHits = false; 
    useColors = true;
    sineScaling = true;
    frequency = .1;
     
    nMovers = 600; 
    movers = new mover[nMovers]; 
   
    v_theta_max = PI/40; 
    a_theta_max = v_theta_max/5; // d(v_theta)/dt 
   
    v_r_max = 1; 
    maxDiam = 3;
    minDiam = maxDiam*.2;
   
    diameterScaling = 1; 
    vrScaling = 1.2; 
    vtScaling = .3;
     
    resetSome(); 
  }
} 


