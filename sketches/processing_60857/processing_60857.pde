
void setup(){
 background(220,220,190);
 size(1200, 800);
 smooth();
 noCursor();
}
 
int stil=1;
 
void draw(){
  float c1 = random(0,10);
  float c2 = random(30,45);
  float c3 = random(55,65);
  
  float c4 = random(0,10);
  float c5 = random(95,110);
  float c6 = random(110,125);
  
  float c7 = random(125,135);
  float c8 = random(160,170);
  float c9 = random(0,10);
  
  float c10 = random(180,190);
  float c11 = random(185,195);
  float c12 = random(65,80);
  
  float c13 = random(235,245);
  float c14 = random(235,245);
  float c15 = random(200,210);


  float r1 = random(150,250);
  float r2 = random(50,150);
  
  if(mousePressed){
    if(stil == 1){
    strokeWeight(random(0.5,1.5));
    stroke(220,220,190);
    fill(c1, c2, c3);
    ellipse(mouseX, mouseY, mouseX-r1, mouseX-r1);
  }
  
  
    if(stil == 2){
    strokeWeight(random(0.5,1.5));
    stroke(220,220,190);
    fill(c4, c5, c6);
    ellipse(mouseX, mouseY, mouseX-r1, mouseX-r1);
    ellipse(width-mouseX, height-mouseY, mouseX-r2, mouseX-r2);
  }
 
  
    if(stil == 3){
        float y = sin(frameCount/12.0)*50;
        float x = cos(frameCount/12.0)*50;
        float r = sin(frameCount/10.0)*50+50;
        float r3 = random(50,65);
        float r4 = random(15,25);
        
        stroke(220,220,190);
        fill(c7,c8,c9);
        ellipse(mouseX+x,mouseY+y,r3,r3);
        
        float y2 = y+ sin(frameCount/5.0)*50;
        float x2 = x+ cos(frameCount/2.5)*50;
  
        stroke(220,220,190);
        fill(c10,c11,c12);
        ellipse(mouseX+x2,mouseY+y2,r4,r4);
  }
  
      if(stil == 4){
        float y = sin(frameCount/8.0)*50;
        float x = cos(frameCount/8.0)*50;
        float r = sin(frameCount/15.0)*50+50;
        float r3 = random(10,15);
        float r4 = random(5,10);
        float y2 = y+ sin(frameCount*15.0)*50;
        float x2 = x+ cos(frameCount/2.5)*50;
        
        line(mouseX+x2,mouseY+y2,mouseX+x,mouseY+y);
        
        stroke(c1,c2,c3);
        fill(220,220,190);
        ellipse(mouseX+x,mouseY+y,r3,r3);
  
        stroke(c1,c2,c3);
        fill(220,220,190);
        ellipse(mouseX+x2,mouseY+y2,r4,r4);
        
  }
  
  
    if(stil == 5){
        float y = sin(frameCount/8.0)*50;
        float x = cos(frameCount/8.0)*50;
        float r = sin(frameCount/15.0)*50+50;
        float r3 = random(10,15);
        float r4 = random(5,10);
        float y2 = y+ sin(frameCount*15.0)*50;
        float x2 = x+ cos(frameCount/2.5)*50;
        
        noFill();
        stroke(c7,c8,c9);
        strokeWeight(random(0.5,2.0));
        bezier(mouseX+x2,mouseY+y2,mouseX+x,mouseY+y,mouseX-r3,mouseY-r4,mouseX-r4,mouseY-r3); 
  }
  }
  
  
  if(keyPressed){
    if(key==' '){
    background(220,220,190);
  }
  }
  
}



void keyPressed(){
  if (key == '1') { 
         stil = 1 ; 
       }

  if (key == '2') { 
         stil = 2 ; 
       }
  
  if (key == '3') { 
         stil = 3 ; 
       }
  
  if (key == '4') { 
         stil = 4 ; 
       }
  
  if (key == '5') { 
         stil = 5 ; 
       }
}
