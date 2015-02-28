
int[][] colors = new int[800][800];
PVector press;
PVector release;
float radius;
int z;
PVector x;
color a;
void setup(){
  size(800,800);
  frameRate(60);
  background(255);
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      colors[i][j] = 255;
    }
  }
  smooth();
}
void draw(){
press = new PVector(random(width/2),random(height/2));
release = new PVector(random(width/2),random(height/2));
radius = PVector.dist(press,release);
  for(int k = 0; k < width; k++){
    for(int l = 0; l < height; l++){
      x = new PVector(k,l);
      if(PVector.dist(x,press) < radius){
        z = colors[k][l];
        if(z != 255){
          colors[k][l] = 255;
        }
        if(z != 0){
          colors[k][l] = 0;
        }
 
        stroke(colors[k][l]);
        point(k,l);
      }
    }
  }
}
/*void mouseDragged(){
 stroke(255,255,0);
  line(press.x,press.y,mouseX,mouseY);
}
*/

