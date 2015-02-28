
int x;
int y;
int wh;
int shap;
void setup(){
  size(500,500);  // set canvas
  background(0);  //pick black for the app 
  frameRate(5);   //more fun to go slow
  fill(0);
  stroke(63, 143, 210);
}

void draw(){ 
  wh = wh + 2;
  if(shap == 0){     
    ellipse(x, y, wh, wh); // rain    
   }else if(shap == 1){
     triangle(x, y, x + wh, y, x + wh/2, y + wh);  
   }else if(shap == 2){
     rect(x, y, wh, wh);
   }
}
void keyPressed(){
      
  x = int(random(0, 499));
  y = int(random(0, 499));
  wh = 0;
  if(key == 'g'){ 
    shap = 0;
  }
  if(key =='h'){    
    shap = 1;
  }
  if(key =='f'){
    shap = 2;
  }
}

