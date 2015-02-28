
int SCALE=500;

float corna = 52, cornb = 27;
float side = 6;

int  SLIDERCOUNT = 3;
int SLIDERWIDTH=10;

void draw(){
  background(128);
fill(255);
  stroke(255);
  for(int i = 0; i < SCALE; i++){
    for(int j = 0; j < SCALE; j++){
      float x = (corna + i) * side / 100;
      float y = (cornb + j) * side / 100;
      int c = round((x*x)+(y*y));

      if(c % 2 == 0 ){
        plot(i,j);  
      }   

    }

  }

  if(controlBrightness > 0){
    controlBrightness-= 10;
    showSlider("horiz",corna,0);
    showSlider("vert",cornb,1);
    showSlider("scale",side,2);

  }   
}


float controlBrightness = 255;
void mouseMoved(){
  controlBrightness = 255; 
}
void mousePressed(){
  controlBrightness = 255;
  updateSlider();
}
void mouseDragged(){
  controlBrightness = 255; 
  updateSlider();

}
void updateSlider(){
  if(mouseY < (width / SLIDERCOUNT)){
    corna = mouseX;
    return;
  }
  if(mouseY < 2*(width / SLIDERCOUNT)){
    cornb = mouseX;
    return;
  }
  side = mouseX;
  return;
}
void setup(){
  size(SCALE,SCALE);
  frameRate(30); 
  textFont(loadFont("Arial-Black-20.vlw"));
}



void plot(int x, int y){
  point(x,y);
//  rect((float)x*PIXSIZE,(float)y*PIXSIZE,1.0,1.0);
 }


void showSlider(String caption, float value, int position){
  float top = position * (height / SLIDERCOUNT);
  float bot = (position+1) * (height / SLIDERCOUNT);
  
  stroke(0,0,0,controlBrightness);
  line(0,bot,width,bot);
 noStroke();
     fill(0,0,0,controlBrightness/4);  
  rect(value-(SLIDERWIDTH/2),top,SLIDERWIDTH,(height/SLIDERCOUNT));
    fill(0,0,0,controlBrightness);  
  text(caption+": "+round(value),0,bot-2);
}

// Wallpaper, an example algorithm from A.K. Dewdney's "The New Turing Omnibus", a bit of a fractal. You can use the mouse to adjust the three input parameters
// http://kirk.is/2007/12/30/

