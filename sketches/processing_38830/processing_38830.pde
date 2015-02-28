
circle[] circle; 
int objectnumber = 100;
float spring = 0.05;

void setup(){
  size(640, 480);
  frameRate(30);
  circle = new circle[objectnumber];
 
  for (int i= 0; i < objectnumber; i++){
    circle[i] = new circle(random(20, 620),random(20, 460),100,random(0.1, 3.0),random(0.1, 3.0),random(2,9),random(2,9), i);
  }        
}

void draw(){
  
  background(227,238,252);
  for (int i = 0; i < objectnumber; i++){
    //circle[i].collide();
    circle[i].move();
    circle[i].display();
  }
} 

class circle{
  float xpos;
  float ypos;
  int r_color;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  int ID;
  int colided = 0;
  
  circle(float TEMPxpos,float TEMPypos,int r_color, float TEMPxspeed, float TEMPyspeed, float TEMPxdirection, float TEMPydirection, int tempID){
      
  ID = tempID;
  xpos = TEMPxpos;
  ypos = TEMPypos;
  xspeed = TEMPxspeed;
  yspeed = TEMPyspeed;
  xdirection = TEMPxdirection;  // Left or Right
  ydirection = TEMPydirection; // Top to Bottom
  
  }
  void display(){
    stroke(96, 159, 245);
    fill (255, 255, 255);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,50,50);
    }

  /*
  void collide() {
    for (int i = 0; i < objectnumber; i++){  
    if(i!=ID){
      float dangerzoneX1 = circle[i].xpos + 25; 
       float dangerzoneX2 = circle[i].xpos -25;   
       float dangerzoneY1 = circle[i].ypos +25; 
       float dangerzoneY2 = circle[i].ypos -25; 
       
       
      if(xpos <= dangerzoneX1 && colided == 0 || xpos >= dangerzoneX2 && colided == 0){
        xdirection *= -1;
         colided = 1;
      }else if (xpos <= dangerzoneX1 || xpos >= dangerzoneX2){
      }else{
        colided = 0;
      }
      
      if(ypos <= dangerzoneY1 && colided == 0 || ypos >= dangerzoneY2 && colided == 0){
                ydirection *= -1;
         colided = 1;
      }else if (ypos <= dangerzoneY1 || ypos >= dangerzoneY2){
      }else{
        colided = 0;
      }

      }


}
}
*/
  void move(){
    
    for (int i = 0; i < objectnumber; i++){  
    if(i!=ID){
      float dangerzoneX1 = circle[i].xpos + 25; 
       float dangerzoneX2 = circle[i].xpos -25;   
       float dangerzoneY1 = circle[i].ypos +25; 
       float dangerzoneY2 = circle[i].ypos -25; 
       
       
      if(xpos <= dangerzoneX1 && colided == 0 || xpos >= dangerzoneX2 && colided == 0){
        xdirection *= -1;
         colided = 1;
      }else if (xpos <= dangerzoneX1 || xpos >= dangerzoneX2){
      }else{
        colided = 0;
      }
      
      if(ypos <= dangerzoneY1 && colided == 0 || ypos >= dangerzoneY2 && colided == 0){
                ydirection *= -1;
         colided = 1;
      }else if (ypos <= dangerzoneY1 || ypos >= dangerzoneY2){
      }else{
        colided = 0;
      }

      }


}
    
    xpos = xpos + ( xspeed * xdirection);
    ypos = ypos + ( yspeed * ydirection);
   
 
    if (xpos > width-25 || xpos < 0) {
      xdirection *= -1;
      
    }
    if (ypos > height-25 || ypos < 0) {
      ydirection *= -1;
    }
  }


}




