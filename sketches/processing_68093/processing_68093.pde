
int a;
int b;
int z=0;

int c;
int d;
int y=0;

int e;
int f;
int x=0;

int g;
int h;
int w=0;

int i;
int j;
int v=0;



void setup(){
  size (1280,800);
  smooth();
  background (255);
a=width;
b=height;

c=width;
d=height;

e=width;
f=height;

g=width;
h=height;

i=width;
j=height;


}
void draw(){
  background(255);
noFill();

if ((a!=300) && (b!=300) && z!=1 ) {   
  
a=int (random(width));
b=int (random(height));

strokeWeight(35); //AZUL
  stroke(0,110,180);
    ellipse (a,b,300,300);
     strokeWeight(7);
  stroke(255);
  ellipse (a,b,335,335);
  ellipse (a,b,270,270);
  
}
else{
  strokeWeight(35); //AZUL
  stroke(0,110,180);
    ellipse (300,300,300,300);
     strokeWeight(7);
  stroke(255);
  ellipse (300,300,335,335);
  ellipse (300,300,270,270);
  
  z=1;
}

if ((c!=475) && (d!=450) && y!=1){        

c=int (random(width));
d=int (random(height));

 strokeWeight(35);  //AMARILLO
   stroke(242,186,0);
  ellipse (c,d,300,300);
    strokeWeight(7); 
  stroke(255);
  ellipse (c,d,335,335);
  ellipse (c,d,270,270);
}
else{
strokeWeight(35);  //AMARILLO
   stroke(242,186,0);
  ellipse (475,450,300,300);
    strokeWeight(7); 
  stroke(255);
  ellipse (475,450,335,335);
  ellipse (475,450,270,270);
  
 

y=1;

}
 
  
    if (y==1 && z ==1){
   //CORTE AZUL SOBRE AMARILLO
   strokeWeight(35);
  stroke(0,110,180);
  arc(300,300,300,300,-PI / 7.5, PI / 7.5);
 strokeWeight(7);
  stroke(255);
  arc (300,300,335,335,-PI/4,PI/4);
  arc (300,300,270,270,-PI/4,PI/4);
  }

if ((e!=650) && (f!=300) && x!=1){     

e=int (random(width));
f=int (random(height));

 strokeWeight(35); //NEGRO
  stroke(0);
  ellipse (e,f,300,300);
  strokeWeight(7);
  stroke(255);
  ellipse (e,f,335,335);
  ellipse (e,f,270,270);
}
else{
  
 strokeWeight(35); //NEGRO
  stroke(0);
  ellipse (650,300,300,300);
  strokeWeight(7);
  stroke(255);
  ellipse (650,300,335,335);
  ellipse (650,300,270,270);
  
 
   
  
  
  x=1;
} 


  if(y==1 && x ==1){
     //CORTE AMARILLO SOBRE NEGRO
   strokeWeight(35);
  stroke(242,186,0);
  arc(475,450,300,300,4.8, 5.75);
 strokeWeight(7);
  stroke(255);
  arc (475,450,335,335,4.7,5.95);
  arc (475,450,270,270,4.7,5.95);
}

if ((g!=825)&&(h!=450)&& w!=1){          
g=int (random(width));
h=int (random(height));

strokeWeight(35); //VERDE
   stroke(7,147,42);
  ellipse (g,h,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (g,h,335,335);
  ellipse (g,h,270,270);
}
else{
  strokeWeight(35); //VERDE
   stroke(7,147,42);
  ellipse (825,450,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (825,450,335,335);
  ellipse (825,450,270,270);
  
 
  
   
 
  w=1;

}

    if (w==1 && x==1){ 
   //CORTE NEGRO SOBRE VERDE
   strokeWeight(35);
  stroke(0);
  arc(650,300,300,300,-PI / 7.5, PI / 7.5);
 strokeWeight(7);
  stroke(255);
  arc (650,300,335,335,-PI/4,PI/4);
  arc (650,300,270,270,-PI/4,PI/4);
  
}

if ((i!=1000)&&(j!=300) &&v!=1){

i=int (random(width));
j=int (random(height));

 strokeWeight(35); //ROJO
  stroke(215,0,21);
  ellipse (i,j,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (i,j,335,335);
  ellipse (i,j,270,270);

}
else{
  
   strokeWeight(35); //ROJO
  stroke(215,0,21);
  ellipse (1000,300,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (1000,300,335,335);
  ellipse (1000,300,270,270);
  
  
   
  
  v=1;
 
}

 

 if (w==1&&v==1){
     //CORTE VERDE SOBRE ROJO
   strokeWeight(35);
  stroke(7,147,42);
  arc(825,450,300,300,4.8, 5.75);
 strokeWeight(7);
  stroke(255);
  arc (825,450,335,335,4.7,5.95);
  arc (825,450,270,270,4.7,5.95);
}


  
  
   

    
 if (keyPressed){
   
   if (key == ' ') {
   v=0;
   w=0;
   x=0;
   y=0;
   z=0;

a=width;
b=height;

c=width;
d=height;

e=width;
f=height;

g=width;
h=height;

i=width;
j=height;


 }
 }
}


