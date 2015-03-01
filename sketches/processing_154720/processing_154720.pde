
void setup(){
  size(600,400);
  background(0);
  rectMode(CENTER);
  smooth();
  frameRate(20);
}


float count = 0;
float rotation = 0;
float resize = 10;  

void draw(){
  
  fill(0,40);
  noStroke();
  rect(width/2,height/2,width, height);

  for(int count = 0; count < 300; count++){
    if(resize > 1){
      resize--;  
    }else{
      resize = 10;
    } 
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotation);
    float x = cos(count) * width/resize +20;
    float y = sin(count) * height/resize +20;
    noStroke();
    fill(0,random(200),100+random(155));
    ellipse(x,y,abs(x/6),abs(x/6));
    popMatrix();
  
    rotation+=0.02*random(abs(x));
    count+=0.01;
  }
}
