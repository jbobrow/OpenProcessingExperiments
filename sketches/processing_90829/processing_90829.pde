
/* Processing Sketch by Dominique Schmitz, February 13 */
/* OpenProcessing http://www.openprocessing.org/user/9076 */

/* @pjs preload="img2.png"; */
PFont f;
PImage img;
PGraphics pg;
boolean run = true;
boolean showP = true;
boolean showL = false;
boolean rewind = false;
boolean info = false;
boolean calc = true;

float diameter = 10;  // radius
float oD = 1;         // offset radius
int steps = 500;      // steps to calculate
int count = 800;     // particles 
int offsetT = 200;    // stops emitting at (steps - offsetT)
int emitStep = 1;     // emit every x step

int num = (int)constrain(count, 1, (steps*2)-offsetT); 
int tL = (int)constrain(emitStep, 1, (((steps*2)-(constrain(offsetT,0,steps))) / num)); 

PVector g = new PVector(0, 0); 
float bounce = 0.8;
float calm = 0.3;
float chill = .98;
float damping = 0.5;
float spring = 1.0;
float friction = 0.6;

PVector [] startP = new PVector[num];
PVector [] dir = new PVector[num];
PVector [][] thePos;
int showSteps = 1;
int [] c = new int[num];
int [] emit = new int[num];

void setup(){
  img = loadImage("img2.png");
  size(500,500);  
  noStroke(); frameRate(60); 
  textAlign(CENTER);
  f = createFont("Helvetica", 8, false);
  textFont(f);
  background(0); 
}



void draw(){
  background(0);
  if(frameCount == 5){ load(); }

  if(!calc){
    if(run){ 
      if(showSteps == steps){ showSteps = 1; }
      showSteps+=1; 
      showSteps=constrain(showSteps,1,steps);   
      if(showSteps >= steps){ run = false; }
    }
    
    if(rewind){
      if(showSteps == 1){ showSteps = steps; }   
      showSteps--; 
      showSteps=constrain(showSteps,1,steps);     
      if(showSteps <= 1){ rewind = false;} 
    }
    
  
    if(showL){ image(pg,0,0); }
    if(info){
      textAlign(LEFT); 
      if(showL){ fill(0); } else { fill(255); }
      text("S: " + showSteps + " / " + steps, 10,20);    
      text("P: " +  num, 10,30);
      text("E: " +  tL , 10,40); 
    }  
    textAlign(CENTER);
  
  
     noStroke();
      for(int i=0; i<num;i++){    
         fill(c[i]);
         if(showP){ ellipse(thePos[showSteps-1][i].x, thePos[showSteps-1][i].y, diameter-2, diameter-2); }
     }
  } else {
    fill(255);
    text("CALCULATING...", 250,250);
  }

}

void keyPressed(){  
 if (key == CODED) {
    if (keyCode == UP) {
      if(showSteps+1 <= steps){
        showSteps+=1;
      } else {
        showSteps=steps;
      }
    } else if (keyCode == DOWN) {
      if(showSteps-1 > 1){
        showSteps-=1;
      } else {
        showSteps=1;
      }
    } 
  }
 
  
  if(key == RETURN || key == ENTER){  rewind = false; run ^= true; }
  if(key == 'r'){  run = false; rewind ^= true; } 
  if(key == BACKSPACE){ showSteps = 1; } 
  if(key == 'e'){ showSteps = steps; }   
  if(key == 'p'){ showP ^= true; }   
  if(key == 'l'){ showL ^= true; }    
  if(key == 'i'){ info ^= true; }  
}



