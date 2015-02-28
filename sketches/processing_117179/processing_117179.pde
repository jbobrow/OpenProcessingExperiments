
void setup() {  //setup function called initially, only once
  int xpos=0;
  size(500, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  
Tira t1=new Tira(0);
t1.draw();
Tira t2=new Tira(40);
t2.draw();
Tira t3=new Tira(80);
t3.draw();
  Tira t4=new Tira(120);
t4.draw();
}

void draw() {  //draw function loops 

}

class Tira {
int hsize=40;
int[] sizes = {30,50,50,80};
int ypos=0;
color colorA = color(0,100,100);
color colorB = color(50,50,50);
color colorC = color(70,30,200);

color _color=0;

    Tira (int pypos) {
    ypos=pypos;
    int n=(int) random(3);
    if (n==0) _color=colorA;
    else if (n==1) _color=colorB;
    else _color=colorC;  
      
       
        }
    
    void draw(){
     fill(_color);
     xpos=sizes[(int) random(4)];
        for (int i=0;i<4;i++) {
         int xsize=sizes[(int) random(4)];
         rect(xpos,ypos,xsize,hsize);
         xpos+=xsize;
         if (_color.equals(colorA)) _color=colorB;
         else if (_color.equals(colorB)) _color=colorC;
         else if (_color.equals(colorC)) _color=colorA;
              fill(_color);
    
        }
    }
}
