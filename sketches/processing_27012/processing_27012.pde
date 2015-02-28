
PImage outerspace;

void setup(){
  size(600,600);
  outerspace=loadImage("outer_space.gif");
}

void draw(){
  background(0);
  
  for(int i=0; i<600; i=i +50){
    for(int j=0; j<600; j=j +50){
    image((outerspace),i,j+25,i,j);  
    
    noStroke();
    fill(255,100,150,25);
    ellipse(j*2,i-5,j,j+10);
      
    noStroke();
    fill(250,100,150,50);
    ellipse(j+10,j/2,5,j);
    
    noStroke();
    fill(255,10);
    rect(i,j/10,50,50);
    
    noStroke();
    fill(255,5);
    ellipse(i,j-2,i,30);
    
    noStroke();
    fill(250,100,150,5);
    ellipse(j+10,i,i,30);
    
    noStroke();
    fill(255,(99/100));
    ellipse(j,j,i,i);
  }
 }
}