void load(){
 emit[0]=1*tL-1;
 for(int i = 0; i < num-1; i++){
   double a = (double)(i-(i/2));
   emit[i+1] = (int)(a+1)*tL-1;
 }
         
  for(int i = 0; i < num; i++){
    if(i%2==0){
         startP[i] = new PVector(20,height/2);
         dir[i]    = new PVector(random(9,11), random(-1.5,1) );
      } else {
         startP[i] = new PVector(width-20-diameter,height/2);
        dir[i]    = new PVector(random(-11,-9), random(-1.5,1));
    }

  }
  
  thePos = fP(startP, dir, steps, emit);
  
  for(int i=0; i<num;i++){ 
    c[i] = img.get((int)thePos[steps-1][i].x, (int)thePos[steps-1][i].y); 
  }
  
   pg = createGraphics(width,height);
   pg.beginDraw();
   pg.noStroke();
   pg.fill(255);
   pg.rect(0,0,width,height);
   
   pg.strokeWeight(0.6);
    for(int j = 1; j < steps;j++){
        pg.stroke(0, map(j-1, 0 , steps, 0, 100)); 
     for(int i=0; i<num;i++){     
        if(emit[i] < j){  
          pg.line(thePos[j][i].x, thePos[j][i].y, thePos[j-1][i].x, thePos[j-1][i].y);
        }
      }
    }
   pg.endDraw();  
   
   calc = false;
}



PVector [][] fP(PVector [] posIn, PVector [] dir, int steps, int [] emit){  
  int num = posIn.length;
  float [][] posOX = new float [steps][num];
  float [][] posOY = new float [steps][num];
  PVector [][] posOut = new PVector[steps][num];
 
  float minDist;
  float [] vx = new float[num];
  float [] vy = new float[num];
 
  for(int i=0; i<num;i++){ 
    posOX[0][i] = posIn[i].x;  
    posOY[0][i] = posIn[i].y; 

    vx[i] = dir[i].x;
    vy[i] = dir[i].y;
  }

  // START CALCULATION
  for(int j = 0; j < steps-1;j++){ 
    for(int i=0; i<num;i++){   
        posOX[j+1][i] = posOX[j][i]; 
        posOY[j+1][i] = posOY[j][i]; 
  
        if(j < emit[i] ){  
          posOX[j][i] = -diameter*2;  
          posOY[j][i] = -diameter*2; 
        } 
        
        if(emit[i] < j){        
          vx[i] += g.x;
          vy[i] += g.y; 
       
          // BORDERS      
          if(posOX[j+1][i]+vx[i] > width-(diameter/2)){ 
            posOX[j+1][i]= width-(diameter/2); 
            vy[i] *= friction;   vx[i] *= -bounce; 
          } else if(posOX[j+1][i] < (diameter/2)){ 
            posOX[j+1][i]= (diameter/2); 
            vy[i] *= friction;   vx[i] *= -bounce; 
          }
              
          if(posOY[j+1][i] + vy[i] > height-(diameter/2)){ 
            posOY[j+1][i]= height-(diameter/2); 
            vx[i] *= friction;   vy[i] *= -bounce;
          } else if(posOY[j+1][i] < (diameter/2)){ 
            posOY[j+1][i] = diameter/2;
            vx[i] *= friction;   vy[i] *= -bounce;
          }
          
          // COLLISION           
        for(int i2=1; i2<num;i2++){   
          float dx = posOX[j+1][i2-1] - posOX[j+1][i];
          float dy = posOY[j+1][i2-1] - posOY[j+1][i];  
          
            float distance2= sqrt(dx*dx + dy*dy);
            minDist = diameter;
             
             if (distance2 < minDist+oD) { 
               float angle2 = atan2(dy, dx);
  
               float targetX2 =  posOX[j+1][i] + cos(angle2) * (minDist+oD);
               float targetY2 =  posOY[j+1][i] + sin(angle2) * (minDist+oD);
               
               float ax = (targetX2 - posOX[j+1][i2-1]) * spring;
               float ay = (targetY2 - posOY[j+1][i2-1]) * spring;
               
               vx[i] -= ax*calm;
               vy[i] -= ay*calm;            
               vx[i2-1] += ax*calm;
               vy[i2-1] += ay*calm;        
             } 
            }
          
          vx[i] *= chill;
          vy[i] *= chill;   
               
          posOX[j+1][i] += vx[i]*damping;  
          posOY[j+1][i] += vy[i]*damping;
        } //emit           
      }    
    }
    
     for(int j = 0; j < steps;j++){
      for(int i=0; i<num;i++){
         posOut[j][i] = new PVector(posOX[j][i], posOY[j][i]);
      }  
    }
 return posOut;
}
