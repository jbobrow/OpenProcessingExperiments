
void setup() {
  size(600,600);
  smooth();
  background(37,6,77);
  
}

int value=0,value2=200,value3=350,value4,value5,value6,value7,value8=350;

void draw() {

    
  a=random(5,10);
  
  noStroke();
 
  
  fill(54,23,94);
  for(int i = 500; i > 50; i -= 50){
    for(int u = 500; u > 50; u -= 50){
  ellipse(i,u,20,20);
    }
  }
  
   
  fill(85,50,133);
   for(int i = 500; i > 50; i -= 50){
    for(int u = 500; u > 50; u -= 50){
  ellipse(i,u,15,15);
    }
  }
   
  fill(123,82,171);
   for(int i = 500; i > 50; i -= 50){
    for(int u = 500; u > 50; u -= 50){
  ellipse(i,u,10,10);
    }
  }
  
  fill(40,3,random(6,200));
   for(int i = 500; i > 50; i -= 50){
    for(int u = 500; u > 50; u -= 50){
  ellipse(i,u,5,5);
    }
  }
 
  fill(85,50,133);
  ellipse(value2,value3,20,20);
  
  fill(37,6,77);
  ellipse(value2,value3,15,15);
  
  fill(54,23,94);
  ellipse(value7,value5,16,16);
   
  fill(85,50,133);
  ellipse(value4,value6,12,12);
 
  fill(54,23,94);
  ellipse(mouseX, mouseY,20,20);
   
  fill(85,50,133);
  ellipse(mouseX, mouseY,15,15);
   
  fill(123,82,171);
  ellipse(mouseX, mouseY,a,a);
  
  fill(value);
  ellipse(mouseX, mouseY,5,5);
  
  fill(123,82,171);
  ellipse(value6,value4,24,24);
 
  fill(54,23,94);
  ellipse(value5,value6,50,50);// team a
   
  fill(85,50,133);
  ellipse(value5,value6,30,30);
   
  fill(37,6,77);
  ellipse(value5,value6,20,20);
  
  fill(37,6,77);
  ellipse(value7,value4,30,30);// team b
   
  fill(54,23,94);
  ellipse(value7,value4,22,22);
   
  fill(85,50,133);
  ellipse(value7,value4,20,20);
  
  fill(123,82,171);
  ellipse(value8,value6,20,20);// team 
   
  fill(37,6,77);
  ellipse(value8,value6,15,15);
   
  fill(37,6,77);
  ellipse(value8,value6,10,10);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void mouseClicked() {
  value2=random(0,600);
  value3=random(0,600);
}

void keyPressed() {
  value4=random(0,600);
  value5=random(0,600);
  value6=random(0,600);
  value7=random(0,600);
  value8=random(0,600);
}



