
circle circle1;
circle circle2;
enlace link1;

void setup(){
  
  size(600,600);
  smooth();
  
  
  
  circle1 = new circle();
  circle2 = new circle();

  link1 = new enlace();

  
}




void keyPressed(){


  if (key == ' '){

      circle1 = new circle();
      circle2 = new circle();

      link1 = new enlace();

  }



}












void draw(){
  
  background(0);
  
  text("press spacebar for some random shit", 20, 20);

  link1.draw(circle1.posX,circle1.posY,circle2.posX,circle2.posY);

  circle1.draw();
  circle1.move();

  circle2.draw();
  circle2.move();
   
  
}



class circle {


float posX;
float posY;
float sizeX;
float sizeY;
float counterX;
float counterY;
float posXorig;
float posYorig;
float rot1;
color c;

  circle(){


    posXorig = posX = random(200,(width-200));
    posYorig = posY = random(200,(height-200));
    sizeX = sizeY = 50;
    c = color (random(255),random(255),random(255));

    rot1 = random(6);
    counterX = random(5,13);
    counterY = random(5,15);



    }


  void draw(){

  fill(c);  
  noStroke();
    ellipse(posX,posY,sizeX,sizeY);

  }


  void move(){

    posX = posX + sin(counterX)*rot1;
    counterX+= 0.05;

    posY = posY + sin(counterY)*rot1;
    counterY+= 0.05;


  }


}

class enlace {

float pos1X;
float pos1Y;
float pos2X;
float pos2Y;
float distan;

  enlace(){



  }


    





  void draw(float _pos1X,float _pos1Y,float _pos2X,float _pos2Y){

    pos1X = _pos1X;
    pos1Y = _pos1Y;
    pos2X = _pos2X;
    pos2Y = _pos2Y;



    distan = dist(pos1X,pos1Y,pos2X,pos2Y);


    stroke(map(distan,0,500,0,255));
    strokeWeight(2);
    line(pos1X,pos1Y,pos2X,pos2Y);
  }  

}
