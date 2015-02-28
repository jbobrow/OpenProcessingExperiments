
int eSize = 3;
 
size(510, 510);
background(255);


//back grounds
for(int x = 0; x <= width; x ++){  
   
   stroke(100,150+x,250,25);
   line(x,-x,x,510);
   
   smooth();
   noFill();
   stroke(255,255,255);
   strokeWeight(300);
   ellipse(0,0,1200,1200);
   
   
   smooth();
   noFill();
   stroke(255,255,255);
   strokeWeight(60);
   ellipse(0,0,400,400);
   
   smooth();
   noFill();
   stroke(255,255,255);
   strokeWeight(20);
   ellipse(0,0,800,800);
   
   smooth();
   noFill();
   stroke(255,255,255);
   strokeWeight(5);
   ellipse(0,0,300,300);
   
   smooth();
   noFill();
   stroke(255,255,255);
   strokeWeight(10);
   ellipse(0,0,840,840);
   
}

fill(255,255,255,110);
noStroke();
rectMode(CORNER);
rect(0, 0, 510, 510);

//bars
for(int x = 0; x <= width; x ++){
  
  
   stroke(50,70+x,200,5);
   line(510,x,510-x,510);
     
   noFill();
   stroke(50+x,230+x,180,60);
   strokeWeight(4);   
   rectMode(CORNER);
   rect(5, x+450, 20, 5+x/5*x);
   
   noFill();
   stroke(10,70+x,255,60);
   strokeWeight(3);   
   rectMode(CORNER);
   rect(50, x+300, 15, 5+x/5*x);
   
   noFill();
   stroke(180-x,250-x,250,60);
   strokeWeight(2);   
   rectMode(CORNER);
   rect(80, x+250, 10, 40+x/6*x);
   
   noFill();
   stroke(80,150+x,200,60);
   strokeWeight(2);   
   rectMode(CORNER);
   rect(150, x+150, 25, 75+x/25*x);
   
   noFill();
   stroke(150,50+x/2,250,60);
   strokeWeight(2);   
   rectMode(CORNER);
   rect(185, x+170, 15, 40+x/10*x);
   
   noFill();
   stroke(50,100+x/2,255,60);
   strokeWeight(3);   
   rectMode(CORNER);
   rect(220, x+350, 20, 10+x/3*x);
   
   noFill();
   stroke(100,100+x,250,60);
   strokeWeight(3);   
   rectMode(CORNER);
   rect(350, x+250, 20, 4+x/8*x);
   
   noFill();
   stroke(150,50+x/2,250,60);
   strokeWeight(3);   
   rectMode(CORNER);
   rect(380, x+40, 10, 60+x/30*x);
   
   noFill();
   stroke(80,180+x/2,250-x/8,60);
   strokeWeight(2);   
   rectMode(CORNER);
   rect(410, x, 30, 10+x/10*x);
   
   noFill();
   stroke(200,50+x/2,250,60);
   strokeWeight(2);   
   rectMode(CORNER);
   rect(450, x+185, 22, 10+x/20*x);
   
}


