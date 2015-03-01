

char letter;
float x, y;
float m;

void setup() {
  size(700, 700); 
 
}

void keyReleased(){
  letter=key;
}


void draw(){
  background(0);
    
  m=random(30,100);
  
  fill(random(255),50,255,50);
  noStroke();
  
  for (int i=0;i<=7;i++){
    x= width/m  +10*i*i;
    y= height/2 +20*i-m;
  textSize(random(50,200));
      
  text(letter,x,y);
  }
  
}


