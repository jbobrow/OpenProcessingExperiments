
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo HEe
// ID: 201420114

void setup() {
  size (1024, 768);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  for ( int i=0;i<width;i=i+100) {
    for ( int j=0;j<height;j=j+200) {
     stroke(#70A5FC,100);
     strokeWeight(10);
     ellipse(i+10,i+10,100,100);
     ellipse(i+10,i+10,50,50);
     ellipse(i+10,i+10,2,2);
     ellipse(i+10,i+10,2,2);
     ellipse(i+10,i+10,15,15);

     ellipse(i+200,i+10,100,100);
     ellipse(i+200,i+10,50,50);
     ellipse(i+200,i+10,2,2);
     ellipse(i+200,i+10,2,2);
     ellipse(i+200,i+10,15,15);
     
     ellipse(i+400,i+10,100,100);
     ellipse(i+400,i+10,50,50);
     ellipse(i+400,i+10,2,2);
     ellipse(i+400,i+10,2,2);
     ellipse(i+400,i+10,15,15);

     ellipse(i+600,i+10,100,100);
     ellipse(i+600,i+10,50,50);
     ellipse(i+600,i+10,2,2);
     ellipse(i+600,i+10,2,2);
     ellipse(i+600,i+10,15,15);
     
     ellipse(i+800,i+10,100,100);
     ellipse(i+800,i+10,50,50);
     ellipse(i+800,i+10,2,2);
     ellipse(i+800,i+10,2,2);
     ellipse(i+800,i+10,15,15);
     
     ellipse(i+1000,i+10,100,100);
     ellipse(i+1000,i+10,50,50);
     ellipse(i+1000,i+10,2,2);
     ellipse(i+1000,i+10,2,2);
     ellipse(i+1000,i+10,15,15);     

     ellipse(i-800,i+10,100,100);
     ellipse(i-800,i+10,50,50);
     ellipse(i-800,i+10,2,2);
     ellipse(i-800,i+10,2,2);
     ellipse(i-800,i+10,15,15);

     ellipse(i-600,i+10,100,100);
     ellipse(i-600,i+10,50,50);
     ellipse(i-600,i+10,2,2);
     ellipse(i-600,i+10,2,2);
     ellipse(i-600,i+10,15,15);     

     ellipse(i-400,i+10,100,100);
     ellipse(i-400,i+10,50,50);
     ellipse(i-400,i+10,2,2);
     ellipse(i-400,i+10,2,2);
     ellipse(i-400,i+10,15,15);     

     ellipse(i-200,i+10,100,100);
     ellipse(i-200,i+10,50,50);
     ellipse(i-200,i+10,2,2);
     ellipse(i-200,i+10,2,2);
     ellipse(i-200,i+10,15,15);     
     
     fill(255);
     rect(i+100,i,15,15);
     rect(i-100,i,15,15);
     rect(i+300,i,15,15);
     rect(i-300,i,15,15);
     rect(i+500,i,15,15);
     rect(i-500,i,15,15);
     rect(i+700,i,15,15);
     rect(i-700,i,15,15);
     rect(i+700,i,15,15);
     rect(i-700,i,15,15);
     rect(i+900,i,15,15);

   }
  }
}
