
/*
int contador = 5000;
float[][] q = new float[contador][8];
PGraphics pg;
int telax = 700;
int telay = 700;
float tamanho = 2;
void setup() {
  frameRate(30);
  background(0);
 size(telax,telay,P3D);
 for (int i=0; i<contador; i++){
   q[i][0] = random(width); //x
   q[i][1] = random(height); //y
   q[i][2] = random(0,100);
   q[i][3] = random(0,100);
   q[i][4] = random(0,100);
   q[i][5] = random(-2,2);  
   q[i][6] = random(-2,2);
   q[i][7] = random(-2,2); //z

 }
 pg = createGraphics(telax,telay, P3D);
}

void draw() {
  image(pg,1,1);
  pg.beginDraw();
 
  noCursor();
 pg.fill(2,5,5,100);
   // pg.filter(BLUR,2);
 pg.rect(0,0,telax,telay);
 for(int j=0;j<contador; j++){
   pg.fill(random(255),random(255),random(255));
   pg.strokeWeight(0);
   pg.vertex(q[j][0],q[j][1],q[j][7]);
   
 //  pg.rectMode(CENTER);
  // pg.ellipse(q[j][0],q[j][1],q[j][2],q[j][2]);
   q[j][0] += q[j][5];
   q[j][1] += q[j][6];
   for(int k = 0; k<contador; k++){
     float distancia = dist(q[j][0],q[j][1],q[k][0],q[k][1]);
     if(distancia < 20){
       
     pg.strokeWeight(1);
    pg.stroke(255,10);
     pg.line(q[j][0],q[j][1],q[k][0],q[k][1]);
     }

   }
 
// if(q[j][0] > width){q[j][5] = random(-2);}
// if(q[j][0] < 0){q[j][5] = random(2);}
 //if(q[j][1] > height){q[j][6] = random(-2);}
 //if(q[j][1] < 0){q[j][6] = random(2);}
     if( q[j][0] < -tamanho      ){ q[j][0] = width+tamanho;  } 
    if( q[j][0] > width+tamanho ){ q[j][0] = -tamanho;       }
    if( q[j][1] < 0-tamanho     ){ q[j][1] = height+tamanho; }
    if( q[j][1] > height+tamanho){ q[j][1] = -tamanho;       }
 
   
 }
pg.endDraw(); 
if((frameCount > 1) && (frameCount <10)){
  saveFrame("0img5-####.tga");
}

}

*/

