
//import processing.pdf.*;


float x, y;
float a=10;
float r = 300;
float d = 88;

void setup(){
  
  size(600,600);
  background(255);
//beginRecord(PDF, "every.pdf");

  
}

void draw(){
  
  x=100 * sin(a);
  y=100* cos(a); 
  
 // a = a +1;
  a += 15;
r= r-d;
  
  if (r==10 || r ==200){
 d = d * -5;
  }

stroke(0,5);

noFill();
rotate( 0);

translate(width/2, height/2);

line(0, 0, x+50,y);
line(0, 0, x+90,y-100);
line(0, 0, x+150,y+19);
line(0,0,x-50,y+125);
line(0,0,x-150,y-100);
line(0,0,x-125,y);



println(x + " : " +y);
  
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}



