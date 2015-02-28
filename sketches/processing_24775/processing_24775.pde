
int h=250;
int g=100;
int c=1000;


//import processing.pdf.*;

void setup(){
  size(400,800);
  strokeWeight(2);
  stroke(0);
  smooth();
  background(255);
   noLoop();
  //beginRecord(PDF, "wallpaper1.pdf");
}

void draw(){

  
  strokeWeight(2);

stroke(0, 0, 0);
bezier(h, 0, 100, 90, 250, 100, 100, c);
bezier(h, 0, 70, 90, 250, 100, 80, c);
bezier(h,100,150,50,200,39,250,c);
bezier(h,0,150,150,300,100,500,c);
bezier(h,30,350,60,400,50,700,c);
bezier(h,0,20,109,389,29,500,c);
bezier(g,90,90,300,150,25,50,c);
bezier(g,30,90,300,30,25,20,c);
bezier(g,9,90,300,43,25,10,c);
bezier(g,0,90,50,150,25,30,c);


 
  endRecord();


}



