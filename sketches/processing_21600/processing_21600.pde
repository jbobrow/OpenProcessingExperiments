
int num = 6;

Rect[] Rects = new Rect[num];
color[] Colors = new color[3];

void setup()
{
 
  size(300,300);
   Colors[0] = color(255,0,0,50);
  Colors[1] = color(0,255,0,50);
  Colors[2] = color(0,0,255,50);
  noStroke();
  smooth();
    for(int x=0;x<Rects.length;x++) {
    Rects[x] = new Rect();
    }
}
    void draw(){
      background(255);
      
       for(int i=0; i < Rects.length; i++) {
    Rects[i].update();
    Rects[i].draw();
  }
      
    }
      
      
      class Rect{
        
        float Size = random(100);
        float xpos= random (20,height-20);
      float ypos= random (20,height-20);
        color acolor =Colors[floor(random(0,3))];
        

      Rect(){
      }
      
   
      
  void update() {
    
Size++;
if(Size > width) { 
Size = 0; 
xpos = random(20,width-20);
ypos = random(20,height-20); 
    }
  }
  void draw() {
    fill(acolor);
    rect(xpos,ypos,Size,Size);
  }
}

