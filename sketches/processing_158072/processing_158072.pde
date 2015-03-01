
float px =0;
void setup() {
  size(800, 800);
}

void draw() {
  px++;
  ellipse(px, 400, 10, 10);
  if(px<width/2){
    fill(255,0,0);  
  }else{
    fill(0,255,0);   
  }
  ellipse(400,px,10,10);
  if(px<height/2){
    fill(190,0,190);
  }else{
    fill(0,100,100); }
}
