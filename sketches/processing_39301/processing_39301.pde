
ClassArrayCircle[] ObjCircle;
int NumberOfBalls = 5;

void setup(){
  size(640,480);
  frameRate(30);
  colorMode(HSB,360,100,100);
  ObjCircle = new ClassArrayCircle[NumberOfBalls];
  for (int i=0;i<NumberOfBalls;i++){
    ObjCircle[i] = new ClassArrayCircle(
                                        50, //STARTING X POSITION
                                        50, // STARTING Y POSITION
                                        color(random(0,360),47,88), // STARTING COLOR
                                        random(0.1, 3.0), // STARTING X SPEED (xspeed)
                                        random(0.1, 3.0), // STARTN Y SPEED (yspeed)
                                        random(-5,5), // X DIRRECTION (xdirection)
                                        random(-5,5), // Y DIRRECTION (ydirection)
                                        i // THE UNIQ ID!
                                        );
  }//END OF FOR
}//END OF SETUP

void draw(){
  background(#D0E9F0);
  //rectMode(CORNER);
  //rect(300,220,40,40);
  fill(255,255,255);
  point(300, 220);
  point(300, 260);
  point(340, 220);
  point(340, 260);
  for (int i=0;i<NumberOfBalls;i++){
    ObjCircle[i].move();
    ObjCircle[i].display();
  }//END OF FOR
}//END OF DRAW

class ClassArrayCircle {
  float xpos;
  float ypos;
  color circlecolor;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  //int circleID; TEST
  
  ClassArrayCircle(
                    float TEMP_xpos,
                    float TEMP_ypos,
                    color TEMP_circlecolor,
                    float TEMP_xspeed,
                    float TEMP_yspeed,
                    float TEMP_xdirection,
                    float TEMP_ydirection,
                    int circleID
                   ){
        xpos = TEMP_xpos;
        ypos = TEMP_ypos;
        circlecolor = TEMP_circlecolor;
        xspeed = TEMP_xspeed;
        yspeed = TEMP_yspeed;
        xdirection = TEMP_xdirection;
        ydirection = TEMP_ydirection;
  }
  
  void display(){
    noStroke();
    fill(circlecolor);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,50,50);
  }
  void move(){
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);
    if(xpos > width-25-50 || xpos < 50){
      xdirection *= -1;
    }
    if(ypos > height-25-50 || ypos < 50){
      ydirection *= -1;
    }
    if(xpos >= 300 && xpos <= 340 && ypos >=220 && ypos <=260){
       xdirection *= -1;
    }

    //if(xpos >=300 && ypos >=220 && ypos <=260 && xpos <=340){
     //  ydirection *= -1;
    //}
  }
  
}//END OF CLASS      
                    

