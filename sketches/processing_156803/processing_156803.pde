
int x=0;
int y=0;
int i=0;
 
void setup(){
  size (500,500);
}
    
void draw() {
  background(0);
   fill(random(255),random(255),random(255));

ellipse(x, y, 10, 10);

if(x<width && y==0){
  x+=5;
}else if(x>width && y==0){
  x=width;
}

if(x==width && y<height){
  y+=5; 
} else if(y>height && x==width){
  y=height; 
}

if(y==height && x>0){
  x-=5; 
} else if(y==height && x<=0){
  x=0; 
}

if(x==0 && y>0){
  y-=5; 
} else if(x==0 && y<=0){
  y=0; 
}
 

  
 fill(i+=5,0, 0);
  for (int i=0; i<10; i++){
    for (int j=0; j<10;j++){
     
      ellipse(25+(i*50),25+(j*50),30,30);
    }
  }
  }

