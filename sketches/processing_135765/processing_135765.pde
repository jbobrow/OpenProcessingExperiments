
void setup(){
  size(400,400);
  background(255);
}
void draw(){
 if (keyPressed) {
  if (key == '1') 
 background(#0000FF);  
 if(key == '2')
 background(#FF0000);
 if(key == '3')
 background(#00FF00);
 if(key == '4')
 background(#FF00FF);
 if(key == '5')
 background(#FFFF00);
 if(key == '6')
 background(#00FFFF);
 if(key == '7')
 background(random(0,255),random(0,255),random(0,255));
 if(key == '8')
 background(0);
 if(key == '9')
 background(255);
 
 
  }
}



