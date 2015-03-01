
void setup(){
  size(600,400);
  background(0);
  rectMode(CENTER);
  smooth();
  noStroke();
  frameRate(30);
}


float count = 0;
float rotation = 0;
float resize = 10;  
float speed = 0.1;

void draw(){
  fill(0,40);
  rect(width/2,height/2,width, height);
  for(int count = 0; count < 50; count++){
    if(resize > 1){
      resize--;  
    }else{
      resize = 40;
    } 
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotation);
    float x = cos(count) * width/resize;
    float y = sin(count) * width/resize;
    fill(255,255,255);
    float size = map(x, 0, width/2, 0, 100);
    ellipse(x,y,size,size);
    popMatrix();
  
    rotation+=0.001;
    count+=speed;
        
  }
  
}



