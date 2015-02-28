
PImage names;
PImage names2;
void setup() { 
  size (640, 480);
  smooth ();

  names = loadImage ("names.png");
  names2 = loadImage ("names2.png");
}
void draw() { 
  background (0);


  
  if (keyPressed == true) {
    white();
  }else{
   stroke (0);
  N();
  A();
  R();
  S();
  }
  
    
  if (mouseX < 70) {
    tint (255, 230);
image (names, 0, 0);
}
if (mouseY > 300) {
    tint (255, 230);
    image (names2, 0, 0);
}

  
 
} void N() {
   //mouseX, lean, left, to right
   float Nx1 =  map (mouseX, 10, width/2, 10, 106.5);
   float Ny1  = map (mouseX, 50, width/2, 10, 100);
   
   float Nx2 =  map (mouseX, 10, width/2, 10, 107);
   float Ny2  = map (mouseX, 160, width/2, 10, 100);
   
   float Nx3 =  map (mouseX, 142, width/2, 10, 106.5);
   float Ny3  = map (mouseX, 9, width/2, 70, 173);


  //N1
  stroke (255);
  strokeWeight (3);
  line (Nx1, 190,  Ny1, 310);
  
  //N2
  stroke (255);
  strokeWeight (3);
  line (Nx2, 190,  Ny2, 310);
  
  //N3
  stroke (255);
  strokeWeight (3);
  line (Nx3, 190,  Ny3, 310);
  
} void A() {
  //mouseX, lean, left, to right
   float Ax1 =  map (mouseX, 170, width/2, 10, 106.5);
   float Ay1  = map (mouseX, 30, width/2, 30, 143);
   
   float Ax2 =  map (mouseX, 170, width/2, 10, 106.5);
   float Ay2  = map (mouseX, 120, width/2, 20, 150);
   
   float Ax3 =  map (mouseX, 143, width/2, 10, 106.5);
   float Ay3  = map (mouseX, 127, width/2, 70, 173);
  
  //A1 
  stroke (255);
  strokeWeight (3);
  line (Ax1, 190,  Ay1, 310);
  
  //A2 
  stroke (255);
  strokeWeight (3);
  line (Ax2, 190,  Ay2, 310);
  
   //A3 
  stroke (255);
  strokeWeight (3);
  line (Ax3, 280,  Ay3, 280);
  
  
} void R() {
   float Rx1 =  map (mouseX, 190, width/2, 10, 106.5);
   float Ry1  = map (mouseX, 125, width/2, 70, 173);
   
   float Rx2 =  map (mouseX, 190, width/2, 10, 106.5);
   float Ry2  = map (mouseX, 170, width/2, 70, 173);
   
   float Rx3 =  map (mouseX, 190, width/2, 10, 120);
   float Ry3  = map (mouseX, 120, width/2, 45, 160);
   
   float Rx4 =  map (mouseX, 125, width/2, 45, 160);
   float Ry4  = map (mouseX, 180, width/2, 10, 136);
   
   //R1
  stroke (255);
  strokeWeight (3);
  line (Rx1, 190,  Ry1, 310);
  
  //R2
  stroke (255);
  strokeWeight (3);
  line (Rx2, 190,  Ry2, 190);
  
  //R3
  noFill();
  stroke (255);
  strokeWeight (3);
  bezier (Rx3, 190, 430, 189, 448, 268, Ry3, 254);
  
  //R4
  noFill();
  stroke (255);
  strokeWeight (3);
  bezier (Rx4, 255, 430, 253, 420, 270, Ry4, 310);
  
  
} void S() {
   float Sx1 =  map (mouseX, 205, width/2, 48, 165);

   float Sy1  = map (mouseX, 180, width/2, 10, 150);
   
   float Sx2 =  map (mouseX, 180, width/2, 40, 165);
   float Sy2 =  map (mouseX, 198, width/2, 10, 120);

   
  //S1
  noFill();
  stroke (255);
  strokeWeight (3);
  bezier (Sx1, 210, 420, 149, 340, 244, Sy1, 251);


//S2
  noFill();
  stroke (255);
  strokeWeight (3);
  bezier (Sx2, 248, 520, 260, 475, 340, Sy2, 300);
 

}

