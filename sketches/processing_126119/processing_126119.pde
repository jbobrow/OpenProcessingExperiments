
//declare bean

Bean myBean; 
Bean myBean2;

void setup(){
  size(600, 600);
  background(255);
  strokeWeight(random(0.8,1.5));
  stroke(0,50);
  frameRate(20);
  }
  

void draw() {
  //background(255);
  //for (int f = frameCount; f < 2; f += 1) {
    //for (int i = 1; i <= 5; i++) {
      
      myBean = new Bean();
      myBean.display();
      myBean2 = new Bean();
      myBean2.display();
      myBean2.xpos = mouseX;
      myBean2.ypos = mouseY;
      line(myBean.xpos,myBean.ypos, myBean2.xpos, myBean2.ypos);
      
    //}
 // }
 }


class Bean {
  float xpos;
  float ypos;
  float beanw;
  float beanh;
  color glow;

  Bean() {
    glow = color(random(100),random(200));
    xpos = random(width);
    ypos = random(height);
    beanw = 50;
    beanh = 50;
  }
  
  void display() {
    smooth(12);
    fill (glow);
    ellipse(xpos, ypos, beanw, beanh);
  }
}




