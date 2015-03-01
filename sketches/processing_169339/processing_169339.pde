

float[] data;


void setup(){
  size(600, 300);
  background(255);
  textSize(15);
  fill(0);
  data = new float[10];
  for(int i = 0; i < 10; i++){
    data[i] = random(-1, 1);
    text("Number " + i + " = " + data[i], 20, 20 + 20 * i);
    if(data[i] > 0){
      text("The entry number " + i + " is positive.", 300, 20 + 20 * i);
    }else if(data[i] == 0){
      text("The entry number " + i + " is equal to 0.", 300, 20 + 20 * i);
    }else{
      text("The entry number " + i + " is negative.", 300, 20 + 20 * i);
    }
  }
}


