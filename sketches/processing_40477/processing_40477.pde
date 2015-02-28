
int value1=250;
int value2=500;
int value3=255;
int value4=5;
int value0=0;


void setup() {
size(500,500);
background(255);
}

void draw() {
  point(value1,value1);

  line(value2,value2,value1,value1);
  line(value0,value2,value1,value1);
  line(value1,value1,value1,value0);
  
  value1=value1+1;
  value2=value2-2;
  value4=value2+value1;
}

