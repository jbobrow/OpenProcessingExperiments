
//By Aurélie Virely

int A = 45;
int B = 5;
int C = 80;
int D = 25;
int E = 65;
int F = 85;
int G = 10;
int H = 25;

float X = 255;
float Y = 232;
int compteur =1;

void setup(){
  size(500,500);
  smooth();
  background(0);
}

void draw(){
  translate(-400,0);
  stroke(random(255),random(30), random(200));
  strokeWeight(3);

  fill(0);{
    for (int i = 0; i < 2*width; i = i + 80) {
       for(int j=0; j < height; j= j + 100){
     
            beginShape();
            vertex(A+j+i, B+j);
            vertex(C+j+i, D+j);
            vertex(C+j+i, E+j);
            vertex(A+j+i, F+j);
            vertex(G+j+i, E+j);
            vertex(G+j+i, H+j);
            endShape(CLOSE);
    }

    }


    
  }
  }
  



