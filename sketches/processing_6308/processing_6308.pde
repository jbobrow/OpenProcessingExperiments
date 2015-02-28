
int size=10;

void setup(){
  size(500,500);
  background(20); 
  smooth();
}

void draw(){

  fill(20,20);
  rect(0,0,width,height);
  int a= int(random(height));
  int b= int(random(width));
  if(size<width*2.5){
  
    noFill();
    stroke(size,size,size);
    ellipse(0,height/2,size,size);
    ellipse(width/2,0,size,size);
    ellipse(width,height/2,size,size);
    ellipse(width/2,height,size,size);
    ellipse(width/2,height/2,size,size);

    ellipse(0,height,size,size);
    ellipse(0,0,size,size);
    ellipse(width,height,size,size);
    ellipse(width,0,size,size);
    ellipse(width/2,height/2,size,size);
    size+=5;
  }

  else{   
    size-=width*5.3; 
  }
};

