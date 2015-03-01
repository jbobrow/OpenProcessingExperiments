
int res = 25;
int mouseX2;
int mouseY2;

int mouseX3;
int mouseY3;

float mEasing = .01;
float bEasing = .01;

float xPos;
float xPos2;
float yPos; 
float yPos2;
float XdirX;
float YdirY;

float radius = 0;
float radius2;

float ranX, ranY;

float bSize = 100;

int passed = 0;

int counter = 0;

float y3 = 300;


void setup(){
  size(800,800);
//  background(100,255,0);
  
ranX = width/2;
ranY = height/2;

mouseX2 = width/2;
mouseY2 = height/2;

xPos = width/2;
xPos2 = width/2;

yPos = height/2;
yPos2 = height/2;
 
 
  
}

  void draw()
  {
    
    counter++;
    if(counter >= 30){
      ranX = random(width);
      ranY = random(height);
      counter = 0;
    }
    println(counter);
  
    if(passed == 0){
      radius = (width);
      bEasing = map(radius2,0,width*2,.01,1);
      xPos = width/2;
      yPos = height/2;
      radius = (width);
    }else{
      xPos = width-mouseX2;
      yPos = height-mouseY2;
      radius = 0;
      bEasing = 1;
    }
      
      if(radius2 > width - 2*(width/res)){
        bEasing = 1;
        radius = 0;
        passed = 1;
      }else{
        passed = 0;
      }
      
    

    
    
    xPos2 += (xPos - xPos2) * bEasing;
    yPos2 += (yPos - yPos2) * bEasing;
    radius2 += (radius - radius2) * bEasing;
    
    
    mouseX2 += (map(mouseX,0,width,0-width,width*2) - mouseX2) * mEasing;
    mouseY2 += (map(mouseY,0,height,0-height,height*2) - mouseY2) * mEasing;
    

  
 // noCursor();
  background(110,110,210);

  
    noFill();
    stroke(0,100);
    strokeWeight(radius2/30);
    rect(xPos2-(radius2/2),yPos2-(radius2/2),radius2,radius2);
  
  
    strokeWeight(25);

  
  
  for(int i=0;i<=width;i+=res){
    
  line(0,i,width-mouseX2,height-mouseY2);
  line(i,0,width-mouseX2,height-mouseY2);
  line(i,height,width-mouseX2,height-mouseY2);
  line(width,i,width-mouseX2,height-mouseY2);

  
}

  
//  float mouseX3 = map(mouseX2,0,width,200,width-200,);

  int y4 = abs(height/2-mouseY2);
  
  if(y4 >= 300){
    y3 = 300;
  }else{
    y3 = y4;
  }
  
  strokeWeight(25);
  noFill();
  stroke(255);
  ellipse(mouseX2,mouseY2,300,y3);
  
  noStroke();
  fill(0,255,0);
  ellipse(mouseX2,mouseY2,200,200);
  
  if(mouseY2 >= height/2){
  strokeWeight(25);
  noFill();
  stroke(255);
  arc(mouseX2,mouseY2,300,y3,radians(20),radians(160));
  }
  
  if(mouseY2 <= height/2){
  strokeWeight(25);
  noFill();
  stroke(255);
  arc(mouseX2,mouseY2,300,y3,radians(200),radians(340));
  }

   
} 



