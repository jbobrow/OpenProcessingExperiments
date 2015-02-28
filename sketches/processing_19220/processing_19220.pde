
public class dal {

  int xi;  //input points
  int yi;
  int xo;  //output points
  int yo;
  int dalnumber;
  int newdalpoint1;  //new points to branch
  int newdalpoint2;
  float c1x;  //control points
  float c1y;
  float c2x;
  float c2y;
  boolean branch1used=false;
  boolean branch2used=false;
  int[] newdals = new int[4];

  int[] xp = new int[60];  //branch point coordinates
  int[] yp = new int[60];


  public dal(int Xi,int Yi, int Xo, int Yo, int Dalnumber){
    xi=Xi;
    yi=Yi;
    xo=Xo;
    yo=Yo;
    dalnumber=Dalnumber;
    branch1used=false;
    branch2used=false;
    newdalpoint1=int(random(3,20));
    newdalpoint2=int(random(20,45));

    c1x=(xo-xi)/random(1,10)+xi;  //set control points
    c1y=(yo-yi)*random(-0.2,1.2)+yi;
    c2x=xo-(xo-xi)/random(1,10);
    c2y=(yo-yi)*random(-0.2,1.2)+yi;

    int steps=60;              //set branch points
    for (int i = 0; i < steps; i++) { 
      float t = i / float(steps); 
      xp[i] = int(bezierPoint(xi,c1x, c2x, xo, t)); 
      yp[i] = int(bezierPoint(yi, c1y, c2y, yo, t)); 
      //ellipse(xp[i],yp[i], 10,10);
    }

    newdals[0]=int(xp[newdalpoint1]);
    newdals[1]=int(yp[newdalpoint1]);
    newdals[2]=int(xp[newdalpoint2]);
    newdals[3]=int(yp[newdalpoint2]);

  }

  void display(){
    color c = color(0, 0, 0, (totaldalnumber-dalnumber)*255/totaldalnumber); //transparent color
    stroke(c);
    noFill();
    bezier(xi, yi, c1x ,c1y ,  c2x, c2y,  xo, yo);
    //ellipse(c1x,c1y, 10,10);
    //ellipse(c2x,c2y, 10,10);
  }

  int[] getBranchPoints(){
    return newdals;
  }

  void displayBranches(){
    ellipse(newdals[0],newdals[1],10,10);
    ellipse(newdals[2],newdals[3],5,5);
  }
}

