
float dX,dY;
float vy = 0;
float vx = 2;
float x = 10;
float y = 100;

float friction = -.5;
float frictionX = .9979;
float gravity = .03;
float wind= 0;
float easing;
PImage c;
PImage guy1;
PImage b; 


void setup (){
  size(800,600);
  b = loadImage("ballon.png");
  guy1= loadImage ("dancing.png");
  fill(HSB);
  c = loadImage("castle.png");
  image(c, 0 ,0);
  imageMode (CENTER);
  x=0;
  y=0;
  easing= .03;
}

 void mouseDragged(){
    vy += -.1;
 }
 

  
  void draw(){
    
    

    vy += gravity;    // vy  =  vy + gravity;
    vx += wind;
    vx *= frictionX;
    

    
  
    
    dX =mouseX -x;
    dY =mouseY -y;
    
      x += vx;
     y += vy;
    
    image(b,x,y);
    
    
    if ( y > height){
      y= height+1;
      vy *= friction;
      //vx *=friction;
    }
      
    if(x >width){
        x = width+1;
        vx= -vx;
        
     


    fill(255);
    ellipse(x,y,10,10);
    
     noFill();
     noStroke();
     
    ellipse(625,200,300,600);
    }
   
    if(dist(x,y,800,200) < 250 ){
      
      fill(0,10);
      rect(0,0,width,height);
      //text("+1",720,height-100);
      
     image(guy1,x,y);
    
      fill(random(255),random(255),random(255));

    rect(100,100,100,100);
    ellipse(x,y,20,20);

    rect(400,100,100,100);


rect(250,250,100,100);

rect(100,400,100,100);

rect(400,400,100,100);

float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  ellipse(mouseX, mouseY, 20, 20);
  
  }
  
   if(dist(x,y,700,height) < 100){
      
      fill(255);
      rect(0,0,width,height);
      fill(RGB);
      text("TRY AGAIN",720,height-200);
   }
      
      
      
    
    
  
    

    //float speed = pmouseX - mouseX
    //vy += map(speed,0,100,0,1);

  }


