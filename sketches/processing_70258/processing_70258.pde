
int bleh=20;

void setup() {
size (600,600);
smooth();

}


void draw() {


    
background(0);
 
 
 



//pattern2
//lineasverdes
strokeWeight(4);
stroke(0,255,150);
for(int i= 580; i>200; i=i-20){
  for(int j= 580; j>200; j=j-20) {
    line(i,j,i+5,j);
  }
}
 
//lineasamarillas
strokeWeight(4);
stroke(240,240,0);
for(int i= 310; i<600; i=i+20){
  for(int j= 310; j<600; j=j+20) {
    line(i,j,i+5,j);
  }
}

 //pattern1
 
 //lineasrojas
strokeWeight(4);
stroke(255,0,150);
for(int i= 0; i<400; i=i+20){
  for(int j= 0; j<400; j=j+20) {
    line(i,j,i,j+5);
  }
}
 
//lineasazules
strokeWeight(4);
stroke(0,0,255);
for(int i= 30; i<460; i=i+20){
  for(int j= 30; j<460; j=j+20) {
    line(i,j,i,j+5);
  }
}


 //circulos
 
 //circulorojogrande
smooth();
strokeWeight(2);
fill(188,92,111);
for(int i= 300; i>20; i= i-15) {
  ellipse (152,152,i,i);
  }

//circulorojomediano
  smooth();
  strokeWeight(3);
fill(219,79,79);
for(int i= 160; i>20; i= i-20) {
  ellipse (280,130,i,i);
  }
  
  //mitad
  
fill(255,0,150);
for(int i= 80; i>20; i= i-20) {
  ellipse (525,-10,i,i);
  }

//circuloamarillo
smooth();
strokeWeight(2);
stroke(0,255,150);
fill(226,191,43);
for(int i= 250; i>20; i= i-25) {
  ellipse (474,474,i,i);
  }
  
  
//pequeños
  strokeWeight(2.5);
  fill(240,240,0);
  for(int i=475; i<600; i=i+50){
    for(int j=20; j<450; j=j+50) {
  ellipse(j,i,bleh,bleh);
    }
}
  

}
