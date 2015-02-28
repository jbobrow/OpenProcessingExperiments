
int x= 0;
int y= 100;
float angulo = 0.0;



void setup(){
size (800,800);
background (0);


}

void draw (){


angulo= angulo -0.1;
translate (100,100); 
rotate (angulo);
x=x-2;
 
for (int b= 2; b<200; b+=60){
for (int c= 2; c<200; c+=60){
fill (203,255,0, 01);
ellipse (y,x,b,c);
  
  
}
}

for (int i= 3; i<900; i+=160){
for (int a= 0; a<900; a+=150){
for (int e= 2; e<900; e+=200){
noFill ();
stroke (random (55), random(255), random(0),10);
    beginShape();
   curveVertex (a,200);
   curveVertex (i,200);
   curveVertex (200,e);
   curveVertex (e,i);
   
   endShape();
}
}
}


}


