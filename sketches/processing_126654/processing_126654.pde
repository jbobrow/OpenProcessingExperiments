
float x = 0,a = 0, y = 0;

void setup(){
  
  size(600,400);
  background(20);  
  colorMode(HSB, height);
  noFill();
  frameRate(300);
}

void draw(){
    translate(width/2,height/2);
    rotate(a/100);
    y = map(2 * cos(a*1.5)*sin(2.3)*sin(a*0.3)*cos(a*PI),-1, 1, 0,30);
    x = map(sin(a*3/15), -1, 1, 0, width);
    //float co = map(y , height/2 , height/2 + 30, 0.1, 0.9);
    
    
    stroke(x,height-100,height);
    ellipse(x,y, 10, 10);
    a+= 0.03;
    
  


}
