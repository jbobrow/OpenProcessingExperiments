
//Sarah Anderson, seanders
//ems2 hw8a

int myArray[];
size(400,400);
background(50);
int nElements = 100;
myArray = new int[nElements];
for (int i=0; i < nElements; i++){
  int randomInt = (int)random(100);
  myArray[i] = randomInt;
}  

for (int i=0; i<nElements; i+=1)
  {
   if (myArray[i]>=96)
      {
       textSize(25); 
       text(i,200,200);
       break;
      } 
  }
