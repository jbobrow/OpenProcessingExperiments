

int w = 700;//screen.height;
int h = 400;//screen.height;
int d = w;

int count = 0;
boolean go = false;

int boxsX[] = {350,350,350,350,350};
int boxsY[] = {200,200,200,200,200};
int boxsD[] = {0,1,2,3,0};
int a = -1;
int b = 1;


void setup() {

  size(w, h, P3D);
  frameRate(10); // too fast so changed frame rate 
}
 
void draw() {
  camera(w*3, h*3, d/2, 0, 0, 0, 0, 0,-1);
  if (count<10){
    count += 1;
  }else{
    background(0, 10);
   
    count = 0;
    go = false;
    for ( int j = 0; j < 5; j++){
      
      boxsX[j] = 350;
      boxsY[j] = 200;
    }
     
    
  }
  rotateZ(TWO_PI-mouseX*PI/360);
  rotateX(mouseY*PI/360);
  
  int m = 1;
  for(int k=-m;k<m+1;k++){
    for(int j=-m;j<m+1;j++){
      for(int i=-m;i<m+1;i++){
      fill(0);
       
        translate(w*i/m,h*j/m,d*k/m);
        
        fill(255,255,255,50);
        
        sphere(1);
        
        box(mouseX/m,mouseX/m,mouseY/m);
        
     }
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
     fill (255,0,0, 100);
      translate( b * 500, a * 500);
      
      box (200);
    }
  }

  
  
}

void mousePressed (){

  go = true;
  for ( int k = 0; k < 5; k ++){
     boxsD[k] = round(random(3)); 
     
    
  }
}



