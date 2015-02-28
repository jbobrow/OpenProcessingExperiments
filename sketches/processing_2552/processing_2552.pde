
public class Bean {
  
  float x;
  float y;
  
  float beanSize = 0;
  float beanMax = 10;
  float fallSpeed = 0.1;
  
  Bean(float xp, float yp) {
    x = xp;
    y = yp;
    registerDraw(this);
  };
  
  void draw() {
    
    if (beanSize < beanMax) {
      //If the bean is smaller than its max size, fall
      beanSize += fallSpeed;
    }
    else {
      //If the bean is at its max size, a side the screen
      x += beanSize;
    };
    
    
    image(bean, x, y, beanSize, beanSize);
  };
  
};

