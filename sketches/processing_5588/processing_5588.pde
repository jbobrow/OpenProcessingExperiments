
/**
 * These are public methods to change the character.
 */

/**
 * Change to "missing"
 */
void changeToMissing() {
  
  // change character data
  wNum = 128;                 
  hNum = 32;                 
  
  pixMode = 0;                
  fileName = "missing.txt";                
  setupCharData();           
  
}

/**
 * Change to next character (A to Z) 
 */
void changeToNext() {
  
  // change character data
  wNum = 32;                      
  hNum = 32;
  
  // return to first color
  int i = 0;
  for(int y=-particleMargin; y<height+particleMargin; y+=particlesDensity) { 
    for(int x=-particleMargin; x<width+particleMargin; x+=particlesDensity) { 
       if (i == particles.length) { 
         break; 
       } 
       // create the color
       int c = color(50+50*sin(PI*x/width), 127, 255*sin(PI*y/width)); 
       particles[i++].theColor = c; 
    } 
  }
  
  // to next character
  if(fileNo == 25) {
    fileNo = 0;
  } else {
    fileNo++;
  }
  
  fileName = "data" + fileNo + ".tbl";
  setupCharData();              
}

/**
 *  Change to character of pressed key
 */
void changeToKey(char key) {
  
  boolean isAtoZ = false; 
   
  // search alphabets
  for(int i=0; i<alphabets.length; i++) {
    if (key == alphabets[i]) {
       
      fileNo = i;
      isAtoZ = true;
      
      // change character data
      wNum = 32;                               
      hNum = 32;                                
      fileName = "data" + fileNo + ".tbl";
      setupCharData();
      return;
    }
  }
  
  // if 1-4 or Direction keys => draw the character of Seasons.
  if(key == '1') keyCode = 37;
  if(key == '2') keyCode = 38;
  if(key == '3') keyCode = 39;
  if(key == '4') keyCode = 40;
  
  if((isAtoZ == false) && (36 < keyCode && keyCode < 41)) {
    changeToSeasons(keyCode); 
    setupCharData();
    return;
  } else {
    
    // else => draw "missing"
    changeToMissing();
    setupCharData();
    return;
  }
}

/**
 * Change to character of seasons
 */
void changeToSeasons(int keyCode) {
  pixMode = 0;
  switch(keyCode) {
    case LEFT:
      fileName = "spring.txt";       // "春"(spring)
      // change color
      for(int i=0; i<particles.length; i++) {
        int c = color(200+50*sin(PI*particles[i].yPos/width),32, 255*sin(PI*particles[i].xPos/width));    
        particles[i].theColor = c;
      }
      break;
      
    case UP:
      fileName = "summer.txt";      // "夏"(summer)
      // change color
      for(int i=0; i<particles.length; i++) {
        int c = color(64*sin(PI*particles[i].xPos/height), 64, 128+50*sin(PI*particles[i].yPos/width));    
        particles[i].theColor = c;
      }
      break;    
      
    case RIGHT:
      fileName = "autumn.txt";       // "秋"(autumn)
      // change color
      for(int i=0; i<particles.length; i++) {
        int c = color(180*sin(PI*particles[i].yPos/width), 32, 32*sin(PI*particles[i].xPos/height));    
        particles[i].theColor = c;
      }
      break;
      
    case DOWN:
      fileName = "winter.txt";      // "冬"(winter)
      // change color
      for(int i=0; i<particles.length; i++) {
        int c = color(100+255*sin(PI*particles[i].xPos/height), 255, 255+50*sin(PI*particles[i].yPos/width));    
        particles[i].theColor = c;
      }
      break;
  }
  
  wNum = 64;                                 
  hNum = 64;                                 
}

/**
 * Draw text "click or press any key"
 */
void changeToStart() {
  
  fileName = "start.txt";
  
  pixMode = 0;
  
  wNum = 172;
  hNum = 32;
  
}

