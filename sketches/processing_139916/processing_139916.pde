
//risa hiyama
//color beam 
boolean button = false; 

void setup(){
  size(400,400);
}

void draw(){
  colorBeam();
}

void mousePressed(){
  button = !button;   
}

void colorBeam(){
  if (button){
    for(int i=0; i<width; i+=10){
      for(int y=0; y<height; y+=10){
        fill(random(255),random(255),random(255));
        rect(i,y,10,10); 
      }
    }
  }
  else {
    fill(0);
    rect(0,0,400,400);
  }
}





