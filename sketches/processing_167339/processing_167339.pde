

float a=1;
float b=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){

 //circle with expanding size center circles form a cross

ellipse(100,b,a,a);
ellipse(b,100,a,a);

//a increases by 1
a=a+1;
//maximum size
if (a>50) {
  a=0;
}

b=b+50;
//maximum distance
if (b>200){
  b=0;
}



}


