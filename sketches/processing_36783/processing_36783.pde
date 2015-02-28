
void setup() {
  size(200, 600);
  background(255);
  noStroke();
  fill(255,0,0);
  rectMode(CENTER);
}

float count = 0;
float num = 2;
float variablea = random(1,5);
float variableb = random(-65,10);
float variablec = random(1,5);
float variabled = random(35,65);
float variablee = random(30,85);
float variablef = random(height);



int numOfTries = 1;


void draw() {
  
  stroke(1);
  
  line(5,height*.95,5,0);
    line(20,height*.95,20,0);
    line(width/2,height*.85,width/2,0);
    line(width/2-30,height*.95,width/2-30,0);
    line(width/2-35,height*.95,width/2-35,0);
    line(width/2+30,height*.95,width/2+30,0);
    line(width/2+35,height*.95,width/2+35,0);
    line(width-5,height*.95,width-5,0);
    line(width-20,height*.95,width-20,0);
    line(0,height*.95,width,height*.95);
    line(0,height*.95-5,width,height*.95-5);
    line(0,5,width,5);
    line(width/2+30,height*.85,width/2-30,height*.85);
    

  if (count < num) {  // for circle 1 (stationary)
    if (random(100) > 33) {
      fill(255, 0, 0);
      if (random(100) < 15)  
      fill(0, 255, 0);
      if (random(100) < 25)  
      fill(0,0,255);
      if (random(100) < 15)  
      fill(255,255,0);
      } 
      
      ellipse(width/3, height/4, variabled, variabled);
   
   
 
    
     if (count < num) {    // for circle 3 (small)
    if (random(100) > 33) { 
      fill(255, 0, 0);
      if (random(100) < 15)  
      fill(0, 255, 0);
      if (random(100) < 25)  
      fill(0,0,255);
      if (random(100) < 15)  
      fill(255,255,0);
          } 
    ellipse(width/random(1,9), height/6 + random(-65,10), 15, 15);
    
    if (count < num) {    // for circle 4 (large)
    if (random(100) > 33) { 
      fill(255, 0, 0);
      if (random(100) < 15)  
      fill(0, 255, 0);
      if (random(100) < 25)  
      fill(0,0,255);
      if (random(100) < 15)  
      fill(255,255,0);
       } 
    ellipse(width/random(1,2), height/6 + random(-65,10), variablee, variablee);}
       }
       
       if (random(100) > 33) { //for rect grid1
      fill(255, 0, 0);
      if (random(100) < 15)  
      fill(0, 255, 0);
      if (random(100) < 25)  
      fill(0,0,255);
      if (random(100) < 15)  
      fill(255,255,0);
       } 
       
       //grid1
       rect(width/variablea, height/6 + variableb, 5, 5);
       rect(width/variablea + 10, height/6 + variableb, 5, 5);
       rect(width/variablea + 20, height/6 + variableb, 5, 5);
       rect(width/variablea + 5, height/6 + variableb + 5, 5, 5);
       rect(width/variablea + 15, height/6 + variableb + 5, 5, 5);
       rect(width/variablea, height/6 + variableb + 10, 5, 5);
       rect(width/variablea + 10, height/6 + variableb + 10, 5, 5);
       rect(width/variablea + 20, height/6 + variableb + 10, 5, 5);
       rect(width/variablea + 5, height/6 + variableb + 15, 5, 5);
       rect(width/variablea + 15, height/6 + variableb + 15, 5, 5);
       rect(width/variablea, height/6 + variableb + 20, 5, 5);
       rect(width/variablea + 10, height/6 + variableb + 20, 5, 5);
       rect(width/variablea + 20, height/6 + variableb + 20, 5, 5);
       rect(width/variablea + 5, height/6 + variableb + 25, 5, 5);
       rect(width/variablea + 15, height/6 + variableb + 25, 5, 5);
       rect(width/variablea, height/6 + variableb + 30, 5, 5);
       rect(width/variablea + 10, height/6 + variableb + 30, 5, 5);
       rect(width/variablea + 20, height/6 + variableb + 30, 5, 5);
       
       
     
       
       fill(0);
       //line gridd
       line(width/variablec-2.5,7.5,width/variablec-2.5,height/3);
       line(width/variablec+2.5,7.5,width/variablec+2.5,height/3);
       line(0,height/3,width,height/3);
       rect(width/variablec,7.5,5,5);
       rect(width/variablec ,17.5,5,5);  
      rect(width/variablec ,27.5,5,5);
      rect(width/variablec,37.5,5,5);
      rect(width/variablec,47.5,5,5);
      rect(width/variablec ,57.5,5,5);
      rect(width/variablec,67.5,5,5);
      rect(width/variablec ,77.5,5,5);
      rect(width/variablec,87.5,5,5);
      rect(width/variablec ,97.5,5,5);
      rect(width/variablec,107.5,5,5);
      rect(width/variablec,117.5,5,5);
      rect(width/variablec,127.5,5,5);
      rect(width/variablec ,137.5,5,5);
      rect(width/variablec,147.5,5,5);
      rect(width/variablec,157.5,5,5);
      rect(width/variablec,167.5,5,5);
      rect(width/variablec,177.5,5,5);
      rect(width/variablec,187.5,5,5);
      
      
count++ ;
}}

