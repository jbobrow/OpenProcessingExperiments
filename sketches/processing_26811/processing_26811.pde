
//DECLARATIONS

//INITIAL SETUP
void setup(){
 size(200, 200);
smooth();

  
  
}
//REPEAT

void draw(){
 background(255);
 stroke(0);
 noFill();
  drawCircle (width/2, height/2,100);
}

void drawCircle(float x, float y, float r){
  ellipse(x, y, r, r);
  if(r > 2){
    drawCircle(x +r/2, y, r/2);
    drawCircle(x -r/2, y, r/2);
    
    //chpt 13, skipped probability
    
//    r *=0.75;
//    drawCircle(x, y, r);
  }
  
}

