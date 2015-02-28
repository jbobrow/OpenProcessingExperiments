
//  Setiing up
void setup(){
  size(720,720);
  colorMode(HSB,width,height,100);
  background(random(width),random(height),random(100)); 
}
void draw(){
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);
    int a =(int)map(mouseY+100,0,height,2,10);
    int radius = mouseX-width/2;
    int s = second();
    float angle =TWO_PI/a;
    strokeWeight(s+4);
    stroke(random(width),random(height),random(100));
    beginShape();
    for(int i=0;i<=a;i++)
    {
      float x=0+cos(angle*i)*radius;
       float y=0+sin(angle*i)*radius;
      vertex(x,y);
    }
    endShape();
    rect(mouseX,mouseY,mouseX+20,mouseY+30);
    popMatrix();
  }
}
     void keyPressed() {
      if(key=='s'||key=='S')
      saveFrame("InteractiveDrawing2.png");
     }
  
  



