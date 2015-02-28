
int x= 0;
int y= 100;
float angulo = 0.0;



void setup(){
size (800,800);
background (0);


}

void draw (){

for (int i= 3; i<900; i+=160){
for (int a= 0; a<900; a+=150){
for (int e= 2; e<900; e+=200){
noFill ();
stroke (random (255), random(55), random(255),10);
    beginShape();
   curveVertex (a,200);
   curveVertex (i,200);
   curveVertex (200,e);
   curveVertex (e,i);
   
   endShape();
}
}
}

for (int b= 3; b<400; b+=150){
for (int c= 5; c<400; c+=100){
fill (50,100,250, 07);
stroke(2);
ellipse (600,600,c,b);

}
}


angulo= angulo +0.5;
translate (100,100); 
rotate (angulo);
x=x+1;
 
for (int b= 2; b<200; b+=60){
for (int c= 2; c<200; c+=60){
fill (50,250,50, 05);
stroke(2);
ellipse (x,y,b,c);
  
  
}
}



}


