
//PFont fontA = loadFont("Arial");
void setup(){
 
 size(300,300);
 background(255);  
 frameRate(10);

}



void draw(){
  
  float[][] xy = new float[25][2];
//First Quad
xy[0][0] = 0;
xy[0][1] = 11 - 11;

xy[1][0] = 0.26;
xy[1][1] = 11-11;

xy[2][0] = 0.77;
xy[2][1] = 11-7.94;

xy[3][0] = 1.03;
xy[3][1] = 11-8.01;
//Second Quad
xy[4][0] = 1.03;
xy[4][1] = 11-11;

xy[5][0] = 1.39;
xy[5][1] = 11-10.96;

xy[6][0] = 1.11;
xy[6][1] = 11-8.01;

xy[7][0] = 1.33;
xy[7][1] = 11-8.01;

//Third Quad
xy[8][0] = 1.46;
xy[8][1] = 11-11;

xy[9][0] = 1.46;
xy[9][1] = 11-10.78;

xy[10][0] = 2.42;
xy[10][1] = 11-10.78;

xy[11][0] = 2.42;
xy[11][1] = 11-10.55;
//4rth Quad
xy[12][0] = 1.46;
xy[12][1] = 11-8.41;

xy[13][0] = 1.46;
xy[13][1] = 11-8.2;

xy[14][0] = 3.43;
xy[14][1] = 11-9.21;

xy[15][0] = 3.43;
xy[15][1] = 11-8.97;
//5th Quad
xy[16][0] = 3.21;
xy[16][1] = 11-10.28;

xy[17][0] = 2.91;
xy[17][1] = 11-10.28;

xy[18][0] = 3.62;
xy[18][1] = 11-8.33;

xy[19][0] = 3.36;
xy[19][1] = 11-8.33;
//6th Quad
xy[20][0] = 2.65;
xy[20][1] = 11-11;

xy[21][0] = 2.91;
xy[21][1] = 11-11;

xy[22][0] = 2.57;
xy[22][1] = 11-8.01;

xy[23][0] = 2.78;
xy[23][1] = 11-7.94;
  
  //Each quadrant
 
  float z = 70;
  float a = 20;
  float randz = 20;
   for (int i = 0; i < 6; i++){
     float[] x2 = new float[8];
     float[] y2 = new float[8];
     for (int j = 1; j < 5; j++){
           int current = ((i * 4) - 1) + j;
           x2[j] = ((xy[current][0]) * z) + random(0,randz) + a;
           y2[j] = ((xy[current][1]) * z)+ random(0,randz) + a;         
           //text(x2[j] + " / " + y2[j],  x2[j], y2[j]);
           
        //   println(j+ " - X value --" + x2[j]); 
        //   println(j+ " - Y value --" + y2[j]); 
      }
     noStroke();
     fill(255,25);

     rect(0,0, 600,600);

     fill(0, 25);
     quad(x2[1], y2[1], x2[2], y2[2], x2[4], y2[4], x2[3], y2[3]);
    // println( " ------ QUAD OVER --------- " + i);
     
  }
}

void mousePressed(){
   draw();
  noLoop(); 
}

                
                                
