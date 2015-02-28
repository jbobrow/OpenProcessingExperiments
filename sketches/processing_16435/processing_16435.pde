
boolean flag = true;
int counter = 0;

void setup(){ 
}

void draw(){  
  if(flag) {
    bgRed();
  } else {
    bgGreed();
  }
 
  counter++;
  if(counter > 30) {
    flag = !flag;
    counter = 0;
  }

}

void bgRed() {
  background(255, 0, 0);
}

void bgGreed() {
  background(0, 255, 0);
}
