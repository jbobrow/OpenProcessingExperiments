

//import processing.pdf.*;

int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  
  size(400,800);
  // beginRecord(PDF,"patternmaterial.pdf");
 noLoop();
  
 background(0);
 smooth();
 noLoop();
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{
   fill(0);
  stroke(255);
  strokeWeight(0.5);
  line(500,0,50,1000);
  line(450,0,60,1000);
  line(400,0,70,1000);
  line(350,0,80,1000);
  line(300,0,90,1000);
  line(500,0,100,1000);
  line(500,0,150,1000);
  line(500,0,200,1000);
  line(500,0,250,1000);
  line(500,0,300,1000);
  line(500,0,400,1000);
 
  bezier(80,0,150,150,300,100,500,1000);
  bezier(100,0,150,150,300,100,500,1000);
  bezier(120,0,150,150,300,100,500,1000);
  bezier(140,0,150,150,300,100,500,1000);
  bezier(60,0,150,150,300,100,500,1000);
  bezier(40,0,150,150,300,100,500,1000);
  bezier(20,0,150,150,300,100,500,1000); 
  bezier(0,0,150,150,300,100,500,1000);
            
 endRecord(); 
}


void yourFunction(){
  

 
   
}

void keyPressed(){
  if(key=='s'||key=='S');


    }



