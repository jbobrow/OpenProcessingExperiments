
//Sarah Anderson, seanders
//ems2 hw8b


int nVals = 5;
int valArray[] = new int [nVals];


void setup(){
smooth();
size(250,250);
background(170,60,255);
for (int i=0; i<nVals; i++){
  int randVal = (int) random(255);
  valArray[i]=randVal;
  }

}

void draw()
{
int val=0; 
for(int c=0; c<5; c++){  
  fill(valArray[val]);
  ellipse(40+(c*40),40+(c*40),40,40);
  if (valArray[val]==255){
    valArray[val]=0;
    
    }
  else{
    valArray[val]++;
     val++; 
    } 
  }
}
