
class Spot{
   float x, y;       //the x and y coordinate
   float diameter;  //diameter of the   circle
   float speed; //distance moved each frame
   int direction = 1; //direction of motion 1 is down, -1 is up
   
Spot(float xpos, float ypos, float diam, float speedy){//constructor
   x= xpos;        //assign
   y= ypos;        //assign
   diameter=diam;  //assign
   speed=speedy;
   
   };
void move(){
   y +=(speed * direction);
   // x +=(speed * direction);
   if((y>(height - diameter/2))|| (y<diameter/2)){
   direction *= -1;
   };
   
};
   
void display(){
   ellipse(x,y,diameter,diameter);
   };
};

