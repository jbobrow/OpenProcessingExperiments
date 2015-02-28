
class Donut{

float xDonut, yDonut;
PImage img;
int typeDonut;
float speed;


  Donut(float x, float y, int type ){
    
    xDonut = x ;
    yDonut = y;
    typeDonut = type;
    speed = random (1,4);
    
    if (typeDonut == 0){
    img = loadImage("donut1.png"); 
    
    
    
    
    }else { 
      
      img = loadImage("donut2.png");
    
    
    }
    
   
  }
  
  void show() {
    image (img, xDonut, yDonut);
    yDonut += speed;     
    


    
  }
  
  
  
}


