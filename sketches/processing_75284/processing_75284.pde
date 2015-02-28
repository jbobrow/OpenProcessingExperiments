
int lineColor;
float a = 2;

void setup(){
  size(800,800);
  background(34,567,368);
  smooth();
}

void draw(){
  for(int i = 0; i < 100; i ++){
    fill (random(255));
    ellipse(i*25,100,65,10);
    float a;
  
    ellipse(width/2,height/2,random(300),300);
    rotate(radians(45));
    stroke((random(100)),(random(40)),100); 
   line(mouseX+100+(random(100)), mouseY+100+(random(100)), pmouseX, pmouseY);

  }
 line(mouseX, mouseY, pmouseX, pmouseY);

}
