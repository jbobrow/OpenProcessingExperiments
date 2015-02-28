
float x1= 100;
float y1 = 100;

float[] arrayX;
float[] arrayY;



void setup(){
  
size(500,500);
  
arrayX = new float[15];
arrayY = new float[15];

}




void draw(){
  
  
for (int i = 0; i <15; i++){

arrayX[i] = i;  
arrayY[i] = i; 

gotita(arrayX[i],arrayY[i]); 
}  
  


}





void gotita (float tempx1, float tempy1) {



for (int i = 0; i < 1000; i++){
 
  
  fill(255);
rect(0,0,width,height);
  
fill(0); 
line(tempx1,tempy1,tempx1+20,tempy1+20);


  
}  

}
