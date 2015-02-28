

float[] data = new float[30];

int counter = 1;

void setup(){
  size(640,640);
  for(int i = 0; i < data.length; i++){
    data[i] = random(1,100);
  }
}
void draw(){
  if(counter < data.length){
    background(255);
    rectMode(CORNERS);
    float k;
    k = data[ counter ];
    int i;
    for(i = counter - 1; (i >= 0) && (data[ i ] < k); i--){
      data[i+1] =data[i];
    }
    data[i+1] = k;
    background(255);
      for(int h = 0; h < data.length; h++){
        if(h == i+1){
          fill(255,0,0);
        }else{
          fill(0,0,255);
        }
        rect(h*20+5,0,h*20+20,640-(data[h]/100.0)*640);
      }
      for(int a = 0; a < 214700000; a++);
  }else{
    noLoop();
  }
  counter++;
}
float[] data = new float[30];
int counter = data.length;

void setup(){
  size(640,640);
  for(int i = 0; i < data.length; i++){
    data[i] = random(1,100);
  }
}
void draw(){
  background(255);
  rectMode(CORNERS);
  if(counter > 0){
    for(int i = 0; i < counter-1; i++){
      if(data[i]>data[i+1]){
        float temp = data[i];
        data[i] = data[i+1];
        data[i+1] = temp;
      }
      background(255);
      fill(0,0,255);
      for(int j = 0; j < data.length; j++){
        rect(j*20+5,0,j*20+20,640-(data[j]/100.0)*640);
      }
      for(int a = 0; a < 21470000; a++);
    }

  }else{
    background(255);
    fill(0,0,255);
    for(int j = 0; j < data.length; j++){
      rect(j*20+5,0,j*20+20,640-(data[j]/100.0)*640);
    }
  }
  counter--;
}


