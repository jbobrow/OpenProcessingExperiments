
int w = 700;//screen.height;
int h = 400;//screen.height;
int d = w;
int count = 0;


void setup() {

  size(w, h, P3D);

}

void draw() {
 
 if (count<10){
    count += 1;
  }else{
    background(0, 10);
   
    count = 0;
  }
    
 
  camera(w*3, h*2, d/2, 0, 0, 0, 0, 0,-1);
  
    rotateZ(TWO_PI-mouseX*PI/360);
    rotateX(mouseY*PI/360);
  
  //rect (0,0,700,400);
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
}

