
float centerX = 500;

float centerY = 500;

float x = 10;

float y = 10;

float r = PI;

float t, f, a, b, j, k, m, n;

float i=1;

float fillx= 50;

float filly = 50;

float quantity=1;

boolean mouseIsDown = false;

void setup(){

  size(1400,750);

  smooth();

  frameRate(60);

  background(0,0,0,10);

}

 

void draw(){

 

  fill(255,255,255);

   i=i+1;

fill(100,100,100);

 

//random limiting function

 

if(fillx<255 && filly<255){

t=x-1;

f=x+1;

a=y-1;

b=y+1;

}

else{

  t=0;

  f=200;

  a=0;

  b=200;

}

 

if (x+centerY>100){

  

  fillx=random(t,f);

  filly=random(a,b);

}

x = (random(t,f));

y = (random(a,b));

 

if(i <= 50 || (750 <= i && i<=1000) || (2000<=i && i<=2250) || (5000<=i &&
i<=5250) ){

  fillx=abs(x-y)*30;

filly=abs(x+y);

 

}

else{

    fillx=abs(x-y)*30;

filly=abs(x+y);

}

 

if(centerX>=1350){

centerY=random(50,650);

centerX=random(50,1350);

}

else if(centerX<=50){

centerY=random(50,650);

centerX=random(50,1350);

}

if(centerY>=650){

centerY=random(50,650);

centerX=random(50,1350);

}

else if(centerY<=50){

centerY=random(50,650);

centerX=random(50,1350);

}

 strokeWeight(x);

 

 

        quantity = 6;

if (mouseIsDown==false && i<=4000){

   fill(random(fillx,255),random(filly,100),0, 10);


       if (x>20){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-100;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-5;

}       

 

else if (x>40){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-10;

k=centerX+10;

m=centerY-10;

n=centerY+10;

x=x-15;

}

else if (x>50){

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/10);

  j=centerX-10;

k=centerX+20;

m=centerY-20;

n=centerY+20;

x=x-20;

}

else if (x>100){

   background(00,00,00);

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/5);

    background(00,00,00);

  j=centerX-10;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-20;

}

else{

r= r+PI/20;

j=centerX-7;

k=centerX+7;

m=centerY-7;

n=centerY+7;

}

    //fill(fillx,filly,100);

        }

else if (mouseIsDown==true && i>=4000){

   fill(random(fillx,255),0,random(filly,255));

         if (x>20){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-100;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-5;

}       

 

else if (x>40){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-10;

k=centerX+10;

m=centerY-10;

n=centerY+10;

x=x-15;

}

else if (x>50){

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/10);

  j=centerX-10;

k=centerX+20;

m=centerY-20;

n=centerY+20;

x=x-20;

}

else if (x>100){

   background(00,00,00);

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/5);

    background(00,00,00);

  j=centerX-10;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-20;

}

else{

r= r+PI/20;

j=centerX-7;

k=centerX+7;

m=centerY-7;

n=centerY+7;

}//  fill(0,0,0);

        }

else if (mouseIsDown==true && i<=4000){
  background(0,0,0);

   fill(random(0,255),random(0,100),random(0,255));

        if (x>20){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-100;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-5;

}       

 

else if (x>40){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-10;

k=centerX+10;

m=centerY-10;

n=centerY+10;

x=x-15;

}

else if (x>50){

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/10);

  j=centerX-10;

k=centerX+20;

m=centerY-20;

n=centerY+20;

x=x-20;

}

else if (x>100){

   background(00,00,00);

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/5);

    background(00,00,00);

  j=centerX-10;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-20;

}

else{

r= r+PI/20;

j=centerX-7;

k=centerX+7;

m=centerY-7;

n=centerY+7;

} //  fill(0,0,0);

        }

else if (mouseIsDown==false && i>=4000){

   fill(random(0,255),0,0);

        if (x>20){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-100;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-5;

}       

 

else if (x>40){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-10;

k=centerX+10;

m=centerY-10;

n=centerY+10;

x=x-15;

}

else if (x>50){

   fillx=abs(x-y)*15;

filly=abs(x+y);

fill(random(0,255),random(0,255),random(0,255));

// fill(fillx/10,0,filly/10);

  j=centerX-10;

k=centerX+20;

m=centerY-20;

n=centerY+20;

x=x-20;

}

else if (x>=100){

   background(00,00,00);

   fillx=abs(x-y)*15;

filly=abs(x+y);

fill(fillx/10,0,filly/5);

    background(00,00,00);

  j=centerX-10;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-20;

}

else{

r= r+PI/20;

j=centerX-7;

k=centerX+7;

m=centerY-7;

n=centerY+7;

} //  fill(fillx,100,filly);

        }

 else if (i>=6000){

          if (x>20){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-100;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-5;
i=0;

}       

 

else if (x>40){

   fillx=abs(x/4-y)*10;

filly=abs(x/4+y);

// fill(fillx,0,filly);

j=centerX-10;

k=centerX+10;

m=centerY-10;

n=centerY+10;

x=x-15;

}

else if (x>50){

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/10);

  j=centerX-10;

k=centerX+20;

m=centerY-20;

n=centerY+20;

x=x-20;

}

else if (x>100){

   background(00,00,00);

   fillx=abs(x-y)*15;

filly=abs(x+y);

// fill(fillx/10,0,filly/5);

    background(00,00,00);

  j=centerX-10;

k=centerX+100;

m=centerY-100;

n=centerY+100;

x=x-20;

}

else{

r= r+PI/20;

j=centerX-7;

k=centerX+7;

m=centerY-7;

n=centerY+7;

} i=0;

          background(0,0,0);

        }

 

centerX=random(j,k);

centerY=random(m,n);

beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

 

beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

println(x);

beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

 

 beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

  beginShape();

vertex(centerX-1.4*x,centerY-3.8*x);

vertex(y+centerX,centerY-12*y);

vertex(1.4*x+centerX,centerY-3.8*x);

vertex(8.5*y+centerX,centerY-8.5*y);

vertex(3.8*x+centerX,centerY-1.4*x);

vertex(12*y+centerX,centerY+y);

vertex(3.8*x+centerX,centerY+1.4*x);

vertex(8.5*y+centerX,centerY+8.5*y);

vertex(1.4*x+centerX,centerY+3.8*x);

vertex(y+centerX,centerY+12*y);

vertex(centerX-1.4*x,centerY+3.8*x);

vertex(centerX-8.5*y,centerY+8.5*y);

vertex(centerX-3.8*x,centerY+1.4*x);

vertex(centerX-12*y,centerY+y);

vertex(centerX-3.8*x,centerY-1.4*x);

vertex(centerX-8.5*y,centerY-8.5*y);

vertex(centerX-1.4*x,centerY-3.8*x);

endShape();

 //octagon

 

 

 

 

 

   i=i+1;

 

}

 

 

void mousePressed(){

  mouseIsDown = true;

}

void mouseReleased(){

  mouseIsDown = false;

}


