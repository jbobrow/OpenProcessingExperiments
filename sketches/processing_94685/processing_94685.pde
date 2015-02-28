
PFont typotest1;
int x = 10;
int y = 10;


void setup() {
  background(255);
  size(200,100);
  typotest1 = loadFont("typotest1.vlw");
  fill(0);
  textFont(typotest1,48);
}

void draw() {
  Ecrire();
  keyPressed();
}
void Ecrire(){
  textFont(typotest1, 20);
  fill(random(255),random(100),random(255));
  if(keyPressed == true){
    text(key,x,y);
    if (x >= width){
      x = x - width;
      y = y + 5;
    }
    if(keyCode == DOWN){
      y= y + int(random(05));
    }
    if(keyCode == LEFT){
      x = x - int(random(50));
    }
    if(keyCode == RIGHT){
      x= x + int(random(10));
    }
    if(keyCode == UP){
      y = y - int(random(10));
    }
    
    x = x + int(random(10));
    
  }
     
      
  }
