
//import processing.pdf.*;


void setup(){
  size(600,600);
  //beginRecord(PDF, "amanecer.pdf");
  background(0);
  smooth();
  
}

void draw (){
  lineas();
  noLoop();
  
  translate (width, height);
  rotate (PI);
  lineas();
  
 // endRecord();   
}
  
  void lineas (){
    for (int i=0; i<=1000; i+=10){
      stroke(#FF7E15);
      fill (#FFDC15,5);
      ellipse (0,0,width,i);
      fill (#FF3815,10);
      ellipse (0,0,width-100,i);
      fill (#FF0808,10);
      ellipse (0,0,width-300,i);
      fill (#FA6767,10);
      ellipse (0,0,width-500,i);
      line (0,0,i,2000);
      line (0,i,i,2000);
       
    }

}
  
  

