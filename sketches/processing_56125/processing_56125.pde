
int counter;
int counter2;
float weight;
float a;
int x;
int y;
int radians=0;


void setup() {  //setup function called initially, only once
  size(450, 450);
  background(255);  //set background white
  colorMode(RGB);
  counter = 0;
  weight=0;
  x=0;
  y=0;
  a=PI/2; 
  counter2=1;
  position= new int[2];   
  position[0]=width/2;
  position[1]=height/2;
  
}

void draw() {  //draw function loops 
  counter++;
  weight=random(2);
  a=PI/36;
  switch(counter2){
      case 1: 
      fill(255,0,0,30);
      counter2++;
      break;
      case 2:
      fill(0,255,0,30);
      counter2++;
      break;
      case 3:
      fill(0,0,255,30);
      counter2=1;
      break;
      
      
  }
  
  strokeWeight();
  
  size=abs(sin(counter*PI/36)*40);
  
  radians++;
  
  translate(width/2,height/2);
  
  
  rotate(radians*PI/36);
  ellipse(0, 0, size, size);
  for(int i=1;i<10;i++){
      ellipse(width/(2+2*i),height/(2+2*i),size/(2+2*i),size/(2+2*i));
  }

  
  
  rotate(-2*radians*PI/36);
  for(int i=1;i<10;i++){
      ellipse(width/(1+2*i),height/(1+2*i),size/(1+2*i),size/(1+2*i));
  }

  
}


void mouseClicked(){
      popMatrix();
      fill(255);
      rect(0,0,width,height);
      pushMatrix();
      translate(mouseX-width/2,mouseY-height/2);
      
  }

