
float a = 0;
float b = 0;
float c = 0;
float d = 0;

void setup() {
  size(200,200);
       stroke(255);
  line(100,0,100,200);
  line(0,100,200,100);


}

void draw() {
 background(0);
  
  a=a-1;
  b=b-1;
  c=c-1;
  d=d-1;

  if((mouseX<100)&&(mouseY<100)) {
    a=255;
  
  }
  else if ((mouseX>100)&&(mouseY<100)) {
     b=255;
     
  }
  else if ((mouseX<100)&&(mouseY>100)) {
    c=255;
    
  }
  else if ((mouseX>100)&&(mouseY>100)){ 
    d=255;
      
  }
  fill(a);
  rect(0,0,100,100);
  
  fill(b);
  rect(100,0,100,100);
  
  fill(c);
  rect(0,100,100,100);
  
  fill(d);
  rect(100,100,100,100);
  
  
}





