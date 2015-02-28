
//generating orbs
float[] xValues=new float[25];
float[] yValues=new float[25];

ArrayList <Orb> orbs;

void setup() {
  
  size(500,700);
  background(0);
  
   orbs=new ArrayList<Orb>();
  
  //fills lists of x and y values of orbs
   for(int i=0;i < xValues.length;i++)
  {
    xValues[i] = random(0,width);
    yValues[i] = random(0,height);}
 
 //fills orbs array   
 for(int i=0;i<xValues.length;i++) 
 {orbs.add(new Orb(xValues[i],yValues[i]));
 } 
}
  
  void draw() { for(int i=0;i<orbs.size();i++){
   Orb orb=orbs.get(i);
   orb.draw();
   orb.update();
 }  

for  (int i=0;i<orbs.size();i++) {
  Orb boo=orbs.get(i);
  if(boo.ypos>height){
    orbs.remove(i);
    orbs.add(new Orb(random(0,width),random(0,height/2) ) );}}
  }
    
    
void mouseClicked() {
//changes orb fill colors when orbs are clicked on
 for (int i=0;i<orbs.size();i++) {
  Orb boo=orbs.get(i);
  if (dist(mouseX,mouseY,boo.xpos,boo.ypos)<boo.radius) {
   boo.xpos+=random(-10,10);
   fill(random(0,225),random(0,255),random(0,255));
   }
   }
   }
   
   void mouseDragged() {
  //changes colors of lines around circles based on mouse movement
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY); 
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 5, 15);
  
  noStroke();
  fill(0, alpha);
  stroke(red, green, blue, 255);

//freezes circles when mouse is dragged through them
  for (int i=0;i<orbs.size();i++) {
  Orb boo=orbs.get(i);
  if (dist(mouseX,mouseY,boo.xpos,boo.ypos)<boo.radius) {
    boo.xpos+=mouseX;
    }
  } 
}
    
    
//orb class      
class Orb {
  float xpos;
  float ypos;
  int radius;
  int state;
  Orb(float x, float y) {
    xpos=x+random(-2.5,2.5);
    ypos=y+2;
    radius=30;
  }
  
  void draw() {
      ellipse(xpos,ypos,radius, radius);
  } 
  void update() {
    ypos+=2;
    }  
}
