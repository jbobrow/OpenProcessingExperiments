
int noLines = 5;
int noPart = 140;


float a = 1; //for accelleration
float speeds[] = { 2,2,2,2,2}; // speed array for line speed
float restLine[]= { 50,100,200,300,400};// array for where lines come back to rest
float disp[] = { 0,0,0,0,0};

boolean mousemoving;

void setup() {
  size(700,400); 
  background(0); 
  stroke(mouseX,mouseY,80);


}



void draw() {
  ///this makes the particles fade
  //fill (0,50);
  //rect(0,0,700,400);
  background(0);

  
//// makes them move to the mouse and go back to rest
  if (mousemoving) {
    for (int i = 0; i < noLines; i=i+1) {
      speeds[i] = speeds[i]*a;
      
      if (restLine[i]+disp[i] < mouseX) {
        disp[i] += speeds[i];
      }
      if (restLine[i]+disp[i] > mouseX) {
        disp[i] -= speeds[i];
      }
    }
  }else{
    
     speeds[0] = speeds[0]*a;
     speeds[1] = speeds[1]*a;
     speeds[2] = speeds[2]*a;
     speeds[3] = speeds[3]*a;
     speeds[4] = speeds[4]*a;
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
      //line( (width/noPart)*k, restLine[i]+(disp[i]/700)*mouseX, (width/noPart)*k + 1, restLine[i]+(disp[i]/700)*mouseX);
     float distMousePoint = dist(mouseX,mouseY*(noPart/noPart), width/noPart*k, restLine[i]+(disp[i]/700)*mouseX);
     
      float dist_to_point = dist(mouseX, mouseY, width/noPart*k, restLine[i]+(disp[i]/700)*mouseX);
      line( (width/noPart)*k, restLine[i]+(disp[i]/400)*(500-dist_to_point), (width/noPart)*k + 1, restLine[i]+(disp[i]/200)*(500-dist_to_point));

     
//line( (width/noPart)*k, restLine[i]+(disp[i]/700)*distMousePoint , (width/noPart)*k + 1, restLine[i]+(disp[i]/700)*distMousePoint );
  }
   }
  
  //this resets mouse moving 
  if (mousemoving){
     speeds[0] = 1;
     speeds[1] = 1;
     speeds[2] = 1;
     speeds[3] = 1;
     speeds[4] = 1;
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
      speeds[1] = 1;
     speeds[2] = 0;
   }
   if (mouseY <= (height/ noLines)*2 && mouseY > height/ noLines){
     speeds[0] = 1;
     speeds[1] = 2;
     speeds[2] = 1;
     speeds[1] = 2;
     speeds[2] = 1;
   }
   if (mouseY <= (height/ noLines)*3 && mouseY > (height/ noLines)*2){
     speeds[0] = 0;
     speeds[1] = 1;
     speeds[2] = 2;
     speeds[1] = 1;
     speeds[2] = 2;
   }
}


