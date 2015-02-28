
public class Leaf {

  float x;
  float y;

  float leafSize = 0;
  float leafMax = 10;
  float growSpeed = 0.1;

  Leaf(float xp, float yp){
    x = xp;
    y = yp;
    registerDraw(this); //this causes it to be drawn once per frame
  };

  void draw(){

    if (leafSize < leafMax){
      leafSize += growSpeed;
    }

    else{
      y += leafSize;
    };

    //fill(125,255,0,50);
    image(leaf,x,y,leafSize, leafSize);
  };

};


