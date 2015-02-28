
int currentTime = 0; 
int sec = 1000; 
int minu = sec* 60; 
int hr = minu* 60; 
int r = 20; 
int a = 100; 
int b = 680; 
int c = 200; 
float d = 690; 
float e = 300; 
float j = 690; 
PFont font; 

void setup(){  
  size (350, 700);
 smooth();  
  background(255); 
  font = loadFont("AgencyFB-Bold-48.vlw"); 
  textFont(font); 
}
  void draw(){ 
    background(0); 
    stroke(255); 
    line(0, 100, 250, 100);  
    line(250, 100, 250, 460); 
    line(250, 460, 350, 460); 
    line(350, 460, 350, 390); 
    line(350, 390, 450, 390); 
    line(450, 390, 450, 580); 
    line(450, 580, 600, 580); // lines decididing end of time 
    // lines dividing space for time 
    int secs = millis()/ 1000; 
    int mins = millis()/ 60000; 
    int hrs = millis()/ 6000000; 
   
  
    text((secs), 90, 100); 
    text((mins), 190, 100); 
    text((hrs), 290, 460); 

    minutes(); 
    hrs(); 
    for(int i = 100; i < 600; i += 100){ 
    line(i, 0, i, 700); 
    fill(0); 
    stroke(255); 
    ellipse(i, 690, r, r); 
    }
    
    frameRate(10);
    currentTime = millis(); 
    if(currentTime- sec > 0){ 
      b--; 
      fill(255); 
      ellipse(a, b, r, r); 
    }
    if(b < 100){ 
      b = 680; 
    }
  }
    
    void minutes(){  
   if(currentTime > minu){ 
     d-= 1/5; 
     fill(255); 
     ellipse(c, d, r, r); 
   }
   if(d < 100){ 
     d = 680; 
   } 
    }
    
    void hrs(){ 
      if(currentTime > hr){ 
        j-= 1/60; 
        ellipse(e, j, r, r); 
      }
      
      if(j > 240){ 
        j = 690; 
      } 

    }


