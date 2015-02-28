
//elemtary CA (Wolfram)
//Tomas de Camino Beck
int row = 1;
int spaceSize = 50;
float rectSize;
 
// rule 30
int [] rule = { 0, 1, 1, 1, 1, 0, 0, 0 };
int [] space = new int[spaceSize];
int [] prevSpace = new int[spaceSize];

void setup(){
  size(300,300);
  rectSize=width/spaceSize;
  space[spaceSize/2] =1;
  prevSpace[spaceSize/2]=1;
}

void draw(){
  for(int i = 1 ; i<spaceSize-1; i++) prevSpace[i]=space[i];
  
  for(int i = 1 ; i<spaceSize-1; i++){
   //prevSpace[i]=space[i];
   int c = prevSpace[i-1]+prevSpace[i]*2+prevSpace[i+1]*4;
   space[i] = rule[c];
   fill(prevSpace[i]*255);
   rect(i*rectSize,row*rectSize,rectSize,rectSize); 
  }
  row=(row+1)%(height/(int)rectSize);
  
}

