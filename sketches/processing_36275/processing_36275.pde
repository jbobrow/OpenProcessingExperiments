
  private int value = 0;
  int i = 204;;;;
    int j = 102;;
    int k=0;

  public void setup(){
    size(700,400);
    smooth ();
    background(255,204,0);
  }
  
  
  public void draw() {
    frameRate(30);
    if(i==255)
    i=0;
    if(j==255)
    j=0;
    if(k==255)
    k=0;
    if(mousePressed==true){
      line(20, 20, mouseX, mouseY);
      line(20, 380, mouseX, mouseY);
      line(680, 20, mouseX, mouseY);
      line(680, 380, mouseX, mouseY);
      stroke(i, j, k);
      j++;i++;k++;
    }
 
  }
  
  
  public void mousePressed() {

  }
  



