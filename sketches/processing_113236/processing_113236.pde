

PFont font;
JitterBug[] bugs = new JitterBug[33];
String [] black;



void setup(){
  size(1024, 768);
  black=loadStrings("black.txt");
  font=createFont("HelveticaNeue-Bold-22.vlw", 13);
  textFont(font);
  textSize(22);
  smooth();
  for (int i = 0; i < bugs.length; i++){
    float x= random(width);
    float y= random(height);
    int r = i+2;
    bugs[i] = new JitterBug(x, y, r);
  
}
}

void draw(){
  
  background(#2F2C31);
  for (int i = 0; i<bugs.length;i++){
    bugs[i].move();
    bugs[i].display();    
  }  
  for (int i = 0; i<bugs.length;i++){
    if (bugs[i].displayText()){
//    println("break");
    break;
    }
  }
}
class JitterBug{
  float x;
  float y;
  int diameter;
  float speed =2.5;
  int value =0;
  boolean isNearMouse =false;
  int index =0;
  
  
JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }  
void move(){
    x += random(-speed, speed);
    y += random(-speed, speed);
    x =constrain(x,0,1024);
    y =constrain(y,0,768);
  }

   
  

void display(){
    float d= dist(mouseX, mouseY, x, y);
    fill(value);
    ellipse(x, y, diameter, diameter); 
     
     
//  if (d< diameter){
////    text("what do I need to do to display random strings?? ", 100, height/2, 924, 768);
//  text(black[int(random(1, 3))], 100, height/2, 924, 768);
}
 
 boolean displayText(){
   float d = dist(mouseX, mouseY, x, y);
   fill(value);
   if(d<diameter){
     fill(0);
     if(!isNearMouse){
       index=int(random(0,8));
     }
     text(black[index], 100, height/2, 924, 768);
     isNearMouse=true;
   }
   else{
     isNearMouse=false;
   }
   return(isNearMouse);
 }
}

  

  

    



