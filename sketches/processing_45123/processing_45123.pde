
int farbe2 =-1;
int count=50;
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
  strokeWeight(0.03);
  background(0);
 
  for (int i=0; i < xpos.length; i++) {
    xpos[i] = random(0,900);
    ypos[i] = random(0,450);
    xGeschwindigkeit[i] = random (-1, 1);
    yGeschwindigkeit[i] = random (-1, 1);
    durchmesser[i] = random (1, 3);
    farbe[i] = color (random (0,255),random (100,200),random (240,255), 120);
  }
}
 
void draw () {
  fill(0,0.1);
  rect(-2,-2,width+2,height+2);

    
  for(int i=0; i<anzahl.length; i++){

stroke(00,100);
  line(xpos[3],ypos[3],xpos[i],ypos[i]);
 
  stroke(farbe[i]);
  line(xpos[a],ypos[a],xpos[i],ypos[i]);
  
 stroke(farbe[i],200);
  line(xpos[1],ypos[1],xpos[i],ypos[i]);
  
  stroke(farbe[i],100);
  line(xpos[2],ypos[2],xpos[i],ypos[i]);
  
  stroke(farbe[i],100);
  line(xpos[2],ypos[2],xpos[i],ypos[i]);
   
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
                                                
