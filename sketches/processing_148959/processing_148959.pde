

// Konkuk University  


// Department of Dynamic Media  


// SOS iDesign  


// Name: LEE Daeun  


// ID: 201420095 


  


  
import ddf.minim.*; 


  


Minim minim; 


 AudioInput input; 


  



void setup() {  


  size (displayWidth,displayHeight);  


  smooth();  



  strokeWeight(random(9)); 


  minim = new Minim (this); 


 input = minim.getLineIn (Minim.MONO, 512); 

} 


  


void draw() {  

  float dia = input.mix.level() * 1000; 


  float f = map(dia,0,100,10,50); 

  background(219,234,255);  


  


  for (int a = 0; a < width; a= a+ 150) {  


    for (int b= 0; b < height; b = b+150) {  


      noFill();  


      stroke(64,64,64); 


      ellipse(a-100,b,f,f-30); 


      stroke(0,103,242); 


      rect(a, b, 70, f);  


      stroke(13,53,108);  


      ellipse(a+40, b, f+20, 50);  


      stroke(136,150,170);  


      rect(a+140, b+40, 50, 50); 


      stroke(23,27,131); 


      rect(a-10, b-10, 90, 90);   


      stroke(51,59,70);  


      ellipse(a+40, b+150, f, f-40);  


      stroke(173,176,252); 


      rect(a+15, b+15, 20, 20); 


    }  


  }  


}  


  


void keyPressed() {  


  background(0);  


  redraw(); 


  


}   


