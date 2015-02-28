
boolean go = false;
int w = 700;//screen.height;
int h = 400;//screen.height;
int count = 0;

int boxsX[] = {350,350,350,350,350};
int boxsY[] = {200,200,200,200,200};

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
      
      boxsX[i] += round(random (50));
      boxsY[i] += round(random (50 ));
      
      rect (boxsX[i],boxsY[i],10,10);
    }
  }
    
    
  
  
  
}

void mousePressed (){

  go = true;
    
}

