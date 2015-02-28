
// Advanced Tree Generator by James Noeckel 
// From http://www.openprocessing.org/visuals/?visualID=8941
// Use cursor keys to control tree and wheel to change itterations

float curlx = 0;
float curly = 0;
float f = sqrt(2)/2.;
float deley = 10;
float growth = 0;
float growthTarget = 0;
float weight = 15; // strokeWeight
int count;

int itter = 15;

float x=21;
float y=42;


    
void setup()
{
  size(300,300);
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }});
}

void draw()
{
  background(255);

 // curlx += (radians(360./height*mouseX)-curlx)/deley;
 // curly += (radians(360./height*mouseY)-curly)/deley;
  
  curlx += (radians(360./height*x)-curlx)/deley;
  curly += (radians(360./height*y)-curly)/deley;
  
  translate(width/2,height/3*2);
  line(0,0,0,height/2);
  
  
  
  //   branch(height/4.,17);
  branch(height/4.,itter,weight);  // call interation loop
  growth += (growthTarget/10-growth+1.)/deley;
}
  
void mouseWheel(int delta)
{
  //  growthTarget += delta;
  itter += delta;
 // println("x = "+ str(x) + "y = " + str(y) + "growthTarget = " + str(growthTarget));
}
  
void branch(float len, int num, float weight){
  
  strokeWeight(weight);
  stroke(255,255,0);
  len *= f;
  num -= 1;
  if((len > 1) && (num > 0))
  {
    
    
    pushMatrix();
    stroke(255,255,0);
    rotate(curlx);
    line(0,0,0,-len);
    translate(0,-len);
    branch(len,num,weight);
    popMatrix();
    len *= growth;
    
    pushMatrix();
    stroke(255,0,0);
    rotate(curlx-curly);
    line(0,0,0,-len);
    translate(0,-len);
    branch(len,num,weight);  
    popMatrix();
  }
  
} 

void mousePressed(){
  
   count ++;
   // save("Tree6_x" + str(x)+ "_y_"+ str(x)+"iter_"+str(itter));
   // println("Tree6_x" + str(x)+ "_y_"+ str(x)+"_iter_"+str(itter));
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
    //  println("x = "+ str(x) + "y = " + str(y) + "growthTarget = " + str(growthTarget));
      x ++ ;
    } else if (keyCode == DOWN) {
    //  println("x = "+ str(x) + "y = " + str(y) + "growthTarget = " + str(growthTarget));
      x --;
    } 
    else if (keyCode == LEFT) {
     // println("x = "+ str(x) + "y = " + str(y) + "growthTarget = " + str(growthTarget));
      y ++;
    } 
    
    else if (keyCode == RIGHT) {
     // println("x = "+ str(x) + "y = " + str(y) + "growthTarget = " + str(growthTarget));
      y --;
    } 
  }

}


