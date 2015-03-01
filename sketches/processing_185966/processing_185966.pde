
Spot sp;

ArrayList<Spot> spots;
void setup() {
  size(600, 600);
  smooth();
  noStroke();
//background(0); //uncomment if one wants to switch to color wheel
  spots= new ArrayList<Spot>();

  for (int i=0; i<=700; i=i+1) {
    spots.add(new Spot(random(width),random(height-50), random(1,10), random(-1,1), 0));
  }
}

void draw() {
  
  println(frameRate);
//background(0);
fill(#FFF8E7, 100); //undo if one wants to switch to color wheel, increase transparency
//fill(0, 100);
rect(0, 0, width, height);


  for (int i=0; i<spots.size (); i++) {
    Spot s = spots.get(i);

    s.move(#9CFFCE);
    //s.displayCircle(); undo for color wheel

  }
}

class Spot {
  float x, y;
  float diameter;
  float speed ; 
  color dog;


  int directionX=1;
  int directionY=1;

  Spot(float xpos, float ypos, float dia, float sp, color c ) {
    x=xpos;
    y=ypos;
    diameter=dia;
    speed=sp;
    dog= c;
  }

  void move(color c) {
    
   c=int(speed*50);
   c=int(map(diameter,1,10,100,255));
 
   
             if(speed<0){
             c=int(speed*-50);
             c=int(map(diameter,1,10,100,255));
             }

            if ((y>(height- diameter)) || (y<diameter/4) )  {
            directionY *= -1;
            }
            
           if( x>width|| x<0){
              directionX *= -1;
           }
            
            if(speed==0){
            speed=1;
            }
            
    y+= (speed * directionY*2);
    x+=(speed * directionX);
    
    fill(c,c/2,c/2);
    ellipse(x, y, diameter, diameter); //undo if one wants to switch to color wheel
  }


  void displayCircle() {

    fill(map(sqrt(sq(width/2-x)+sq(height/3-y)), mouseX, mouseY, 50, 255), //r
         map(sqrt(sq(width/3-x)+sq(height/2-y)), mouseX, mouseY, 50, 255),      //g
         map(sqrt(sq(width/1.5-x)+sq(height/2-y)), mouseX, mouseY, 50, 255)  //b
         );   
  
    ellipse((x), (y-2), (diameter), diameter);
  }


}



