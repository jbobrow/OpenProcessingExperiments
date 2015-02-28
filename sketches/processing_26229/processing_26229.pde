
class Flower{
 int x ;
  int y ;
  int speed;
  
  Flower () { //Face (int s){
    x = int (random(0,width));
    y =int (random(0,height));
    speed = 1; 
  }

void move (){
 x +=speed; 
 if (x > width) {
      speed = -1;
 } 
else if (x< 0 ) {
     speed = 1; 
    }
  }


void display() {
 
   stroke(0);//head
   fill(127,150,150,20);
   ellipse(x,y,40,40);//face
    
   fill(300,260,0,180);
   ellipse(x-38,y-5,40,40);
    
   fill(300,260,0,130);
   ellipse(x-23,y-30,40,40);
    
   fill(280,220,0,120);
   ellipse(x+8,y-32,36,36);
    
   fill(280,180,0,100);
   ellipse(x+28,y-15,26,26);
    
   fill(280,180,0,70);
   ellipse(x+29,y+7,22,22);
    
   fill(300,260,0,130);
   ellipse(x-25,y+25,40,40);
    
   fill(280,180,0,100);
   ellipse(x+4,y+32,26,26);
    
   fill(280,180,0,70);
   ellipse(x+21,y+23,21,21);
    
   ellipse(x+5,y-5,10,10);//eye
    
   fill(0);
   ellipse(x+5,y-5,4,4);//eye
    
   fill(250,0,40,100);
   triangle(x,y+5,x+10,y+15,x+15,y+5);
   
}
}

