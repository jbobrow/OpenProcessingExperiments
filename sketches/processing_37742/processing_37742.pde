

boolean go = false;
int w = 700;//screen.height;
int h = 400;//screen.height;
int count = 0;

int boxsX[] = {350,350,350,350,350};
int boxsY[] = {200,200,200,200,200};
int boxsD[] = {0,1,2,3,0};
int a = -1;
int b = 1;

void setup() {

  size(w, h, P3D);
  frameRate(10);
}

void draw (){
  
   if (count<10){
    count += 1;
  }else{
    background(0, 50);
   
    count = 0;
    go = false;
    for ( int j = 0; j < 5; j++){
      
      boxsX[j] = 350;
      boxsY[j] = 200;
      
     
    }
    
  }
  
  if (go == true) {
    for ( int i = 0; i < 5; i++){
      if (boxsD[i] ==1 ){
         a = 1;
         b = 1;
      }
      if (boxsD[i] ==2 ){
         a = -1;
         b = 1;
      }
      if (boxsD[i] ==3 ){
         a = 1;
         b = -1;
      }
      if (boxsD[i] ==0 ){
         a = -1;
         b = -1;
      }
      boxsX[i] += a * round(random (50));
      boxsY[i] += b * round(random (50 ));
      
      rect (boxsX[i],boxsY[i],10,10);
    }
  }
    
    
  
  
  
}

void mousePressed (){

  go = true;
  for ( int k = 0; k < 5; k ++){
     boxsD[k] = round(random(3)); 
    
  }
}

