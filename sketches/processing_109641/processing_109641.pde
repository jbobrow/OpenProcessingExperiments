
//53077582 Li Cheuk Hin 2013-09-13
//assignment 1

int r,g,b=0;//initialize vars
//value of red, green and blue is r,g,b respectively

void setup(){
  size(500,500);
  background(0);
}

void draw() {
  for (int y=10; y<=height-10; y=y+20) {
  for (int x=10; x<=width-10; x=x+20) {//used for loop to generate ellipses
    fill(r,g,b);
    r=floor(random(255));
    g=floor(random(255));//r,g of the circle will be generated randomly
    ellipse(x,y,15,15);//x,y means the coordinates of each ellipse
  }
  }
}

void keyPressed() {//key event
  if (key == ENTER) {//the below events will happen when enter is pressed 
  if (b<255) {//if b is smaller than 255
    b=b+50;//b will increase by 50 when enter is pressed
  } else {
    b=0;//when b is larger than 255, it will be reset as 0
  }
  }  
//}
}

void mousePressed() {//mouse event
  if (b>0) {//if b is larger than 0
    b=b-50;//b will decrease by 50 when mouse is pressed
  } else {
    b=250;//when b is smaller than 0, it will be reset as 250
  }
}


