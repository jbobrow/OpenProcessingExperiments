

Spot [] [] mySpot = new Spot[30] [30];

void setup(){
  size(800,800);
  smooth();
  
  for(int i = 0; i<mySpot.length ; i++){
     for(int j = 0; j<mySpot.length ; j++){
       mySpot [i] [j] = new Spot(30*i, 30*j, 20);
     
    }
  }
}


void draw(){
  background(0);
  
 for(int i = 0; i<mySpot.length ; i++){
     for(int j = 0; j<mySpot.length ; j++){
      mySpot[i][j].mapPosition(mouseX,mouseY);
      mySpot[i][j].display();
 } 
  
}  
  
  
}

