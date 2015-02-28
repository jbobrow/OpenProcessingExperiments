
float[][] xy = new float[25][2];

void setup(){
 
 size(300,300);
 background(255);  
 frameRate(1);

}

void draw(){
  //Each quadrant
  translate(20, 20);
   for (int i = 1; i < 6; i++){
     float[] xy2 = new float[8];
     for (int j = 1; j < 5; j++){
           xy2[j] = random(0,260);
           xy2[1 + j] = xy2[j] + 10; 
      }
     
     quad(xy2[0], xy2[1], xy2[2], xy2[3], xy2[4], xy2[5], xy2[6], xy2[7]);
     
  }
}

void mousePressed(){
    noLoop();
}
