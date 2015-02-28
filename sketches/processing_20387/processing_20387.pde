

int recH = 400;
int recw = 400;
float a = 0.0;
float inc;

void setup() {
  size(800,800);
    
    pushMatrix();
    translate(width/2,height/2);
   
   line(0,0,recw/2,-recH/2);
   line(0,0,-recw/2,-recH/2);
   line( 0,0,-recw/2,recH/2);
   line( 0,0,recw/2,recH/2);
   
   for(int i = 0 ; i <1;i++){
   noFill();
   rect(-recw/2,-recH/2,recw,recH);
   }
  popMatrix();
  makeSinV(300,300,3,1,200);
  makeSinV(500,300,3,1,200);
  makeSinH(300,300,3,1,200);
  makeSinH(300,500,3,1,200);
  
  makeSinV(250,250,7,1,300);
  makeSinV(550,250,7,1,300);
  makeSinH(250,250,7,1,300);
  makeSinH(250,550,7,1,300);
  
  makeSinV(350,350,1,1,100);
  makeSinV(450,350,1,1,100);
  makeSinH(350,350,1,1,100);
  makeSinH(350,450,1,1,100);
  
}


void draw () {
  
 
}

void makeSinH(int xStart, int yStart, int amplitude, int sinL, int myL) {
  inc = TWO_PI/25.0;
  for(int i = 0; i < myL; i+=1) {
   // for(int j = 0; j < 800; j+=1) {
      float myT = sin(a)*amplitude;
      point((xStart+i),(yStart + myT)); 
      a = a + inc;
   // }
  }
}

void makeSinV(int xStart, int yStart, int amplitude, int sinL, int myL) {
  inc = TWO_PI/25.0;
  for(int i = 0; i < myL; i+=1) {
   // for(int j = 0; j < 800; j+=1) {
      float myT = sin(a)*amplitude;
      point((xStart+myT),(yStart + i)); 
      a = a + inc;
   // }
  }
}


