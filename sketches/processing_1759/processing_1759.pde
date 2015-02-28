

float r=0;

void setup(){
  size(400,240,P3D);
  noStroke();
}

void draw(){
  background(255);
  for (int k=0;k<10;k++){
    translate(0,0,10);
    for (int j=0;j<10;j++){
      translate(0,10,0);   
      for (int i=0;i<10;i++){
        translate(10,0,0);
          fill(i*10,i*j,i*j*k,20);
        box(cos(r/3)*8+4);    
      }
      translate(-100,0,0);
    }
    translate(0,-100,0);
  }
  r=r+0.01;
  camera(sin(r)*200+100,cos(r)*200+100,100,50,50,50,sin(r),0,1);
  if (mousePressed==true){
  camera(sin(r)*50+25,cos(r)*50+25,100,50,50,50,sin(r),0,1);
  
  }
  
  

}




