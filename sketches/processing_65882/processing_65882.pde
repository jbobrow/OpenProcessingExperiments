
public class Brick extends MyObj{
  PImage myTexture;
  
  public Brick(int w,int h, float x, float y, String path, String name){
    this.w=w;
    this.name=name;
    this.h=h;
    this.x=x;
    absX=x;
    this.y=y;
    myTexture = loadImage(path);
  }
  
  public void increment(){
    drawMe();
  }
  
  public void drawMe(){
    image(myTexture, x-distance, y, w, h);
  }
  
  
}

