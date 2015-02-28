
//import processing.pdf.*;

void setup() {
  size(800, 600);  
 
//  beginRecord(PDF, "alas.pdf");
   background(54, 97, 114); 
}
void draw (){
 for (int x=10; x<=width; x= x+10){
 //line (x, 300, x, 600);
//smooth();
 line (0, 0, x, 600);
     line (x, x, 0, 100);
     //  line (x, x, 0, 700);
         // line (x, x, 0, 800);
     line (x, x, 0, 200);
      line (x, 0, 0, 300);
      // line (x, 0, 0, 200);
 }
}
  void mousePressed (){
saveFrame ("1.JPG");
//endRecord();

}

