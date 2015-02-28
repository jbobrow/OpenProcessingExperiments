
 
//Kind of Fractal based Terrain Generation Code. By Adam Lastowka.
import processing.opengl.*;

int randomosity = 900;
int selfcalc = 0;
int longness = 20;
int smoothness = 20;
int gen = 1;
float[][] data = new float[longness + 1][longness + 1];
int X;
int Y;
int Z;

int colorness;


void setup() {
  size(450, 450, OPENGL);
  background(0, 0, 0);
  stroke(255, 255, 255);
}

void draw() {
  
  if(keyPressed) {
    if (key == 'd') {
        X = X + 5;
  delay(1000);  
}else if (key == 'w') {
        for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        data[b][c] = (((data[b + 1][c] + data[b][c + 1] + data[b - 1][c] + data[b][c - 1]) + (selfcalc * data[b][c]))  /  (4 + selfcalc));
      }
    }  
    }else{
      
    gen = 1;
    for(int g = 1; g < longness; g++) {
    for(int f = 1; f < longness; f++) {
      data[g][f] = random(-250, 250);
    }
  }
  
  for(int a = 0; a < smoothness; a++) {
    for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        data[b][c] = (((data[b + 1][c] + data[b][c + 1] + data[b - 1][c] + data[b][c - 1]) + (selfcalc * data[b][c]))  /  (4 + selfcalc)) + random(0-random(randomosity / gen), random(randomosity / gen));
      }
    }
    gen++;
for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        data[b][c] = (((data[b + 1][c] + data[b][c + 1] + data[b - 1][c] + data[b][c - 1]) + (selfcalc * data[b][c]))  /  (4 + selfcalc));
      }
    }   
} 
 for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        if(data[b][c] < -60) {
          data[b][c] = -60;
        }
      }
 }
}
  }
  
  
  
  
  
  
  
  
  background(0, 0, 0);
  camera(100, mouseY, 100, // eyeX, eyeY, eyeZ
         longness * 5, longness * 5, 0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  for(int d = 1; d < longness; d++) {
    for(int e = 1; e < longness; e++) {
      strokeWeight(0);
      fill(data[d][e] * 2, data[d][e]+ 160, (data[d][e] * 4));
     if(data[d][e] == -60) {
       fill(0, 87, 255);
     }
     beginShape(TRIANGLE_STRIP);
      vertex(d * 10, e * 10, data[d][e]);
      vertex((d + 1) * 10, e * 10, data[d + 1][e]);
      vertex(d * 10, (e + 1) * 10, data[d][e + 1]);
      vertex((d + 1) * 10, (e + 1) * 10, data[d + 1][e + 1]);
     endShape(CLOSE);
      stroke(0, 0, 0);
    
    }
  }
}           
                                
