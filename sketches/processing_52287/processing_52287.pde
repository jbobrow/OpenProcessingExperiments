

int figura;
int x;
int y;


void setup() {

size(500,500); 

figura=0;
x=0;
y=0;

}


void draw (){
  
  background(255);
  
   fill(random(255),random(255),random(255),random(255));
  
  rect(x,y,100,100);
  

if(figura==0){
 x=x+2;
 
}
if (x> 400){
  figura=1;
}// arriba

if(figura==1){
  y=y+2;
}
 
 if(y>400){
   figura=2;
 
  
}//abajo

if(figura==2){
 x=x-2;
 
}
if(x<100){
  figura=3;
}

if(figura==3){
  y=y-2;
}
if(y<100){
  figura=0;
}
}

