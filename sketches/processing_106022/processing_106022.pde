
//thanks enrica! you are angel

int x = 1;
int y = 1;

float deanX;
float deanY;

float bobX;
float bobY;

float aDist;

void setup(){
  size(900,20);
}

void draw(){
  background(255);//set background color 
  deanX = x+5; //set up the distance between dean and bob
  deanY = y+5;
  
  aDist = dist (deanX,deanY,bobX,bobY);//draw the distance between dean and bob
  
  //dean
  fill(255,0,0,30);//dean's color
  noStroke();
  rect(x,y,20,20);//dean's body
  
  //bob
  fill(0,0,255,70);
  ellipseMode(CENTER);
  ellipse(bobX,bobY,20,20);
  
 
  
  
  if ((keyPressed) && (key ==CODED)){//if arrow is pressed
    if(keyCode == LEFT){//if left arrow is pressed
      fill(mouseX,mouseY,0);//change color
      x-=5;// moves 5 px to left       
    }
    if(keyCode == RIGHT){//if right arrow is pressed
      x+=5;// moves 5 px to right  
    }
   

    if ((keyCode == DOWN) && (keyCode == LEFT)) {//if up and down arrow is pressed
      y+=10;// moves 5 px to up 
      x-=10;// moves 5 px to down 
    }
     if (x == 0) {//check if x = 0
    x = width; //reset x to 500
    }
    if (x == width + 5) {//check if x = 501
     x = 0;//reset x to 0
    }
    if (y == height) {
    y = 0;
    }
    if (y == -1) {
    y = height;
    }

    if (aDist <10) {bobX = random (width-200);//if distance < 10, set bob x to random num
       
   }

  
  
  
  
  
  }
  

}
