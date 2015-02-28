
import processing.opengl.*;
import processing.dxf.*;
import processing.pdf.*;
boolean record = false;


void setup(){

size(screen.width,screen.height, OPENGL);}
float xoff = 0.0;
float [] x=new float [100];
float [] y=new float [100];
float [] z=new float [100];

void draw(){
  
   if (record == true) {
    beginRaw(DXF, "output-####.dxf"); // Start recording to the file
  }
  
   if (record == true) {
    beginRaw(PDF, "output-####.pdf"); // Start recording to the file
  }
  
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  int s = second(); 
  lights();
  camera(width/2, height/2, 2000, width/2, height/2, 0, 0,1,10);
  background(0);
  
for(int i=0;i<50;i+=5){
  translate(xoff*mouseX, xoff*mouseY, -55);
   rotateY(map(xoff*100, 0, width, -1, 1));
  //rotateX(map(xoff*100, 0, width/2, -PI, PI));
}
  for (int i=0; i<100; i++){
    for( int j=0; j<100; j++){
      rotateX(90);
      x[i]=i*100;
      y[j]=j*100;
      //int z=1;
      z[j]=sin(TWO_PI*j/100)*100;
    stroke(2*xoff*2,2*xoff*4,2*xoff*10,1*xoff*30 );
    noFill();
      strokeWeight(.05);
      
      

      pushMatrix();
       translate (x[i], y[j],z[j]);
       line(i,j,xoff*20000,xoff*20000);
    // ellipse(i,j, 10, 10);
      popMatrix();
    }
  }
  if (record == true) {
    endRaw();
    record = false; // Stop recording to the file
  }
}
/*void keyPressed() {
  if (key == 'R' || key == 'r') { // Press R to save the file
    record = true;
  }
}*/
void keyPressed() {
  if (key == 'P' || key == 'p') { // Press R to save the file
    record = true;
  }
}

