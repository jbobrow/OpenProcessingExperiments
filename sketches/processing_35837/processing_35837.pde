
int noLines = 3;
int noPart = 100;
float a = 1.1;
float speeds[] = {
  1,2,1
}; 
float restLine[]= {
  100,200,300
};
float disp[] = {
  0,0,0
};
boolean mousemoving;

void setup() {
  size(700,400); 
  background(0); 
  stroke(255);
}



void draw() {
  
  ///fades are dope as shit
  fill (0,40);
  rect(0,0,700,400);
  
//// makes them move to the mouse and go back to rest
  if (mousemoving) {
    for (int i = 0; i < noLines; i++) {
      speeds[i] = speeds[i]*a;
      
      if (restLine[i]+disp[i] < mouseY) {
        disp[i] += speeds[i];
      }
      if (restLine[i]+disp[i] > mouseY) {
        disp[i] -= speeds[i];
      }
    }
  }else{
    
     speeds[0] = speeds[0]*a;
     speeds[1] = speeds[1]*a;
     speeds[2] = speeds[2]*a;
    for (int i = 0; i < noLines; i++) {
      if(disp[i] < 0) {
        disp[i] += speeds[i];

      }
      if (disp[i] > 0) {
        disp[i] -= speeds[i];
      }
    }
  }

  // this draws the lines
  
    for (int i = 0; i < noLines; i++) {
      for (int k = 1; k <= noPart; k++){
      line( (width/noPart)*k, restLine[i]+(disp[i]/700)*mouseX, (width/noPart)*k + 1, restLine[i]+(disp[i]/700)*mouseX);
    }
  }
  
  //this resets mouse moving 
  if (mousemoving){
     speeds[0] = 1;
     speeds[1] = 1;
     speeds[2] = 1;
  }
  mousemoving = false;
  
}

void mouseMoved() {
  mousemoving = true;
  //changes speeds acording to mouses position
   if (mouseY <= height/ noLines && mouseY >= 0){
     speeds[0] = 2;
     speeds[1] = 1;
     speeds[2] = 0;
   }
   if (mouseY <= (height/ noLines)*2 && mouseY > height/ noLines){
     speeds[0] = 1;
     speeds[1] = 2;
     speeds[2] = 1;
   }
   if (mouseY <= (height/ noLines)*3 && mouseY > (height/ noLines)*2){
     speeds[0] = 0;
     speeds[1] = 1;
     speeds[2] = 2;
   }
}


