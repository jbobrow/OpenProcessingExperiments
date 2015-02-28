
int num = 50;

 
Walk[] myWalk = new Walk [num];
color[] Colores = new color[3];
 
void setup()
{
  
  size(500,500);
   background(255);
   Colores[0] = color(249,230,0,50);
  Colores[1] = color(255,0,255,50);
  Colores[2] = color(0,249,255,50);
 
noStroke();
  smooth();
    for(int w=0;w<myWalk.length;w++) {
    myWalk[w] = new Walk();
    }
}
    void draw(){
      
       
       for(int x=0; x < myWalk.length; x++) {
    myWalk[x].update();
    myWalk[x].draw();
  }
       
    }
       
       
      class Walk{
         
        
        float xpos= random (0,height);
      float ypos= random (0,height);
      float footSize= random (40,80);
        color colour =Colores[floor(random(0,3))];
         
 
      Walk (){
      }
       
    
       
  void update() {
     

xpos = xpos + random (-10,10);
ypos = ypos + random (-10,10);
    }
  
  void draw() {

    fill(colour);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,footSize,footSize);
  }
}


