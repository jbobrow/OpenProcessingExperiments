
//DECLARE
Umbrella umbrella;
Totoro totoro;
//AMOUNT OF CIRCLES FOR CLOUDS
Clouds[] cloud= new Clouds[100];
//AMOUNT OF RAINDROPS
Rain[] rain = new Rain[1000];

//SETUP
void setup(){
size(1000,500);//CREATES DISPLAY
smooth();
noCursor();//REMOVES CURSOR
frameRate(10);//ADJUSTS FRAMERATE

//INITIALIZE
//USE A FOR LOOP TO USE EVERY ELEMENT IN ARRAY
//TO CREATE A NEW ELEMENT
for (int i = 0; i < cloud.length; i++ ) { 
  cloud[i] = new Clouds();
}
for (int j = 0; j < rain.length; j++ ) { 
  rain[j] = new Rain();
}

umbrella = new Umbrella();
//CAN BE ADJUSTED TO CHANGE THE 
//X CO-ORDINATE,Y-CO-ORDINATE &
//SPEED OF TOTORO
totoro = new Totoro(0,50,5);
}

//DRAW
void draw(){
 noStroke();
 background(105,140,180);
 fill(88,164,117);
//GROUND 
 rect(0,480,width,20);
  
//USE A FOR LOOP TO USE EVERY ELEMENT IN ARRAY
//TO CREATE A DISPLAY,MOVE,STOP ELEMENT 
 for (int l = 0; l < rain.length; l++ ) {
   rain[l].display();
   rain[l].rainfall();
   rain[l].stop(umbrella);
   
 }
 for (int i = 0; i < cloud.length; i++ ) {
   cloud[i].display();
   cloud[i].update();
 }

umbrella.display();
umbrella.change();
totoro.display();
totoro.smile();
totoro.walk();
}


class Clouds{
float x;
float y;
float speed;
float size;
float alpha;
color shade;


Clouds(){
  //USED MINUS SO CLOUDS ARE 
 //CREATED BEFORE DISPLAY 
  x = random(-100,1000);
  y = random(0,50);
  speed = random(0.5,3);
  size = random(20,100);
  alpha = random(200,255);
  shade = color(random(240,250));
}

void display(){
  smooth();
 x+=speed;
 noStroke();
 fill(shade,alpha);
 ellipse(x,y,size,size);
 
}

//IF THE CIRCLE REACHES THE END 
//OF DISPLAY THEN A CIRCLE IS MOVED
//TO NEW POSITION
void update(){
  if (x>width+100){
    x=-100;
  }
  
}
}

class Rain{
  float x;
  float y;
  float w;
  float l;
  float col;
  float speed;
  
  Rain(){
    x = random(width);
    y = random(height);
    w = 4;
    l = 6;
    speed = random(4,20);
    col = random(150,255);
    
  }
  
  void display(){
    
    fill(col);
    ellipse(x,y,w,l);
      
  }
  
  void rainfall(){
   //USED TO MAKE RAIN FALL 
      y = y + speed;

  }
  
  void stop(Umbrella i){
 //IF RAIN REACHES THE BOTTOM
//y IS MOVED TO NEW POSITION 
    if (y > height){
      y=0;
    }
//USED TO CREATE PARAMETERS SO RAIN 
//DOESNT FALL UNDER UMBRELLA
  if (y> i.y-150 && x> i.x-100 && x < i.x +100){
    y = 0;
    
  }    
  }
}

class Umbrella {
  float x, y;
  color c, h;

  Umbrella() {
    x = 0;
    y = 0;
    c = color(225,240,50);
    h = color(110,75,25);

}

void display(){
  
  x = mouseX;
  y = mouseY;
    
fill(h);
ellipse(x-1,y-155,5,3);
rect(x-1,y-110,3,100);
fill(c);
beginShape();
vertex(x-4,y-10);
vertex(x+5,y-10);
quadraticVertex(x+4,y+20,x-11,y+10);
vertex(x-11,y+5);
quadraticVertex(x-1,y+10,x-4,y-10);
endShape();

fill(c);
beginShape();
vertex(x-101,y-90);
bezierVertex(x-81,y-160,x+49,y-190,x+99,y-90);
quadraticVertex(x+79,y-110,x+59,y-90);
quadraticVertex(x+39,y-110,x+19,y-90);
quadraticVertex(x-1,y-110,x-21,y-90);
quadraticVertex(x-41,y-110,x-61,y-90);
quadraticVertex(x-81,y-110,x-101,y-90);
endShape();
}

void change(){
//USED TO CHANGE COLOUR OF UMBRELLA  
  if(mousePressed){
    c= color(random(255),random(255),random(255));
}
}
}

class Totoro{
  float xpos;
  float ypos;
  float move;
  color fill;
  
  Totoro(float tempX,float tempY,float tempSpeed){
    xpos=tempX;
    ypos=tempY;
    move=tempSpeed;
    fill=200;
  }
  
  void display(){
fill(fill);
ellipse(xpos+47,ypos+354,10,18);//ear
ellipse(xpos+10,ypos+430,30,20);//tail
ellipse(xpos+50,ypos+400,60,80);//main body
ellipse(xpos+40,ypos+410,50,60);//back body
fill(255);
ellipse(xpos+70,ypos+415,40,50);//belly
ellipse(xpos+60,ypos+372,5,8);//eye white
fill(200);
quad(xpos+62, ypos+407, xpos+68, ypos+402, xpos+72, ypos+407,xpos+ 68, ypos+405);//left marking
quad(xpos+78, ypos+407, xpos+84, ypos+402, xpos+85,ypos+ 407, xpos+84,ypos+ 405);//right marking
quad(xpos+70, ypos+398,xpos+ 76, ypos+393,xpos+ 80, ypos+398, xpos+76,ypos+ 396);//top marking
fill(0);
ellipse(xpos+62,ypos+372,2,4);//pupil
ellipse(xpos+71,ypos+374,5,3);////nose
fill(fill);
stroke(0);
beginShape();//arm
vertex(xpos+38,ypos+395);
quadraticVertex(xpos+20,ypos+420,xpos+40,ypos+410);
endShape();
line(xpos+49,ypos+375,xpos+53,ypos+377);//top whisker
line(xpos+48,ypos+380,xpos+53,ypos+380);//middle whisker
line(xpos+49,ypos+385,xpos+53,ypos+383);//bottom whisker
  }
  
 void walk(){
//USED TO ALLOW TOTORO TO MOVE 
//AND UPDATE
   xpos= xpos+move;
   if(xpos>width){
     xpos=-100;
   }
 }

void smile(){
//USED TO CREATE BOUNDARY SO
//TOTORO WILL SMILE WHEN UNDER UMBRELLA
  if (xpos> mouseX-180 && xpos< mouseX+40){
beginShape();//mouth
vertex(xpos+60,ypos+380);
quadraticVertex(xpos+62,ypos+390,xpos+77,ypos+385);
endShape();
    
  }
  
} 
  
}




