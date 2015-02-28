
float a = -2.0;
float b = 1.6;
float c = -2.0;
float d = 0.7;

int image_size = 600;
float scale = image_size / 6;
int center = image_size / 2;

int iteration_num = 30000;

float x = 0;
float y = 0;
float x_next, y_next;

void setup(){
  size(image_size, image_size);
  background(256, 256, 256);
  frameRate(4);
}

void draw(){
  background(256, 256, 256);
  
  int i;
  
  if(a >= 0){
    a = -2.0;
  }
  
  for(i = 0; i < iteration_num; i++){
    x_next = sin(a * y) + c * cos(a * x);
    y_next = sin(b * x) + d * cos(b * y);
    x = x_next;
    y = y_next;
    
    point(center + x * scale, center - y * scale);
  }

  a = a + 0.01;  
}
