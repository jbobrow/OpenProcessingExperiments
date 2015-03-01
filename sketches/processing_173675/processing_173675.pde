
//import processing.pdf.*;

void setup() {
  size (1920,1080);
 // beginRecord(PDF,"SOL3.pdf");
  //background(0);
}

void draw(){
  
  //estrellas
  for(int p=-1500; p<2000; p= p+30){
  for(int o=-1050; o<1000; o= o+30){
    noStroke();
 // fill(random(255),100);
  //  ellipse(random(p),random(o),random(5),random(5));
  
    noLoop();
}
}

  // sol
  translate(width/2,height/2);
   for(int i=-10; i<800; i= i+7){
  for(int b=-10; b<800; b= b+7){
 
  //fill(255,random(255), 0);
  //ellipse(i,b,3,3);
 
  fill(0,100,100);
  line(i,b,300,300);  
 
  stroke(255,random(255),0);
  strokeWeight(0);
  
  rotate(60);
  //noLoop();
  
  }
}
//fondo azul

  for(int i=0; i<1200; i= i+10){
  for(int b=0; b<1200; b= b+10){
 
  //fill(0,random(255), 255);
  //ellipse(i,b,10,10);
 stroke(0,50,random(255),100);
  strokeWeight(0.5);
  //fill(0,100,100,20);
  line(i,b,1300,1300);  
    rotate(45);  

  noLoop();
  
}
  }
  //endRecord();
  


}
