

float r;
void setup(){
  size(500,600); 
 noStroke();
} 

void draw(){
  fill(100,100);
  background(0xFFFFFF);
  float a = (mouseX / (float) width) * 90;
  smooth();
  rect(0,0,width,height);
  stroke(599);
  translate(width/2, height/2);
  noStroke();
 rotate(r);
  //float(mouseX)/float(width); est un nombre entre 0 et 1
  float angle = 360* float(mouseX)/float(width);
  for(int i=20;i<100;i++){
    fill(i/2,10,20);
    rotate(radians(360/90)*i);    
    rect(i*1.5,0,100-i,100-i);
    fill(i);
    ellipse(i*1.5,0,50-i,50-i);
  }
  r=r+0.700;

}

