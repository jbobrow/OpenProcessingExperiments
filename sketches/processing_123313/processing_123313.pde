
 Papallones[] papallona = new Papallones[20];
PImage photo;
void setup(){
  size (800, 600);
  photo=loadImage("http://levantateyanda.files.wordpress.com/2008/09/cielo-004.jpg");
  for (int i = 0; i < papallona.length;i++){
    papallona[i] = new Papallones(0, random(height), random (1,4), color (random(255),random(255),random(255)));
  }
}
void draw(){
  image(photo,0,0);  
  for (int i = 0; i < papallona.length;i++){
    papallona[i].dibuixa();
   papallona[i].moure();
  }
 }
class Papallones {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Papallones(){
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Papallones(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }
  void dibuixa(){
    
    noStroke();
    fill(c);
    ellipse(xPos,yPos,10,30);
    ellipse(xPos,yPos-19,10,10);
    stroke(c);
    strokeWeight(2);
    line(xPos,yPos-20,xPos+6,yPos-30);
    line(xPos,yPos-20,xPos-6,yPos-30);
        //dreta
          //adalt
          stroke(c);
          strokeWeight(4);
          line(xPos,yPos-10,xPos+25,yPos-30);
          line(xPos,yPos-10,xPos+25,yPos-25);
          line(xPos,yPos-10,xPos+25,yPos-20);
          line(xPos,yPos-10,xPos+25,yPos-15);
          noStroke();
          ellipse(xPos+10,yPos-10,30,10);
          //abaix
          stroke(c);
          strokeWeight(4);
          line(xPos,yPos-2,xPos+15,yPos-2);
          line(xPos,yPos-3,xPos+15,yPos);
          line(xPos,yPos-3,xPos+15,yPos+5);
          line(xPos,yPos-3,xPos+15,yPos+10);
          line(xPos,yPos-3,xPos+15,yPos+15);
          line(xPos,yPos-3,xPos+15,yPos+20);
          line(xPos,yPos-3,xPos+15,yPos+25);
       //esquerra
          //adalt
          stroke(c);
          strokeWeight(4);
          line(xPos-25,yPos-30,xPos,yPos-10);
          line(xPos-25,yPos-25,xPos,yPos-10);
          line(xPos-25,yPos-20,xPos,yPos-10);
          line(xPos-25,yPos-15,xPos,yPos-10);
          noStroke();
          ellipse(xPos-10,yPos-10,30,10);
          //abaix
          stroke(c);
          strokeWeight(4);
          line(xPos,yPos-2,xPos-14,yPos-2);
          line(xPos,yPos-2,xPos-14,yPos);
          line(xPos,yPos-2,xPos-14,yPos+5);
          line(xPos,yPos-2,xPos-14,yPos+10);
          line(xPos,yPos-2,xPos-14,yPos+15);
          line(xPos,yPos-2,xPos-14,yPos+20);
          line(xPos,yPos-2,xPos-14,yPos+25);
    
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}


