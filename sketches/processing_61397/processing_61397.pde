

void setup(){
  size(500,500);
  background(256,256,256);
  smooth();
}

void draw(){
  int a,b,c,d;
  c=mouseX%100;
  d=mouseY%100;
  
  //line(mouseX,mouseY,200,200);

  for(a=0;a<=500;a+=10){
    for(b=0;b<=500;b+=10){
      ellipse(a,b,5,5);
      a+=0.9;
      b+=0.9;
      
      rect(a,b,5,5);
      noStroke();
      fill(random(0,400)+c+d,random(0,400)+c,random(400,400)+d);
//      fill(random(0,256),random(0,256),random(0,256));
    }
  }
      delay(50);
}

