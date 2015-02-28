
PFont font;
int pts = 4; 
float ang = 0;
float radio = 99;
float ladosTam = 75;
float angulo1 = 0;
float angulo2 = 0;


PVector vertices[][];
boolean isLados = false;

float angInc;

void setup(){
  size(800, 600, P3D);
   font = loadFont ("Candara-48.vlw");
  textFont (font);
  noStroke();
  angInc = PI/300.0;
}

void draw(){
  background(0);
  lights();
  fill(23, 95, 149);
  translate(width/2, height/2);
  rotateX(frameCount * angInc);
  rotateY(frameCount * angInc);
  rotateZ(frameCount * angInc);

  vertices = new PVector[2][pts+1];

 for (int i = 0; i < 2; i++){
   ang = 0;
   for(int j = 0; j <= pts; j++){
     vertices[i][j] = new PVector();
   if (isLados){
        if (i==1){
          vertices[i][j].x = 0;
          vertices[i][j].y = 0;
        }
        else {
          vertices[i][j].x = cos(radians(ang)) * radio;
         vertices[i][j].y = sin(radians(ang)) * radio;
        }
    } 
     else {
       vertices[i][j].x = cos(radians(ang)) * radio;
        vertices[i][j].y = sin(radians(ang)) * radio;
     }
    vertices[i][j].z = ladosTam; 
 ang += 360.0/pts;
    }
  ladosTam *= -1;
   background(0);
  fill(222, 11, 11);
    int a = second ();
  int b = minute ();
  int c = hour ();
  String t= nf (c,2) + ":" + nf (b,2) + ":" + nf (a,2);
  text (t, 100, height/2+10); 

  }


  beginShape(QUAD_STRIP);
 for(int j = 0; j <= pts; j++){
    vertex(vertices[0][j].x, vertices[0][j].y, vertices[0][j].z);
    vertex(vertices[1][j].x, vertices[1][j].y, vertices[1][j].z);
  }
    for (int i = 0; i < 2; i++){
   beginShape();
   for(int j = 0; j < pts; j++){
      vertex(vertices[i][j].x, vertices[i][j].y, vertices[i][j].z);
    }
    
    endShape(CLOSE);
    
 }
 
}



  



