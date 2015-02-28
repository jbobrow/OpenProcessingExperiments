
int rows = 45;
int cols = 45;
Spot mySpot [] [] = new Spot [cols] [rows];
float offset;
float rad = 100;


void setup (){
  size(500,500);
  frameRate(40);
  smooth();

}

void draw(){
  background (0);
  noStroke();
  
  offset = map(mouseX,0,width, 0,100);
  rad = map(mouseY,0,height,0,220);

  
  translate(height/2, width/2);
 
  for (int i=0; i<cols; i++){
    for (int j=0; j<rows; j++){
      float angle = radians(millis() *0.5 + i* offset);
      mySpot[i][j] =new Spot(sin(angle) *rad, cos(angle)*rad, 50);
      mySpot[i][j].update(mouseX, mouseY);
      mySpot[i][j].display();
    }
    }
  }

    

  
  


