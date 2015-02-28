
import processing.opengl.*;


Grid grid ;

void setup(){
  size(1000, 1000, P3D);
  grid = new Grid();
}
void draw(){
  background(100, 150, 200);
  directionalLight(255, 255, 255, 0, 0, -1);
  pushMatrix();
  translate(0, height/2, 0);
  fill(100, 150, 200);
  rotateX(radians(60));
  rect(-5000, -2000, 15000, 3000);
  popMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(60));

  rotateZ(frameCount*0.01);
  translate(-width/2, -height/2, 0);

  grid.display();
  grid.update();

}
class Grid {
  float[][] h = new float[100][100];
  float[]x = new float[100];
  float[]y = new float[100];
  float n1, n2;
  float z;  
  float a; 

  Grid(){

    for(int i = 0; i < x.length; i++){
      x[i] = i * 10;
      y[i] = i * 10;

    }
  }
  void display(){



    beginShape( QUADS ); 
    noStroke();

    for( int i = 0; i < h.length-1; i++ ) 
    { 

      for( int j = 0; j < h.length-1; j++ ) 
      { 

        if(h[i+1][j+1]>0||h[i+1][j+1]<=15){
          fill(250, 255, 200);
        }
        if(h[i+1][j+1]>15){
          fill(50, 100, 0);
        }
        if(h[i+1][j+1]>250){
          fill(150, 150, 150);
        }
        if(h[i][j]==0&&h[i+1][j]==0&&h[i+1][j+1]==0){
          fill(100, 150, 200);
        }
        vertex( x[i]  , y[j], h [i][j] ); 
        vertex( x[i+1] , y[j], h[i+1][j]);
        vertex( x[i+1] , y[j+1] , h[i+1][j+1] );
        vertex( x[i] , y[j+1] , h[i][j+1] ); 


      }
    } 
    endShape(); 
  }
  void update(){
    for( int i = 0; i < h.length-1; i++ ) 
    { 

      for( int j = 0; j < h.length-1; j++ ) 
      { 
        float d = dist(mouseX, mouseY, x[i], y[j]);
        if(d < 50){
          if(mousePressed){
            if (mouseButton == LEFT) {
              h [i][j]+= 2.5 -d/20;
            }    
            if (mouseButton == RIGHT) {
              h [i][j]-= 2.5 -d/20;
            }

          } 

        }
        if(keyPressed) {
          if (key == 'r' ) {
            h [i][j]= 0;
          }
        }

      }   

    }
  }
}







