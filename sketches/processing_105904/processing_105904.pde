
monster [] S = new monster[5];

void setup(){
  size(600, 200);
  for (int i = 0; i < S.length; i++){
    S[i] = new monster();
    S[i].prime(i*width/S.length, height/2, 5);
  }
}

void draw(){
  background(255, 164, 134);
  
  textSize(32);
  fill(150, 255, 255);
  text("STUPID!!", 220, 50);
  
  for (int i = 0; i < S.length; i++){
    S[i].animate();
  }
  
  for (int i = 0; i < S.length; i++){
    S[i].move();
  }
}
class monster{

  float x;
  float y;
  float speed;
  
  void prime(float a, float b, float c){
    x = a;
    y = b;
    speed = c;
  }
  
  void animate(){
    rectMode(CENTER);
    
    //body
    fill(200, 200, 0);
    rect(x, y + 40, 50, 80);
    
    //face
    fill(200, 200, 0);
    rect(x, y, 80, 50);
    
    //eye1
    fill(255);
    ellipse(x - 10, y - 10, 10, 10);
    
    //eye1
    fill(255);
    ellipse(x + 5, y - 10, 10, 10);
    
    //mouth
    line(x , y + 5, x + 10, y + 5);  
  }
  
   void move(){
    if(mousePressed){ 
        x+=speed;
      } 
     if(x>=600+25){
       x=-25;
     }     
   }   
}


