
//By AurÃ�Â©lie Virely modified by Lucille 
 
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
  //background(0);
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
  
// Changement du fond en cliquant sur la souris
    if (mousePressed == true) {
      background(random(0,255));
    }
    }
 
    }
 
 
     
  }
  }
//enregistrment de l'image grÃ¢ce Ã  la touche s
void keyPressed(){
     
  if (key == 's'){
 save ("motifaurelie.png");
    }
   }
   
// Corriged by Tifaine
//1) ***
//2) ***
//3) ***
//4) ***
//5) ** (la repetition du motif n'est peut-être pas tres claire, utilisation de "vertex" ?!)
//6) ***
//7) ***
//8) ***

// Tout bon !
