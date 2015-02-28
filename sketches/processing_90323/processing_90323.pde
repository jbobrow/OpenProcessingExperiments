
void setup(){
  size(500,344);
  background(0);
  
}

void draw(){
  //circle pattern
  for(int i = 0; i<600; i+=18){
    for(int j = 0; j<600; j+=18){
    
    strokeWeight(1);
    fill(0);
    stroke(255,255,255);
    ellipse(i,j,18,18);
  
    strokeWeight(3);
    stroke(255,255,255);
    line(0,99,500,99);//horizontal1
    line(0,279,500,279);//horizontal2
    line(162,0,162,500);//vertical1
    line(342,0,342,500);//vertical2
    
   //rectangles
   fill(255,255,255);
   rect(0,171,162,18);
   rect(163,81,180,18);
   rect(342,171,162,18);
    
    
    //rect(i,j,5,5);
    //fill(mappedColor);
    
    //i=open variable (integer equals to 100 - starting value)
    //always have to create a new variable within a for loop
    //i=100 when the statement begins
  }
  }
  
  
}

