
public class element
{
  
  public float x;
  public float y;
  public float z;
  public float r;
  public float P;
  public float rotX;
  public int myColor;
  
  
  //constructor
  element(float ix, float iy, float iz, float ir, float iP, float irotX, int imyColor){
    
    x=ix;
    y=iy;
    z=iz;
    r=ir;
    P=iP;
    rotX = irotX;
    myColor = imyColor;
    
  
  

    //fill(200);
    rotateZ(P);
    translate(r,0,0);
    rotateX(rotX);
    fill(myColor);
    box(x,y,z);
    
    rotateX(-rotX);
    translate(-r,0,0);
    rotateZ(-P);

  }




  public void display() {


    pushMatrix();

    //translate(xpos,ypos);

    fill(200);

    //ellipse(0,0,10,10);

    popMatrix();

    noStroke();
  }
  
}

