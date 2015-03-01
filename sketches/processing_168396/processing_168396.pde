
void setup() { 
  size(700, 700);
  background(255);

}
void draw() {

//background fade effect
fill(255,5);
noStroke();
rect(0,0,width,height);

    
  for (int i = 0; i < 50; i += 2) {
  
    //compute past position
    float pa=pmouseX+i*3;
    float pb=pmouseY+sin(i+frameCount*0.1)*20;
    
    //compute current position
    float a=mouseX+i*3;
    float b=mouseY+sin(i+frameCount*0.1)*20;
    
    //draw line
    line(a,b,pa,pb);
 

    
    strokeWeight( noise(frameCount * 0.1 , 1000 , i*0.1 ) * 20 - 7  );
    stroke(
    noise(frameCount * 0.1 , 2000 , i*0.1 ) * 255,
    noise(frameCount * 0.1 , 3000 , i*0.1 ) * 255,
    noise(frameCount * 0.1 , 4000 , i*0.1 ) * 255
    
    ,255);
  }
}
