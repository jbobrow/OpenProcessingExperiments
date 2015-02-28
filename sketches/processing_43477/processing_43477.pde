
int[] myRandomNumbers = new int[20];
//int myRandomNumber1;
 
void setup(){
  size(600,600);
   
}
 
void draw(){
   //myRandomNumber1= 6;
   
   
   
  for(int i=0;i<myRandomNumbers.length;i++){
    myRandomNumbers[i]= (int)random(2000);
    text(myRandomNumbers[i],random(600),random(600));
     
  }
   
   
  
}
                          
