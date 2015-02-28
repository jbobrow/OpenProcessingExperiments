
float r;
float g;
float b;
float a;
float x;
float y;

void setup(){
  size(400,400);
  smooth();

}

void draw(){

  int i=0;
  int j=0;
  
     for (i=0;i<width;i++){
    rect(x,y,15,115);
     r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
    x=random(width);
    y=random(height);
    fill(r,g,b,a);
   x+=10;
    
    
    }
    for (j=0;j<y;j++){
       ellipse(x,y,15,115);
     r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
    x=random(width);
    y=random(height);
    fill(r,g,b,a);
  y+=10;
    }
      
}


