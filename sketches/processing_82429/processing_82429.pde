
float vx=2;
float vy=0;
float x=0;
float y=10;
float frictionx=.998;
float frictiony=-.5;
float gravity=.07;
float value;
float myFun;
float posX;
float posY;
float angle;
float t;
Circle[] circles;

PImage myImg, myImg2;

void setup(){
  size(800,600);
  background(255,176,10);
  stroke(10);
  myImg=loadImage("rudolphcancer copy.jpg");
    myImg2=loadImage("babymaris.jpeg");
      //taken from class notes
    for(int x=0; x < width; x+=10){
        for (int y=0; y < height;y+=10){fill(random(255));
       
          rect (x,y,5,15);
        
   
   circles = new Circle[1000];
  
  for(int i=0; i < circles.length; i++){
      circles[i]= new Circle(random(width),random(height),random(-500,500),random(-500,500));
       
}
  }
     }
      }

void draw(){
  
 // image(myImg, mouseX, mouseY);
 
 stroke(160,34,211);
  fill(78,100,222);
  
    rect(25, 25, 50, 50);

  
        fill(78);
 
            ellipse(mouseX,mouseY,100,100);

//taken from class

    for(int i=0; i <circles.length; i++){
       circles[i].move();
          circles[i].displayC();
  
  
phys();
//noStroke();
ellipse(200,300,30,30);
ellipse(400,550,40,40);
ellipse(500,150,30,30);
ellipse(700,550,40,40);
}
}

 void phys(){
  //physics math from class
  vy+= gravity;
  vx*=frictionx;
  x+=vx;
  y+= vy;
  if(y>height){
  y=height;
  vy *=frictiony;
}

//fill(234,543,23);
//fill(255);
stroke(random(255));
    ellipse(x*2,y*2,100,50);

   
if(dist(x+5, y+5, 600,600)<200){
  fill(231,33,298);
 fill(255);
  vx*=frictionx;
  vy*=gravity;
  fill(250,156,200);
  ellipse(x,y,50,50);
  //noFill();
 

image(myImg,mouseX/3,mouseY/3);

    ellipse(mouseX/2,mouseY/2,50,50);

        fill(128,52,206);

            ellipse(mouseX,mouseY,45,45);

            ellipse(mouseX/2,mouseY/5,50,50);

  //from class notes
   
  if(x>width){
    x=width;
      vx *=-20;
       
        println(50000-millis()/1000);
          text(50000-millis()/1000,100,600);
 
  }
   
if(dist(x, y, 200,200)<200){
  fill(231,33,298);
  vx*=frictionx;
  vy*=gravity;
  fill(250,156,200);
  ellipse(x,y,25,25);
  ellipse(mouseX, mouseY, 30, 30);
  image(myImg2,width/2, height/2, mouseX/2, mouseY/2);
  noFill();
 
  
  }
   
      }
           
 }
      //ellipse(CORNER) from Processing.org
void mouseReleased(){
  ellipseMode(CORNER);
  fill(255);
 ellipse(mouseY,mouseX,30,30);
  image(myImg2,mouseX,mouseY);
 // rect(mouseX,mouseY,100,100);
  vy-=5;
   
}
//class notes 
class Circle{
   float x,y,offx,offy,speedX,speedY,angle;
Circle(float _x,float _y, float _offx, float _offy){
     
    x=_x;
    y=_y;
    offx= _offx;
    offy= _offy;
    speedX=1;
    speedY=1;
    
}
//class notes
 void move(){
       
    for(int i=0; i<100; i++){
 
        
      
      x=500*cos(radians(angle));
       
        y=600*sin(radians(angle/2));
           
           fill(175,405,77);
             
            rect(x-offx+width/2,y-offy*height/2,100,150);
             
              fill(255,149,18);
          
              rect(x*offx+width/2,y+offy+height/2,10,10);
             
              fill(152,255,246);
         
                rect(x*offx+width+2,y+offy+height/2,10,10);
           
                    fill(255,149,180);
          
                        rect(x+offx+width/4,y+offy*height*2,25,50);
         
                           angle+=.5;
      }
  }
   
  void displayC(){
   // fill(255);
    ellipse(x,y,5,5);
  }
 
 
  }
  
//void mouseDragged() 
//{
 // value = value + 1;
 // if (value > 255) {
   // value = 0;
 // }
//}
void mouseDragged(){
  if(dist(mouseX,mouseY,x,y)<50){
    x=mouseX;
    y=mouseY;
}
  }
   // }
void mouseClicked() {
   if (value == 0) {
    value = 255;
  } else {
    value = 0;

  }
    }
    

       
            void myFun
            (float posX,float posY)
            {
    fill(148,250,252);
       stroke(posY,500,100);
        rect(posY/4,posX/5,posX+1,posY);
                      fill(202,76,97);
                      rect(posY/3,posX*.5,posX,mouseX);
        ellipse(posX,posY,10+posX,10+posY);
      //  fill(195,255,0);
          ellipse(posX,posY,10+posX,10+posY);
            fill(148,250,252);
            ellipse(100,100,00,posX);
             fill(39,99,99);
             ellipse(200,300,100,posX);
              line(posY,posX,posX*2,posY*2);
                line(posY,posX,posX*100,posY*200);
                    line(posY,posX,posX*200,posY*400);
                    line(posY,posX,posX*1,posY*2);
                      
                      
                      fill(148,250,252);
                        x=200*cos(radians(angle))*sin(radians(angle));
                        y=200*sin(radians(angle/10))*t;
                        ellipse(x+2,y+2,10,10);
                         ellipse(800,800,200,200);
                         angle++;
                             
 
     
    //rectangles on top and bottom
    for(int i=0; i<600; i+=10){
     stroke(random(255),100,100);
      //rect(i,500,200,100);
       rect(i,700,100,100);
}
     }

