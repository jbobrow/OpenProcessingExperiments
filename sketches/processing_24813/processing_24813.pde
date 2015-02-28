
int h=250;
int g=100;
int c=1000;
//import processing.pdf.*;

int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(400,800);
  // beginRecord(PDF,"wallpapermaterial.pdf");
  background(0);
  smooth();

  
  
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
  endRecord();
  
}


void draw()
{
  
}


void yourFunction(){
  

  
   strokeWeight(1);

stroke(255);
fill(0);
bezier(h, 0, 100, 90, 250, 100, 100, c);
fill(0);
bezier(h, 0, 70, 90, 250, 100, 80, c);
bezier(h,100,150,50,200,39,250,c);
bezier(h,0,150,150,300,100,500,c);
bezier(h,30,350,60,400,50,700,c);
bezier(h,0,20,109,389,29,500,c);
bezier(g,90,90,300,150,25,50,c);
bezier(g,30,90,300,30,25,20,c);
bezier(g,9,90,300,43,25,10,c);
bezier(g,0,90,50,150,25,30,c);
noLoop();

}


void keyPressed(){
  if(key=='s'||key=='S')
  {
    //
  }
}


