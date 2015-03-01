
int y1=340;
int y2=430;
int y3=190;
int y4=330;
int x1=80;
int sp=20;
float angle =0.0;

void setup(){
 size(800,600);
 frameRate(20);
}

void draw(){
float sinval=sin(angle);
println(sinval);
float sfondo = map(sinval, -1, 1, 0, 255);
background(sfondo);
float scritta = map(sinval, -1, 1, 255, 0);
stroke(scritta);
angle +=0.1;
//strokeWeight(1);
 smooth();
 noFill();
 translate(60,-40);
 
 //A
 beginShape();
 vertex(x1, y2);
 vertex(x1*2, y1);
 vertex(x1*2, y2);
 endShape();
 
 //V
 beginShape();
 vertex((x1*2)+sp, y1);
 vertex((x1*2)+sp, y2);
 vertex((x1*3)+sp, y1);
 endShape();
//A
 beginShape();
 vertex((x1*3)+sp*2, y2);
 vertex((x1*3)+sp*2, y1);
 vertex((x1*4)+sp*2, y2);
 endShape();
 
//R
 beginShape();
 vertex((x1*4)+sp*3, y2);
 vertex((x1*4)+sp*3, y1);
 vertex((x1*4)+sp*3+80, y1);
 vertex((x1*4)+sp*3, (y2+y1)/2);
 vertex((x1*5)+sp*3, y2);
 endShape();

//i
 beginShape();
 vertex((x1*5)+sp*4, y1+sp*2);
 vertex((x1*5)+sp*4, y2);
  endShape();

 beginShape();
 vertex((x1*5)+sp*4, y1);
 vertex((x1*5)+sp*4, y1+sp/2);
 endShape();
 
  //A
 beginShape();
 vertex((x1*5)+sp*5, y2);
 vertex((x1*5)+sp*5, y1);
 vertex((x1*6)+sp*5, y2);
 endShape();
 /////////////////////
  //A 
 beginShape();
 vertex(x1*2+10, y4);
 vertex((x1*3)+sp*2, y3);
 vertex((x1*3)+sp*2, y4);
 endShape(); 
 //V
 beginShape();
 vertex((x1*3)+sp*3, y3);
 vertex((x1*3)+sp*3, y4);
 vertex((x1*2)+sp, y3);
 endShape();
  //A 
 beginShape();
 vertex((x1*3)+sp*4, y4);
 vertex((x1*3)+sp*4, y3);
 vertex((x1*5)+sp*2-10, y4);
 endShape(); 

 //I
 beginShape();
 vertex((x1*4)+sp*2, y4);
 vertex((x1*4)+sp*2, y3+sp*2);
 endShape(); 
 //.
 beginShape();
 vertex((x1*4)+sp*2, y3+5);
 vertex((x1*4)+sp*2, y3+15);
 endShape(); 
 
//R
 beginShape();
 vertex((x1*4)+sp, y4);
 vertex((x1*4)+sp, y3);
 vertex((x1*4)+sp+80, y3);
 vertex((x1*4)+sp, (y4+y3)/2);
 vertex((x1*5)-10, y4);
 endShape();
 //A 
 beginShape();
 vertex((x1*4)+sp*3, y4);
 vertex((x1*4)+sp*3, y3);
 vertex((x1*6)+sp*1-10, y4);
 endShape(); 
}


