
int r = 255;
int size = 52;
boolean yellow = false;
int squarex = 0;
int squarey = 0;

void setup(){
  size(200,200);
  frameRate(2);
}

void draw(){
  background(255);

  for(int y = 20; y < height-40; y+=52){
    for(int x = 20; x < width-40; x+=52){   
      if(random(100) > 70)
      {
        fill(255,255,0);  
        yellow = true;
      }
     else{
        fill(0,0,random(255));
     }      
     squarey = y;
     squarex = x;
     rect(x, y, 52,52);
    } 
  }
}

void mouseReleased(){
  if(mouseX > squarex && mouseY > squarey && mouseX < (squarex + size) 
     && mouseY < (squarey + size) && yellow == true){
       fill(255,0,0);
     }
     rect(squarex, squarey, 52,52);
}


