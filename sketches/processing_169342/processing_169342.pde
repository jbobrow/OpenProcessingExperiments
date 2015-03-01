
int dataSize;
float[] data;
int numPositive;
int numZeros;


void setup(){
  size(600, 400);
  background(255);
  textSize(15);
  fill(0);
  
  numPositive = 0;
  numZeros = 0;
  dataSize = int(random(10, 10000));
  data = new float[dataSize];

  for(int i = 0; i < dataSize; i++){
    data[i] = random(-10, 10);
    if(data[i] > 0){
      numPositive++;
    }else if(data[i] == 0){
      numZeros++;
    }
  }

  
  for(int i = 0; i < 10; i++){
    text("Number " + i + " = " + data[i], 20, 20 + 20 * i);
    if(data[i] > 0){
      text("The entry number " + i + " is positive.", 300, 20 + 20 * i);
    }else if(data[i] == 0){
      text("The entry number " + i + " is equal to 0.", 300, 20 + 20 * i);
    }else{
      text("The entry number " + i + " is negative.", 300, 20 + 20 * i);
    }
  }
  

  text("The total number of entries is: " + dataSize + "." , 20, height - 100);
  text("The number of positive entries is: " + numPositive +".", 20, height - 70);
  text("Positive numbers account for " + float(numPositive)/dataSize * 100 + "% of all of the numbers.", 20, height - 40);
  text("Zero showed up " + numZeros + " times.", 20, height - 10);
}

void draw(){
}

void mouseClicked(){
  setup();
}


