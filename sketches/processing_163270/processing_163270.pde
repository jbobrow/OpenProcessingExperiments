
int w = 700;
int h = 500;
void setup(){

  filter(BLUR);
  size(w,h);
background(255);
noStroke();
frameRate (30);
}
 
void draw(){

  
   filter(ERODE);



}  

}

void keyPressed(){
  if(key=='b'){
    background(255);
  
  if (key=='s'){
frameRate(0);
    
}

if (key=='g'){
frameRate(random(1,40));
}
}
}
