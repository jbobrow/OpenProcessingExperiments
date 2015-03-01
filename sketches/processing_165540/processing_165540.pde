
armyHead _armyHead;
//armyMan[] _armyMan = new armyMan[3];

float speed = 4.0;
float acc = 0.2;

float lerp = .01;

float d;

void setup(){
  size(800, 800);
  smooth();
  _armyHead = new armyHead();
  
  for (int i=0; i<width; i++){
    //_armyMan[i] = new armyMan();
    //_armyMan[i].parameters();
    //_armyMan[i].howDoesItWork();
  }
}

void draw(){
  background(255);
  _armyHead.sizespeed(10, 10, 25); 
  _armyHead.parameters();
  _armyHead.howDoesItWork();
}
class armyHead{

float x;
float y;

int bigness;

int i;
int u;
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);


void parameters(){
  noStroke();
  d = dist(mouseX, mouseY, width/2, height/2);
}

void sizespeed(int _x, int _y, int _bigness){
  x = _x;
  y = _y;
  bigness = _bigness;
}

void howDoesItWork(){
  //background(0);
  for(int x = 10; x < width; x += 40){
    for(int y = 10; y < height; y += 50){
      fill(0);
      stroke(0);
      strokeWeight(5);
      line(x, y, x-15, y-15);
      line(x, y, x+15, y-15);
      if (mousePressed){
      fill(r, 200, 200);
      strokeWeight(2);
      }else{
      fill(200, g, 100);
      //also I do not quite under stand why sometimes color changes on the screen
      //and sometimes the randomization only works when restart the window
      strokeWeight(2);
      }
      ellipse(x, y, bigness, bigness);
      fill(#FF0307);
      ellipse(x-3, y, bigness/6, bigness/6);
      ellipse(x+3, y, bigness/6, bigness/6);
      noStroke();
      stroke(r, 0, 0);
      strokeWeight(4);
      line(x-6, y+5, x+6, y+5);
      x += random(-2, 2);
      y += random(-2, 2);
      
      
      if (d>350){
        speed=5;
        x += speed;
        //speed += acc;
      } else if ( d> 250){
        speed=20;
        y += speed;
        //speed += acc;
    //x=lerp(x, mouseX, 0.5);
    //y=lerp(y, mouseY, lerp);
        
      }
//      if(mousePressed){
//        i=xjump;
//        u=yjump;
//      }else{
//        return i;
//        return u;
//      }
//I was trying to make the 200 objects jump into different places every time you click the mouse
//but I cannot figure out the return function cause it is not allowed in a void function.
     }
    }

}
}
//class armyMan{
//  
//  float xPos;
//  float yPos;
//  float armySpeed;
//  float bigness;
//  
//  
//  void parameters(){
//    xPos = random(0+bigness, width);
//    yPos = random(0+bigness, height);
//    bigness = 20;    // Change the creature's size
//    armySpeed = 5;
//    d = dist(mouseX, mouseY, width/2, height/2);
//  }
//  
//  void howDoesItWork(){
//      //two strokes
//      fill(0);
//      stroke(0);
//      strokeWeight(5);
//      line(xPos, yPos, xPos-15, yPos-15);
//      line(xPos, yPos, xPos+15, yPos-15);
//      //color changing
//      if (mousePressed){
//      fill(0, 200, 200);
//      strokeWeight(2);
//      }else{
//      fill(200, 0, 100);
//      //also I do not quite under stand why sometimes color changes on the screen
//      //and sometimes the randomization only works when restart the window
//      strokeWeight(2);
//      }
//      //face
//      ellipse(xPos, yPos, bigness, bigness);
//      //eyes
//      fill(#FF0307);
//      ellipse(xPos-3, yPos, bigness/6, bigness/6);
//      ellipse(xPos+3, yPos, bigness/6, bigness/6);
//      noStroke();
//      stroke(random(255), 0, 0);
//      strokeWeight(4);
//      line(xPos-6, yPos+5, xPos+6, yPos+5);
//      
//     if(d>100) {
//    armySpeed=5;
//    xPos=lerp(xPos, mouseX, lerp);
//    yPos=lerp(yPos, mouseY, lerp);
//  }
//  else{
//    armySpeed=0;
//  }
//  
//  }
//  
//}


