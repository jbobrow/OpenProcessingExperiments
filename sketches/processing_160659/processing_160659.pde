
Light[] lights = new Light[8];
int decimal = 0;
int binary = 0;
PFont f;

void setup(){
  size(600,300);
  noStroke();
  f = createFont("Arial",48,true);
  for(int i = 0; i < lights.length; i++){
    lights[i] = new Light(i);
  }
}

void draw(){
  background(0);
  for(int i = 0; i < lights.length; i++){
    lights[i].display();
  }
  fill(255);
  textFont(f,48);
  textAlign(RIGHT);
  text(nf(binary,8), width/9*8, 200);
  text(decimal, width/9*8, 250);
  textAlign(LEFT);
  text("Decimal:", width/9, 250);
  text("Binary:", width/9, 200);
  textFont(f,16);
  fill(128);
  text("(Click a light to toggle on/off)", width/9, 30);
}

void keyReleased(){
  decimal = 0;
  binary = 0;
  for(int i = 0; i < lights.length; i++){
    lights[i].updateKey();
    decimal += lights[i].value;  
    binary += lights[i].digit;
  }
}

void mouseReleased(){
  decimal = 0;
  binary = 0;
  for(int i = 0; i < lights.length; i++){
    lights[i].updateMouse();
    decimal += lights[i].value;  
    binary += lights[i].digit;
  }
}
  
  
class Light {
  int pos;
  color colour = (56);
  int value = 0;
  int digit = 0;
  
  Light(int p_){
    pos = p_ + 1;
  }
  
  void display(){
    fill(colour);
    ellipse(width/9 * pos, 80, 50, 50);
 
  }
  
  void updateKey(){
    if(key == pos + 48){
      switch(colour){
        case (56):
          colour = (255);
          value = int(pow(2, 8-pos));
          digit = int(pow(10, 8-pos));
          break;
        case (255):
          colour = (56);
          value = 0;
          digit = 0;
          break;
      }
    }        
  }
  
  void updateMouse(){
    if(overCircle(width/9 * pos, 80, 50)){
      switch(colour){
        case (56):
          colour = (255);
          value = int(pow(2, 8-pos));
          digit = int(pow(10, 8-pos));
          break;
        case (255):
          colour = (56);
          value = 0;
          digit = 0;
          break;
      }
    }        
  }
  
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


