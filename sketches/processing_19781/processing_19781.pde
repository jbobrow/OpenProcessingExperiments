
void setup (){
  size(400,400);
  smooth();
  frameRate(10);
}


  void draw(){
    background(0);
    for(int x = 10; x<width-10; x+=random(0,height/8)){
      for(float y = random(0,height/4); y<random(height*0.75,height); y+=random(0,height)){
      
    colorMode(HSB,100);
    fill(x-mouseX,y+mouseY,90);
    stroke(x+mouseX,y-mouseY,100);
    strokeWeight(random(1,6));
     
curve(y,random(0,height),10,x,390,x,height-y,random(0,height));
curve(y,random(0,height),x,10,x,390,height-y,random(0,height));
 
 if(mousePressed){
   stroke(random(0,100),100,90);
    fill(random(0,100),100,90);
    ellipse(x,y,random(height/100,height/6),random(height/100,height/6));
 }
    
  }
      }
  
  }
  void mouseDragged(){
    
     for(int x = 10; x<width-10; x+=random(0,height/8)){
      for(float y = random(0,height/4); y<random(height*0.75,height); y+=random(0,height)){
      
   stroke(random(0,100),100,90);
    fill(random(0,100),100,90);
    strokeWeight(random(1,6));
   point(mouseX,mouseY);
    
  }
     }
  }
  
 

