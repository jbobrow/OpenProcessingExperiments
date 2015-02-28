
void setup(){
  size(640,480);
  stroke(255);
  fill(255);
  rect(192,112,256,288);
  
  strokeCap(SQUARE);
  strokeWeight(initialThickness*2);
  stroke(0);
  line(192,400,449,400);
  smooth();
  strokeCap(ROUND);
}

float[] calculateDirectionVector(float angle,float speed){
  angle+=0.125;
  angle*=6.28;
  float[] returnValue={(cos(angle)-sin(angle))*speed,(sin(angle)+cos(angle))*speed};
  return returnValue;
}

float[] tempPosition;
int numberOfGenerations=905;
int initialThickness=5;
int wait=100;
int frameNumber=0;

float[][] sprouts={{320,400,320,400,0.5+random(-0.003,0.003),random(-0.03,0.03),0,400+random(100),0,1}};

void addSprout(float positionX,float positionY,float direction,float generation,float parentLength)
{
  if(generation<numberOfGenerations){
    float[] tempSprout={positionX,positionY,positionX,positionY,direction+random(-0.2,0.2),random(-0.03,0.03),0,parentLength/5.0+random(parentLength/4.0),0,generation+1};
    sprouts=(float[][])expand(sprouts,sprouts.length+1);
    sprouts[sprouts.length-1]=tempSprout;
  }
}

void draw(){
  if(wait==0){
    for(int i=0;i<sprouts.length;i++){
      if(sprouts[i][8]<sprouts[i][7]){
        strokeWeight(initialThickness/sprouts[i][9]);
        line(sprouts[i][2],sprouts[i][3],sprouts[i][0],sprouts[i][1]);
        sprouts[i][2]=sprouts[i][0];
        sprouts[i][3]=sprouts[i][1];
        tempPosition=calculateDirectionVector(sprouts[i][4]%1+0.02*sin(sprouts[i][8]/9.0),0.6);
        sprouts[i][0]+=tempPosition[0];
        sprouts[i][1]+=tempPosition[1];
        sprouts[i][4]+=sprouts[i][5]*sprouts[i][6];
        if(sprouts[i][8]>sprouts[i][7]*0.25){
          sprouts[i][6]+=0.001/(sprouts[i][7]/800.0);
          if(random(1)<0.05)addSprout(sprouts[i][0],sprouts[i][1],sprouts[i][4],sprouts[i][9],sprouts[i][7]);
        }     
        sprouts[i][8]++;
      }
    }
  } else wait--;
  //save("animation/tree_"+nf(frameNumber,4)+".png");
  frameNumber++;
}



