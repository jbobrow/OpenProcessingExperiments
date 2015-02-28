
//class Cloud {
//  int NUMFLAKES, flakesInCloud;
//  float x, y;
//  int z;
//  Snowflake[] flakes;
//  int lastFlakeSlot;
//
//  Cloud() {
//    z = (int)random(0,8);
//    x = random(-width,0);
//    y = random(0,height*0.3);
//    NUMFLAKES = 250;
//    //number of flakes allowed in the cloud at any given moment
//    flakesInCloud = 40; 
//    lastFlakeSlot = 0;
//
//    flakes = new Snowflake[NUMFLAKES];
//    for(int i = 0; i < flakesInCloud; i++) makeSnowFlake();
//
//  } 
//
//  void snow() {
//    x += z*0.25;
//    pushStyle();
//    noStroke();
//    fill(140,140,220);
//    rect(x,y, 80,40);
//    popStyle();
//    
//    if(x > width) x = random(-width,0);
//    
//    for(int i = 0; i < 250; i++) {
//      if(i < lastFlakeSlot) {
//
//        flakes[i].fall();
//        if(flakes[i].y > height + 70) flakes[i] = new Snowflake(x,y,80,40);
//        if(flakes[i].y > y + 40 && lastFlakeSlot < NUMFLAKES) makeSnowFlake();
//      }
//    }
//  }
//  
//  void makeSnowFlake() {
//    flakes[lastFlakeSlot] = new Snowflake(x,y,80,40);
//    if(lastFlakeSlot < NUMFLAKES) lastFlakeSlot ++;
//  }
//}





