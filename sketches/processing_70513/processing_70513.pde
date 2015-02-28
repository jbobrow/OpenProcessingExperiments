
int deg = 0;

void setup(){
 size(500,500);
 background(0,0,0);
 smooth();
 frameRate(120);
} 

void draw(){
  background(0,0,0);
  noStroke();
  fill(255,255,255);
  for(int i=50; i<height-40; i+=40){
    for(int j = 50; j<width-40; j+=40){
      arc(j, i, 30, 30, radians(deg+((i+j)/2)), radians(deg+180+((i+j)/2)));
    }  
  }
  
  deg+=3;
  
}
