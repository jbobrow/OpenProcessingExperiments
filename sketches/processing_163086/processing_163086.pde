
int timer = 0;


void setup(){
  size(600,600);
  frameRate(30);
  
}

void draw(){

  setGradient(0,0,width,height,color(11,62,126),color(0));
  fill(246,255,0,200);
  noStroke();
  ellipse(56,46,100,100);
  
  for(float y=0; y<height/3; y+=20){ // generate a lightning
         float x = random(0,width);
         float randY = random(-10,10);
         stroke(255);
         point(x, y+randY); 
 }
  
  
  
  if(timer==10){
    stroke(random(0,255), random(0,255), random(0,255));
    for(int i=0; i<random(1,5);i++){ // the numbers of lightning
      float t = random(0,width); //random X
    
      for(float y=0; y<height; y+=10){ // generate a lightning
         float X = t;
         float X2 = t+random(-width/20,width/20);
         line(X, y, X2, y+10); 
         t=X2; 
      }
    }
    timer=0;
  }
  else{
     timer++; 
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2) {

  noFill();

    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
 
}
