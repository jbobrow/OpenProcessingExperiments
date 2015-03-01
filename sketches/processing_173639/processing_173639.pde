
//import processing.pdf.*;


//TELARAÑA:
size (600,600);
//beginRecord(PDF,"telaraña.pdf");
background(0);
  translate(300,300);
int x=10;
while(x<1000){

  stroke(250,20);
  noFill();
  triangle(x,500-x,20,20,20,20);
  triangle(x,x,20,20,20,20);
  rect(x,500-x,30,30);
  rect(x,x,30,30);
  stroke(250,40);
  line(x,0,0,500-x);
  line(x-5,495-x,0,0);
  line(x,500,500,500-x);
  line(x+5,505-x,500,500);
  x=x+1;
  rotate(PI/7);
 
}
//endRecord();
