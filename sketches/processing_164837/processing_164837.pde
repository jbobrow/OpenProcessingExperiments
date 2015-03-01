
int inc = 0;
 
void setup(){
   frameRate(60);
   background(0);
   size(350, 350, P2D);
}
 
void draw(){
  inc++;
 
  PImage img = get();
  image(img, 0, -1);
  //filter(BLUR, 1);
   
  //fill(0, 1);
  //noStroke();
  //rect(0, 0, width, height);
   
  color green = color(150, 255, 0);
  color blue = color(0, 200, 255);
  color darkblue = color(0, 100, 175);
  color white = color(255, 255, 255);
  color yellow = color(255, 255, 100);
  for(int x = 0; x < width; x++){
    float h = noise(x * 0.01, inc * 0.01) * 100;
    if(h < 25){
      set(x, round(height / 2 + h),  white);
    }else if(h < 50){
      set(x, round(height / 2 + h),  green);
    }else if(h < 51){
      set(x, round(height / 2 + h),  yellow);
    }else if(h < 60){
      set(x, round(height / 2 + h),  blue);
    }else{
       set(x, round(height / 2 + h),  darkblue);
    }
    //float h = noise(x * 0.01, inc * 0.01) * 255;
    //color rancol = color(0, 255-h, 255);
    //set(x, height / 2,  rancol);
  }
   
}

