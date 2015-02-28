



Particle[] particles;





color colorCenter;





color colorOuter;





 





void setup()





{





  size(600, 600, P2D);





  background(0);





  frameRate(500);





  smooth();





  restart();





}





 





void restart()





{





  colorCenter = color(random(255), random(255), random(255), 10);





  colorOuter = color(random(255), random(255), random(255), 10);





  particles = new Particle[1000];





  for(int i = 0; i < 1000; i++)





  {





    particles[i] = new Particle(random(0, 1), random(360), i);





  }





  background(0);





  noiseSeed(second());





}





 





void keyReleased()





{





  restart();





}





 





void draw()





{





  for(int i = 0; i < 1000; i++)





  {





    particles[i].update();





  }





}





 





class Particle





{





  float posX;





  float posY;





  float speed;





  float angle;





  float distance;





   





  protected Particle(float s, float a, float d)





  {





    speed = s;





    angle = a;





    distance = d;





    posX = distance * cos(radians(angle)) + width/2;





    posY = distance * sin(radians(angle)) + height/2;





  }





   





  public void update()





  {





    distance = noise(sin(radians(posX)), cos(radians(posY)), cos(radians(millis()))) * (width/2);





    angle += speed;





    posX = distance * cos(radians(angle)) + width/2;





    posY = distance * sin(radians(angle)) + height/2;





    stroke(lerpColor(colorOuter, colorCenter, distance / 300));





    point(posX, posY);    





  }





}


