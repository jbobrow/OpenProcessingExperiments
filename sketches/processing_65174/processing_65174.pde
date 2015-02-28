
int ballcount = 100;

float [][] ballarray = new float [ballcount][7];
/*
1 = xpos
2 = ypos
3 = y velocity
4 = y accel
5 = x velocity
6 = theta
*/

void setup(){
  size(500,500);
  colorMode(HSB);
  for (int j=0;j<ballcount;j++){
    ballarray[j][1]=random(0,500);
    ballarray[j][2]=random(0,500);
    ballarray[j][3]=0;
    ballarray[j][4]=0.1;
    ballarray[j][5]=random(-2,1);;
    ballarray[j][6]=PI/2;
  }
  fill(180,360,360,300);
  smooth();
}

void draw(){
  background(125);
  for (int j=0;j<ballcount;j++){
    ellipse(ballarray[j][1],ballarray[j][2],10,10);
    for (int f=0;f<ballcount;f++){
      if (dist(ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2])<50&&dist(ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2])>40){
        ballarray[j][1]+=cos(atan2(ballarray[f][2]-ballarray[j][2],ballarray[f][1]-ballarray[j][1]))*2;
        ballarray[j][2]+=sin(atan2(ballarray[f][2]-ballarray[j][2],ballarray[f][1]-ballarray[j][1]))*2;
        ballarray[f][1]+=cos(atan2(ballarray[j][2]-ballarray[f][2],ballarray[j][1]-ballarray[f][1]))*2;
        ballarray[f][2]+=sin(atan2(ballarray[j][2]-ballarray[f][2],ballarray[j][1]-ballarray[f][1]))*2;
      }
      if (dist(ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2])<40&&dist(ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2])>1){
        ballarray[j][1]+=cos(atan2(ballarray[f][2]-ballarray[j][2],ballarray[f][1]-ballarray[j][1]))*-2;
        ballarray[j][2]+=sin(atan2(ballarray[f][2]-ballarray[j][2],ballarray[f][1]-ballarray[j][1]))*-2;
        ballarray[f][1]+=cos(atan2(ballarray[j][2]-ballarray[f][2],ballarray[j][1]-ballarray[f][1]))*-2;
        ballarray[f][2]+=sin(atan2(ballarray[j][2]-ballarray[f][2],ballarray[j][1]-ballarray[f][1]))*-2;
      }
      if (dist(ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2])<60){
        if (f!=j){
          line (ballarray[j][1],ballarray[j][2],ballarray[f][1],ballarray[f][2]);
        }
      }
      
    }
    if (ballarray[j][2]<=500){
      ballarray[j][3]+=ballarray[j][4];
      ballarray[j][2]+=ballarray[j][3];
    }
    else{
      ballarray[j][3]*=-1;
      ballarray[j][2]-=1;
      ballarray[j][2]+=ballarray[j][3];
    }
    if (ballarray[j][1]>0&&ballarray[j][1]<width){
      ballarray[j][1]+=ballarray[j][5];
    }
    else {
      ballarray[j][5]*=-1;
      ballarray[j][1]+=ballarray[j][5];
    }
  }
}

