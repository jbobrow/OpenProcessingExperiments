
int num = 6;

 
Tang[] myTang = new Tang [num];
color[] Colores = new color[3];
 
void setup()
{
  
  size(300,300);
   Colores[0] = color(255,0,0,60);
  Colores[1] = color(0,255,0,60);
  Colores[2] = color(0,0,255,60);
 
  noStroke();
  smooth();
    for(int t=0;t<myTang.length;t++) {
    myTang[t] = new Tang();
    }
}
    void draw(){
      background(255);
       
       for(int x=0; x < myTang.length; x++) {
    myTang[x].update();
    myTang[x].draw();
  }
       
    }
       
       
      class Tang{
         
        float Siz = random(100);
        float xpos= random (10,height-10);
      float ypos= random (10,height-10);
        color colour =Colores[floor(random(0,3))];
         
 
      Tang (){
      }
       
    
       
  void update() {
     
Siz++;
if(Siz > width) {
Siz = 0;
xpos = random(10,width);
ypos = random(10,height);
    }
  }
  void draw() {
    fill(colour);
    rectMode(CENTER);
    rect(xpos,ypos,Siz-100,Siz);
  }
}


