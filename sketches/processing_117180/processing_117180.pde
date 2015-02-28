
PFont f;
int page = 0;
String p1 = "START DOWNLOAD";
String p2 = "...NOW LOADING...";
String p3 = "FINISH!";


void setup(){
  
  size(480, 800);  
  f = createFont("Georgia", 50);
  textFont(f);
  
}

void draw(){
  
  textAlign(CENTER);
  background(0);
  fill(255);
  noStroke();
  
   if (page == 0) {
      background(0); 
      fill(255);
      textFont(f, 50); 
      text(p1, width/2, 100);
      
    }
    
    else if (page == 1) {
      background(50); 
      fill(200, 200, 200);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      
    }  
    
    else if (page == 2) {
      background(100); 
      fill(150, 150, 150);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
    
    }
    
     else if (page == 3) {
      background(100); 
      fill(150, 150, 150);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      
    }
    
      else if (page == 4) {
      background(100); 
      fill(150, 150, 150);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      rect(140, height/2 - 50 , 30, 50, 7);
      
    }
    
      else if (page == 5) {
      background(100); 
      fill(150, 150, 150);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      rect(140, height/2 - 50 , 30, 50, 7);
      rect(170, height/2 - 50 , 30, 50, 7);
      
    }
    
      else if (page == 6) {
      background(100); 
      fill(150, 150, 150);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      rect(140, height/2 - 50 , 30, 50, 7);
      rect(170, height/2 - 50 , 30, 50, 7);
      rect(200, height/2 - 50 , 30, 50, 7);
      rect(230, height/2 - 50 , 30, 50, 7);
      
    }
    
      else if (page == 7) {
      background(150); 
      fill(100, 100, 100);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      rect(140, height/2 - 50 , 30, 50, 7);
      rect(170, height/2 - 50 , 30, 50, 7);
      rect(200, height/2 - 50 , 30, 50, 7);
      rect(230, height/2 - 50 , 30, 50, 7);
      rect(260, height/2 - 50 , 30, 50, 7);
      rect(290, height/2 - 50 , 30, 50, 7);
      rect(320, height/2 - 50 , 30, 50, 7);
      
    }
    
      else if (page == 8) {
      background(200); 
      fill(50, 50, 50);
      textFont(f, 30); 
      text(p2, width/2, height/2 - 100);
      rect(80, height/2 - 50 , 30, 50, 7);
      rect(110, height/2 - 50 , 30, 50, 7);
      rect(140, height/2 - 50 , 30, 50, 7);
      rect(170, height/2 - 50 , 30, 50, 7);
      rect(200, height/2 - 50 , 30, 50, 7);
      rect(230, height/2 - 50 , 30, 50, 7);
      rect(260, height/2 - 50 , 30, 50, 7);
      rect(290, height/2 - 50 , 30, 50, 7);
      rect(320, height/2 - 50 , 30, 50, 7);
      rect(350, height/2 - 50 , 30, 50, 7);
      rect(380, height/2 - 50 , 30, 50, 7);
      
    }
    
    else if (page == 9) {
      background(255);
      fill(0);
      textFont(f, 70);
      text(p3, width/2, 700);
    }
    
}

void mousePressed() {
  if ( page  == 0) {
    page = 1;
  }
  
  else if ( page  == 1) {
    page = 2;
  }
  
  else if ( page  == 2) {
    page = 3;
  }
  
  else if ( page  == 3) {
    page = 4;
  }
  
  else if ( page  == 4) {
    page = 5;
  }
  
  else if ( page  == 5) {
    page = 6;
  }
  
  else if ( page  == 6) {
    page = 7;
  }
  
  else if ( page  == 7) {
    page = 8;
  }
  
    
  else if ( page  == 8) {
    page = 9;
  }
  
    
  else if ( page  == 9) {
    page = 0;
  }
  
  println(page);
}
