
//import processing.pdf.*;




PImage img;


//void setup (){
  
 
  size (800,600);
  img= loadImage("images8.jpg");
 //  beginRecord(PDF,"dibujo_fijo_3_exportado.pdf");
  background(0);
  
//}

//void draw (){

  
imageMode(CENTER);  

  image (img,400,300,1000,500);
  
  stroke (0);
  strokeWeight(0.5);
  
  for(int a=100;a<height-100;a=a+10){
  line(width/2,a,200,height/2);
  }
  
  for(int b=200;b<width-200;b=b+10){
  line (width/2,100,width-b,height/2);
 }
  
  for(int c=200;c<width-200;c+=10){
  line (c,height/2,width/2,height -100);
  }
  
  for(int d=100;d<height-100;d+=10){
  line (width/2,height -d,width-200,height/2);
  }
  
  noFill();
  stroke(255);
  
  for(int e=100;e>-10000;e-=10){
  beginShape();
  curveVertex(400,0);
  curveVertex(400,100);
  curveVertex(400-100,100+(e-30));
  curveVertex(400-150,100+(e-60));
  curveVertex(400-200,100+(e-90));
  curveVertex(400-250,100+(e-100));
  curveVertex(400-300,100+(e-90));
  curveVertex(400-350,100+(e-60));
  curveVertex(400-400,100+(e-30));
  curveVertex(0,0);
  
  endShape();
  }
 
 
  for(int e=100;e>-10000;e-=10){
  beginShape();
  curveVertex(400,0);
  curveVertex(400,100);
  curveVertex(400+100,100+(e-30));
  curveVertex(400+150,100+(e-60));
  curveVertex(400+200,100+(e-90));
  curveVertex(400+250,100+(e-100));
  curveVertex(400+300,100+(e-90));
  curveVertex(400+350,100+(e-60));
  curveVertex(400+400,100+(e-30));
  curveVertex(800,0);
  
  endShape();
  }
 
  for(int e=100;e>-10000;e-=10){
  beginShape();
  curveVertex(400,600);
  curveVertex(400,500);
  curveVertex(400-100,500-(e-30));
  curveVertex(400-150,500-(e-60));
  curveVertex(400-200,500-(e-90));
  curveVertex(400-250,500-(e-100));
  curveVertex(400-300,500-(e-90));
  curveVertex(400-350,500-(e-60));
  curveVertex(400-400,500-(e-30));
  curveVertex(0,600);
  
  endShape();
  }
 
 
  for(int e=100;e>-10000;e-=10){
  beginShape();
  curveVertex(400,600);
  curveVertex(400,500);
  curveVertex(400+100,500-(e-30));
  curveVertex(400+150,500-(e-60));
  curveVertex(400+200,500-(e-90));
  curveVertex(400+250,500-(e-100));
  curveVertex(400+300,500-(e-90));
  curveVertex(400+350,500-(e-60));
  curveVertex(400+400,500-(e-30));
  curveVertex(800,600);
  
  endShape();
  }
// endRecord(); 
//}



