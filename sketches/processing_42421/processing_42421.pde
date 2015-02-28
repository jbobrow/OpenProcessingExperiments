
//Author:vicky Lo  

//Purpose: To practice how to apply time and repetitions  

//Functioning: Show Spatial variation of cells  

   

// Space setup  

void setup () {  

  size (300, 700);  

  smooth();  

  int x=1;  

}  

float a=second();  

float b=second();  

float c=second();  

float d=second();  

float e=second();  

float f=second();  

float g=second();  

float h=second();  

float i=second();  

float j=second();  

   

   

void space () {  

  background(0,93,173);  

  beginShape (); // space 1  

   

   

  a=a+0.5;  

  noStroke();  

  fill(230, 23, 115);  

  ellipse (150, 150, a, a);  

  if (a>50) {  

    a=0;  

  }  

  b=b+0.9;  

  strokeWeight(1);  

  fill(10, 50, 200);  

  ellipse (100, 200, b, b);  

  if (b>100) {  

    b=0;  

  }  

  c=c+2;  

  stroke(255, 241, 0);  

  strokeWeight(2);  

  noFill();  

  ellipse (200, 200, c, c);  

  if (c>1000) {  

    c=0;  

  }  

  d=d+0.6;  

  fill(255, 57, 55, 90);  

  noStroke();  

  ellipse(150, 250, d, d);  

  if (d>250) {  

    d=0;  

  }  

   

  e=e+0.1;  

  fill(0, 162, 154);  

  noStroke();  

  ellipse (200, 400, e, e);  

  if (e>50) {  

    e=0;  

  }  

   

  f=f-1;  

   

  fill(255, 241, 0);  

  ellipse (150, 650, f, f);  

  if (f<0) {  

    f=100;  

  }  

     

  g=g+0.64;  

  fill(232, 57, 40);  

  ellipse (radians(g)+150, 550-g, 20, 20);  

  if(g>200){  

    g=0;  

  }  

  h=h+0.54;  

  fill(0, 162, 154);  

  ellipse (100, tan(h)+400, 20, 20);  

  if(h>100){  

    h=0;  

  }  

   i=i+5;  

  fill(255, 241, 0);  

  ellipse (cos(i)+100, 600-i, 10, 10);  

  if(i>400){  

    i=0;  

  }  

  j=j+2;  

  fill(255, 241, 0);  

  ellipse (sin(j)+200, 600-j, 30, 30);  

  if(j>200){  

    j=0;  

  }  

  endShape ();  

  //space2  

  beginShape ();  

  fill(0, 162, 154);  

  ellipse (150, 350, 20, 20);  

  ellipse (150, 450, 10, 10);  

  endShape ();  

}  

   

int p = 0;  

int p1 = 0;  

float p2;  

   

void cell () {  

  p++;  

  p1= p;  

   

  stroke (255, 80);  

  strokeWeight (5);  

  line (150, 350, p, p);  

  line (150, 650, p, p);  

   

  fill(255, 241, 0, 80);  

  stroke (0, 0, 80, 90);  

  strokeWeight (1);  

  ellipse (150, 350, p1, p1);  

  if (p >= width) {  

    p =0;  

  }  

  if (p1>=width) {  

    p1=10;  

  }  

}  

   

   

int diam1 = 1;  

float centX, centY, tempdiam, diam;  

   

   

void spacechange () {  

   

  frameRate(15);  

   

   

  if (diam1 <= 60) {  

    stroke(0, 0, 21);  

    strokeWeight(0);  

    fill(255,120);      

   

    ellipse (150, 350, diam1-10, diam1-10);  

    ellipse (100, 400, diam1-10, diam1-10);  

    ellipse (200, 400, diam1-10, diam1-10);  

    ellipse (150, 450, diam1-10, diam1-10);  

   

    diam1 += 2;    

   

    fill(196,215,10,30);      

   

    ellipse (150, 550, (diam1+50), (diam1+50));  

    ellipse (100, 600, (diam1+50), (diam1+50));  

    ellipse (200, 600, (diam1+50), (diam1+50));  

    ellipse (150, 650, (diam1+50), (diam1+50));  

  }  

   

  // loop within loop  

  while (tempdiam > 10) {                                

    ellipse(centX, centY, tempdiam, tempdiam);  

    tempdiam -= 50;  

  }  

}  

   

   

void draw() {  

  space ();  

  cell ();  

  spacechange ();  

}  

   

void mousePressed() {  

  saveFrame("cell.jpg");  
}


