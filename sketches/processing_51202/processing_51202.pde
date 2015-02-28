
int value = 0;

void setup(){
size(600,600);

background(value);
}

void draw() {

for(int value=0;value<255;value+=1){
  fill(value,100,100);

}


  for(int i=0;i<250;i+=5){
    colorMode(HSB, 280,100, 100);
   fill(value,200,100);
  ellipse(i+100,i+100,i+200,i+200);  
  
  }

}

void mouseMoved() {
  value = value + 5;
  if (value < 360) {
    value ++;
  }
else{
value=0;
}

}


