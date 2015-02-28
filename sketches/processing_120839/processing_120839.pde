
void setup(){
  size(600,600);
  background(100);
  smooth();
  strokeCap(SQUARE);
}

  void draw(){

    for(int s=20; s<600; s+=30){
      
     strokeWeight(10);
      stroke(mouseX,100,mouseY+20);
      line(s,220,s,380);
    }
    
    for(int x=0; x<600; x+=5){
      
      strokeWeight(1);
      stroke(mouseX-30,153,mouseY+100);
      line(x,10,x,200);
      
    }   
      
    for(int t=15; t<600; t+=70){
      strokeWeight(30);
      stroke(mouseX-60,133,mouseX+120);
      line(t,400,t,580);
    }
  }
  
  void keyPressed(){
    if (keyPressed== true){
      saveFrame("3line###.tif");
    }
  }
      


