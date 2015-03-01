
 
int numNames = 4; 


String[] roomMates = {"Claire", "Jake", "Eddie", "Chris"};



int diameter=1;
float[] NamesX = new float [numNames];
float[] NamesY = new float [numNames];

  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 5, 25 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 5, 25 );



void setup() {
  size(400, 400); 
  background(255,mouseX,mouseY);

  for (int i = 0; i < numNames; i++) {
  NamesX[i] = 4 + i*100;
   NamesY[i] = height/2;
}
}

void draw() {
  background(255,mouseX,mouseY);

 

  for (int i = 0; i < numNames; i++) {
    if (dist(mouseX, mouseY, NamesX[i], NamesY[i]) < 50) { 
    
      text(roomMates[i], NamesX[i], NamesY[i]);
      
      diameter=diameter*20;
      fill(mouseX,mouseY,0);
      ellipse(NamesX[i],NamesY[i], diameter,diameter);
      
    } 
    else { 
      
      text(roomMates[i], NamesX[i], NamesY[i]); 
      diameter=numNames;
      ellipse(NamesX[i],3* int(NamesY[i]), diameter,diameter);
    }
    fill(0);
    ;
 
  }

}


