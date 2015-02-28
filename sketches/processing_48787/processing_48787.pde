
void setup(){
size(500, 450);
background(255);
}
 
float r,g,b,x1 = 250, y1 = 200, x2,y2,d,t;
 
void pos(){
  x2 = 250 + random(-200,200);
  d = round(random(1,2));
  if(d == 1){
  y2 = 225+sqrt(-sq(x2)+500*x2-22500);
  } else {
  y2 = 225-sqrt(-sq(x2)+500*x2-22500);
  }
}
 
void reset(){
  x1 = random(240,260);
  y1 = random(190,210);
}
 
void draw(){
  pos();
  
  for (int i = 0; i < 10; i++){
    r = random(255);
    g = random(255);
    b = random(255);
    

    if(y1 > y2 && y2 > 225 || x1 < 5 || x1 > 495 || y1 < 5 || y1 > 225+sqrt(-sq(x1)+500*x1-22500)){
      reset();
      }
      
    if (y1 > 250 && y2 > 225){
      r += 50;
      g += 50;
      b += 50;
    }
    
    stroke(r,g,b);
    line(x2, y2, x1, y1);
    smooth();
    x1 += random(-20,20);
    y1 += random(-20,20);
  }
}               
