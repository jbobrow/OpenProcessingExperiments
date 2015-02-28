
int[][] array0;
final int steps = 20;

void setup(){
array0 = new int[steps][3];
size(400,400);
background(0);
noStroke();
for(int i = 0; i < steps; i++){
  array0[i][0] = mouseX;
  array0[i][1] = mouseY;
  array0[i][2] = 0;
}
}

void draw(){
  background(0);
  for( int i = steps - 1; i > 0; i--){
    array0[i][0] = array0[i - 1][0];
    array0[i][1] = array0[i - 1][1];
    if (mousePressed){
    array0[i][2] = 1;
     }else{
      array0[i][2] = 0;
  }
 }
  
  array0[0][0] = mouseX;
  array0[0][1] = mouseY;
  
  for(int i = 0; i < steps; i++){
    fill(255, 255 - i*(int)(255/steps));
    if(array0[i][2] == 1){
    ellipse(array0[i][0], array0[i][1], 30 - i*(int)(30/steps) , 30 - i*(int)(30/steps));
  }
  }
  }
  


