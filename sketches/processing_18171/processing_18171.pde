
class Item{

  boolean onMouse;
  int num;
  
  float destX;
  float destY;
  float x;
  float y;
  float destW;
  float destH;
  float w;
  float h;
  
  Item(int num){
    x = 50 * (num % 6) ;
    y = 50 * (num / 6);
    w = 40;
    h = 30;
    this.num = num;
  }
  
  void setPos(int destX,int destY)
  {
    this.destX = destX;
    this.destY = destY;
  }
  
  void setSize(int destW, int destH)
  {
    this.destW = destW;
    this.destH = destH;
  }
  
  boolean clicked(){
  
    if( ((x - w/2) < mouseX && mouseX < (x + w/2)) && ( (y - h/2) < mouseY && mouseY < (y + h/2)))
    {
      return true;
    }
    else
    {
      return false;
    }
    
  }
  
  void update(){
    x = x + (destX - x)/8;
    y = y + (destY - y)/8;
    
    w = w + (destW - w)/8;
    h = h + (destH - h)/8;
  }
  
  void draw(){
    //imageMode(CENTER);
   colorMode(HSB, 255);
    noStroke();
    fill(255./12 * num,255,255);
    ellipse(x,y,w,w);
  }

}

class RotateMenu {

  Item[] items;
  int clickedNum = -1;
  int maxImageNum = 12;

  float angle = 1;
  float hankei = height/2 - 50;

  RotateMenu() {

    items = new Item[12];

    for(int i = 0 ; i < maxImageNum ; i++)
    {
      items[i] = new Item(i);
    } 
  }

  void clicked() {

    int i = 0;


    while( i < maxImageNum && items[i].clicked() == false)
    {
      i++;
    };

    if( i >= maxImageNum)
      clickedNum = -1;
    else
      clickedNum = i;
   }

  void update(){
    
    angle = (angle + 0.003) % 360;
   
    for(int i = 0 ; i < items.length ; i++){
      int x;
      int y;
      
      x = int(width/2 + hankei * cos(2*PI / maxImageNum * i + angle));
      y = int(height/2 + hankei * sin(2*PI / maxImageNum * i + angle));
      
      if(i != clickedNum)
      {
        items[i].setPos(x,y);
        items[i].setSize(40,40);
      }
      else
      {
        items[i].setPos(width/2,height/2);
        items[i].setSize(200,150);
      }
    }

    for(int i = 0 ; i < items.length ;i++){
      items[i].update();
    }    
  }


  void draw() {


    for(int i = 0 ; i < items.length ; i++){
      items[i].draw();
    }

  }
}

RotateMenu rotateMenu;

void setup(){

  size(320,320);
  smooth();
  rotateMenu = new RotateMenu();
}

void update(){
  rotateMenu.update();
}

void draw(){
  update();

  background(#000000);
  rotateMenu.draw();
}

void mouseClicked(){
  
  rotateMenu.clicked();
}
                                                
