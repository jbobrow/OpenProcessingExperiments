
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;


void setup(){
  size(300,300);
  ball1=new Ball(color(0,255,100),25,20,3,6);
  ball1.diameter=50;
  ball2=new Ball(color(255,0,100),20,20,2,4);
  ball2.diameter=40;
  smooth();
  
}

void draw(){
   background(255);
   ball1.move();
   ball2.move();
   //check for intersection
    boolean isIntersect=ball1.isIntersecting(ball2);
    if(isIntersect){
      ball1.highlight();
      ball2.highlight();
    }
   ball1.display();
   ball2.display();
}


class Ball{

    // Variables
    color currentColor;  //current color of the ball
    color ballColor;  //store color to reset after highlighting
    color highlightColor;  //highlight color of the ball
    PVector position;
    PVector speed;
    float diameter;  

    //Constructor
    Ball(){  //default constructor
      this(color(255,0,0), width/2, height/2, 3, 5 );  //call the constructor with initialization values
      
    }

    // constructor with initialization arguments
   Ball(color _c, float _xpos,float _ypos, float _xspeed, float _yspeed){
      currentColor=_c;
      ballColor=currentColor;
    highlightColor=color(255,255,0,40);
      position=new PVector(_xpos,_ypos);
      speed=new PVector(_xspeed,_yspeed);
    }

    // class methods  
    // this method is responsible for creating the displayed ball object
    void display(){
       fill(currentColor);  //this may be highlighted or ballColor
       ellipse(position.x,position.y,diameter,diameter);
     currentColor=ballColor; //reset ballColor back to original color
    }

    //this method is responsible for determining movement of the ball
    void move(){
      position.add(speed);
      if(position.x > (width-diameter/2) || position.x < (0+diameter/2)){  
        speed.x *= -1;
      }
      if(position.y > (height-diameter/2) || position.y <(0+diameter/2)){
        speed.y *=-1;
      }
    }

    // this is a convenience method to help with debugging
    String toString(){
      return " [ " + this.position.x + " , " + this.position.y + " ]";
    }
  
    //comparison method:  do comparison and return true or false
  
     boolean isIntersecting(Ball otherBall){
        float distance= PVector.dist(this.position, otherBall.position);  //PVector distance between 2 points
     
        if( distance <= (this.diameter / 2) + (otherBall.diameter / 2)){
          return true;
        }
        return false;
    }

    void highlight(){
      this.currentColor = this.highlightColor;
    }

} //end of Ball class


