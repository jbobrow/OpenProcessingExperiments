
//Many unpredictaballsMany unpredictaballs by langT.
Circle[] circles;

void setup(){
  size(680,800);
  circles = new Circle[2];
  for(int i = 0; i< circles.length; i++){
    circles[i] = new Circle(random(width),random(height));
  }
}

void draw(){
  fill(255);
  rect(0,0,width,height);
  for(int i = 0; i < circles.length; i++){
    circles[i].physics();
    circles[i].display();

  }
}

class Circle{
	float y, x, xV , yV, xa, ya; 
	Circle( float _x, float _y){ // constructor
  x = (random(0));
  y = (random(1,20));
  xV = (random(-10,10));
  yV = 0;//floor(random(-10,10));
  xa = .1;
  ya = .1;
                

	}
	//methods that is applied to each instance of the class
  void physics(){
  yV += ya;//causes ball to accelerate downward each 
  x += xV;
  y += yV;
  if(x > width){
    x = width;
    xV *= -1;
    ya *= -1;
  }else if (x < 0){
    x = 0;
    xV *= -1;
  } 
    if(y > height){
    y = height;
    yV *= -1;    
  }else if (y < 0){
    y = 0;
    yV *= -1;
    
  }
  }

 

  void display(){
    fill(random(100-200),0,0);
    noStroke();
    ellipse(x,y,10,10);
    //ellipse(x,y,(random(40-60)),50); this looks like coins
    //point(x,y);
  }
}








