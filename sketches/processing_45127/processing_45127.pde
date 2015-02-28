
int farbe2 =-1;
int count=10;
float[] anzahl = new float[count];

int a = 0;
float[] xpos = new float[count];
float[] ypos = new float[count];
 
float[] xGeschwindigkeit = new float[count];
float[] yGeschwindigkeit = new float[count];
 
color[] farbe = new color[count];
float[] durchmesser = new float[count];

//PASUSE & NEW
void keyPressed() {
  if(key == 'p'){
    paused = !paused;
    if(paused){
   noLoop();
    }
     else{
   loop();
  }
 }
 
   if(key == 'n'){
  fill(0);
  rect(0,0,width,height);
  }
    if(key == 'b'){
      for(int i=0; i<anzahl.length; i++){
  farbe[i] = color (random (0),random (0),random (0), 255);
      }
  } 
    if(key == 'c'){
      for(int i=0; i<anzahl.length; i++){
  farbe[i] = color (random (0,255),random (100,200),random (240,255), 120);
      }
  }

if(key == 'v'){
  farbe[1] = color (random (0),random (0),random (255), 255);
  farbe[2] = color (random (0),random (255),random (0), 255);
  farbe[3] = color (random (255),random (0),random (0), 255);
  }    
   
} //ENDE PAUSE

 
void setup () {
  size(900, 450);
  smooth();
  stroke(255,80);
  strokeWeight(2);
  background(255);

  for (int i=0; i < xpos.length; i++) {
    xpos[i] = random(0,900);
    ypos[i] = random(0,450);
    
    float zufall = random(0,10);
    
    if(zufall > 5){
      xGeschwindigkeit[i] = 1;
    }
    else{
      xGeschwindigkeit[i] = -1;
    }
    
    zufall = random(0,10);
    
    if(zufall > 5){
      yGeschwindigkeit[i] = 1;
    }
    else{
      yGeschwindigkeit[i] = -1;
    }
    
    durchmesser[i] = random (1, 3);
    farbe[i] = color (0,255,255);
  }
}
 
void draw () {
  fill(255);
  rect(-2,-2,width+4,height+4);
  
  for(int i=0; i<anzahl.length; i++){
    
  stroke(color (255,0,0,127));
  line(width/2,height/2,xpos[i],ypos[i]);
  stroke(color (0,255,255,127));
  line(width/2+2,height/2+2,xpos[i],ypos[i]);
    
  stroke(color (255,0,0,127));
  line(xpos[0],ypos[a],xpos[i],ypos[i]);
  stroke(color (0,255,255,127));
  line(xpos[0]+15,ypos[a]+5,xpos[i],ypos[i]);
  
  stroke(color (255,0,0,127));
  line(xpos[1],ypos[1],xpos[i],ypos[i]);
  stroke(color (0,255,255,127));
  line(xpos[1]+10,ypos[1]+0.5,xpos[i],ypos[i]);
  
  stroke(color (255,0,0,127));
  line(xpos[2],ypos[2],xpos[i],ypos[i]);
  stroke(color (0,255,255,127));
  line(xpos[2]+25,ypos[2]+0.5,xpos[i],ypos[i]); 
  }

  for (int i=0; i < xpos.length; i++) {
    
    if (xpos[i] > width - durchmesser[i] / 2) {
      xGeschwindigkeit[i] *= -1;
    }

    if (xpos[i] < durchmesser[i] / 2) {
      xGeschwindigkeit[i] *= -1;
    }

    if (ypos[i] > height - durchmesser[i] / 2) {
      yGeschwindigkeit[i] *= -1;
    }

    if (ypos[i] < durchmesser[i] / 2) {
      yGeschwindigkeit[i] *= -1;
    }
 

    xpos[i] = xpos[i] + xGeschwindigkeit[i];
    ypos[i] = ypos[i] + yGeschwindigkeit[i];
  }
  
}                               
