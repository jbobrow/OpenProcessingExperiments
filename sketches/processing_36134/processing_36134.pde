
int noLines = 6;
int noPart = 140;


float a =1.1; //for accelleration
float speeds[] = { 2,2,2,2,2,2}; // speed array for line speed
float restLine[]= { 100,150,250,200,300,350};// array for where lines come back to rest
float disp[] = { 0,0,0,0,0,0};

float xbuffer = 0;

boolean mousemoving;

void setup() {
  size(700,400); 
  background(0); 
  stroke(255);
  smooth();
  strokeWeight(2);


}



void draw() {
  ///this makes the particles fade
  fill (0,1);
  rect(0,0,700,400);
  //background(0);
  
//// makes them move to the mouse and go back to rest
  if (mousemoving) {
    for (int i = 0; i < noLines; i=i+1) {
      speeds[i] = speeds[i]*a;//makes speed accelerate with more mouse movement
      
      if (restLine[i]+disp[i] < mouseX) {
        disp[i] += speeds[i];
      }
      if (restLine[i]+disp[i] > mouseX) {// displacement of line, line follows mouse up or down
        disp[i] -= speeds[i];
      }
    }
  }else{
    
     speeds[0] = speeds[0]*a;
     speeds[1] = speeds[1]*a;
     speeds[2] = speeds[2]*a;
     speeds[3] = speeds[3]*a;
     speeds[4] = speeds[4]*a;
     speeds[5] = speeds[5]*a;
     
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
       //xbuffer = mouseX/10;
       stroke(abs(disp[i]));
       //println(abs(disp[i]);
      //line( (width/noPart)*k, restLine[i]+(disp[i]/700)*mouseX, (width/noPart)*k + 1, restLine[i]+(disp[i]/700)*mouseX);
     float distMousePoint = dist(mouseX,mouseY, width/noPart*k, restLine[i]+(disp[i]/width)*mouseX);
     
     float dist_to_point = dist(mouseX, mouseY*noLines, width/noPart*k, restLine[i]+(disp[i]/700)*mouseX);
      
      line( (xbuffer+width/noPart)*k, restLine[i]-(disp[i]/400)*(500-dist_to_point), (xbuffer+width/noPart)*k + 1, restLine[i]-(disp[i]/400)*(500-dist_to_point));
      //line( restLine[i]-(disp[i]/400)*(700-dist_to_point), (xbuffer+width/noPart)*k,   restLine[i]-(disp[i]/400)*(700-dist_to_point), (xbuffer+width/noPart)*k + 1);
     
      //ellipse(k*10, restLine[i]-(disp[i]/400)*(500-dist_to_point), 10, 10);

  }
   }
  
  //this resets mouse moving to 1 before accelerating back to rest
  if (mousemoving){
     speeds[0] = 1;
     speeds[1] = 1;
     speeds[2] = 1;
     speeds[3] = 1;
     speeds[4] = 1;
     speeds[5] = 1;
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
     speeds[3] = 2;
     speeds[4] = 1;
     speeds[5] = 0;
   }
   if (mouseY <= (height/ noLines)*2 && mouseY > height/ noLines){
     speeds[0] = 1;
     speeds[1] = 2;
     speeds[2] = 1;
     speeds[3] = 1;
     speeds[4] = 2;
     speeds[5] = 1;
   }
   if (mouseY <= (height/ noLines)*3 && mouseY > (height/ noLines)*2){
     speeds[0] = 0;
     speeds[1] = 1;
     speeds[2] = 2;
     speeds[3] = 0;
     speeds[4] = 1;
     speeds[5] = 2;
   }
}


