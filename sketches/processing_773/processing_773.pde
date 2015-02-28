
/*
By Sajid Saiyed
http://www.ssdesigninteractive.com/g2
http://www.ssdesigninteractive.com/blog
Do let me know if you happen to imrovise this code
*/
class Attractors{
  //
  int x;
  int y;
  int nMin;
  int nMax;
  int intVal;
  
  //  
  Attractors(int numMin, int numMax, int interval){
    nMin = numMin;
    nMax = numMax;
    x = (int) random(nMin, nMax);
    y = (int) random(nMin, nMax);
    
    intVal = interval;
    println("ATT: "+intVal);
  }
  
  //
  public void render(){
    // Uncomment the below line to view Attractors
    //ellipse(mouseX+x, mouseY+y, 5, 5);
  }
  
  // Update method
  public void update(){
    
    intVal++;
    if(intVal == 30){
      x = (int) random(nMin, nMax);
      y = (int) random(nMin, nMax);
      intVal = 0;
    }
  }
  
  /*
  Reposition Method (If you want attractors to change positions
  automatically, then do something here.)
  */
  public void reposition(){
  }
  
  /*
  Move Method (If you want attractors to Move
  automatically, then do something here.)
  */
  public void move(){
  }
}