void white () {
background (255);
 float Nx1 =  map (mouseX, 10, width/2, 10, 106.5);
 float Ny1  = map (mouseX, 50, width/2, 10, 100);
 float Nx2 =  map (mouseX, 10, width/2, 10, 107);
 float Ny2  = map (mouseX, 160, width/2, 10, 100);
 float Nx3 =  map (mouseX, 142, width/2, 10, 106.5);
 float Ny3  = map (mouseX, 9, width/2, 70, 173);

  //N1
  stroke (0);
  strokeWeight (3);
  line (Nx1, 190,  Ny1, 310);
  
  //N2
  stroke (0);
  strokeWeight (3);
  line (Nx2, 190,  Ny2, 310);
  
  //N3
  stroke (0);
  strokeWeight (3);
  line (Nx3, 190,  Ny3, 310);
  

   float Ax1 =  map (mouseX, 170, width/2, 10, 106.5);
   float Ay1  = map (mouseX, 30, width/2, 30, 143);
   
   float Ax2 =  map (mouseX, 170, width/2, 10, 106.5);
   float Ay2  = map (mouseX, 120, width/2, 20, 150);
   
   float Ax3 =  map (mouseX, 143, width/2, 10, 106.5);
   float Ay3  = map (mouseX, 127, width/2, 70, 173);
  
  //A1 
  stroke (0);
  strokeWeight (3);
  line (Ax1, 190,  Ay1, 310);
  
  //A2 
  stroke (0);
  strokeWeight (3);
  line (Ax2, 190,  Ay2, 310);
  
   //A3 
  stroke (0);
  strokeWeight (3);
  line (Ax3, 280,  Ay3, 280);
  
   float Rx1 =  map (mouseX, 190, width/2, 10, 106.5);
   float Ry1  = map (mouseX, 125, width/2, 70, 173);
   
   float Rx2 =  map (mouseX, 190, width/2, 10, 106.5);
   float Ry2  = map (mouseX, 170, width/2, 70, 173);
   
   float Rx3 =  map (mouseX, 190, width/2, 10, 120);
   float Ry3  = map (mouseX, 120, width/2, 45, 160);
   
   float Rx4 =  map (mouseX, 125, width/2, 45, 160);
               //map (mouseX, 190, width/2, 10, 120);
   float Ry4  = map (mouseX, 180, width/2, 10, 136);
  

   
      //R1
  stroke (0);
  strokeWeight (3);
  line (Rx1, 190,  Ry1, 310);
  
  //R2
  stroke (0);
  strokeWeight (3);
  line (Rx2, 190,  Ry2, 190);
  
  //R3
  noFill();
  stroke (0);
  strokeWeight (3);
  bezier (Rx3, 190, 430, 189, 448, 268, Ry3, 254);
  
  //R4
  noFill();
  stroke (0);
  strokeWeight (3);
  bezier (Rx4, 255, 430, 253, 420, 270, Ry4, 310);
   
   float Sx1 =  map (mouseX, 205, width/2, 48, 165);

   float Sy1  = map (mouseX, 180, width/2, 10, 150);
   
   float Sx2 =  map (mouseX, 180, width/2, 40, 165);
   float Sy2 =  map (mouseX, 198, width/2, 10, 120);

   
  //S1
  noFill();
  stroke (0);
  strokeWeight (3);
  bezier (Sx1, 210, 420, 149, 340, 244, Sy1, 251);


//S2
  noFill();
  stroke (0);
  strokeWeight (3);
  bezier (Sx2, 248, 520, 260, 475, 340, Sy2, 300);
 

   
}





