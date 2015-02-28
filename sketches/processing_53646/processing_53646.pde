
// John Harding
// Heart Cells with basic potentials.

int NUM = 10;
float[][] neuron = new float[NUM][NUM];
boolean bars = true;
float bump = 5;
int SPACE = 30;

void setup(){
  size(600,600,P3D);
  ellipseMode(CENTER);
  fill(255,255,255);

  //intial conditions
  for (int i=0; i<NUM; i++){
    for (int j=0; j<NUM; j++){
      neuron[i][j]=random(255);
    }
  }
}

void draw(){
  translate(SPACE*NUM/2,SPACE*NUM/2);
  camera(400,400,400,0,0,-200,1,1,0);
  background(0);
  for (int i=0; i<NUM; i++){
    for (int j=0; j<NUM; j++){
      noStroke();
      fill(255,0,0);
      if (neuron[i][j]>250){
        rect(i*SPACE,j*SPACE,neuron[i][j]*SPACE/255,neuron[i][j]*SPACE/255);
      }
      stroke(222,30);
      fill(44,44,44,30);
      if (bars){
        pushMatrix();
        translate(i*SPACE,j*SPACE);
        box(SPACE,SPACE,neuron[i][j]*0.7);
        popMatrix();
      }
    }
  }
  for (int i=0; i<NUM; i++){
    for (int j=0; j<NUM; j++){
      neuron[i][j] +=(270-neuron[i][j])*0.05;
    }
  }

  // once you spark, you give neighbours a little kick of charge too.
  for (int i=0; i<NUM; i++){
    for (int j=0; j<NUM; j++){
      if (neuron[i][j]>255){
        neuron[i][j]=0;

        // wrap around cylindrical topology -  NOTE THIS IS BAD BAD CODE THAT WAS DONE QUICKLY!
        if(i==0){
          neuron[i+1][j]+=bump;
          neuron[NUM-1][j]+=bump;
        }

        if(i==NUM-1){
          neuron[i-1][j]+=bump;
          neuron[0][j]+=bump;
        }

        if(j==0){
          neuron[i][j+1]+=bump;
          neuron[i][NUM-1]+=bump;
        }

        if(j==NUM-1){
          neuron[i][j-1]+=bump;
          neuron[i][0]+=bump;
        }

        if(i!=0 && i!=NUM-1){
          if(j!=0 && j!=NUM-1){
            neuron[i-1][j]+=bump;
            neuron[i+1][j]+=bump;
            neuron[i][j-1]+=bump;
            neuron[i][j+1]+=bump;
          }
        }
      }
    }
  }
}

void mousePressed(){
  if (mouseButton==LEFT){
    setup();
  }
  else{
    if (bars){
      bars = false;
    }
    else{
      bars = true;
    }
  }
}



