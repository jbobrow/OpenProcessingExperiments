
int count = 0;
int startPoint = floor(random(0,10));
int firstBL = floor(random(0,100));
int firstWL = floor(random(0,100));
int firstGL = floor(random(0,100));
int barLengthB = floor(random(0,10)*10);
int barLengthW = floor(random(0,10)*10);

size(200,200);
background(102);
noStroke();


for(int countX=0;countX<=10;countX++) {
    if(countX<= random(0,10)){
      fill(0,95);
      int k = startPoint*5;
      rect(firstBL,k,barLengthB,5);
      startPoint++;
    }
    if(countX<= startPoint){
      fill(255,95);
      int j = startPoint*5;
      rect(firstWL,j,barLengthW,5);
      startPoint++;
    }
}

