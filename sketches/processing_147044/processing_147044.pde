
//Konkuk University
//Department of Dynamic Media
//SOS iDesign
//Name: YUN SoJung
//ID: 201420093

void setup(){
  size(600,600);
  background(255);
}
void draw (){
  background(0,0,0);
 
   
  for (int i = 0; i <width; i = i + 50) {
    for (int j = 0; j <height; j = j + 50) {
      fill(0,0,205);
      ellipse(i,j,30,40);
      
      fill(200,100,200);
      noStroke();
      rect(i,j,10,10);
    }
  }
}
