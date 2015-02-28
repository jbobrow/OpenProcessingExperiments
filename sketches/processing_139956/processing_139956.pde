
int i,j;
int k;
Face[] faces = new Face[9*6];
//Face test;
 
void setup(){
//  background(20);
  size(900,600);
  for(j=0;j<6;j+=1){ //y
    for(i=0;i<9;i+=1){ //x
      k=i+j*9;
      faces[k]= new Face(i*100+50,j*100+50,100);//creates each face object to be drawn later
    }
  }
//  test = new Face(100,100,100);
}
 
void draw(){
  background(20);
  for(j=0;j<6;j+=1){ //y
    for(i=0;i<9;i+=1){ //x
      k=i+j*9;
      faces[k].cursorOn();//checks each face in the 6X9 grid to see if our mouse is over it
      faces[k].display();//draws each face in the 6X9 grid
    }
  }
//  test.cursorOn();
//  test.display();
}
 
class Face{
  int counter=0;
  int displaceX=0;
  int displaceY=0;
  float restX, restY;
  float x, y;
  float diameter;
  int on=0;
  int colored = 0;
  int uncolored = 0;
  int wasOn = 0;
   
  Face(float initialX, float initialY, int initialDiameter){
    x=initialX;
    restX=initialX;
    y=initialX;
    restY=initialY;
    diameter=initialDiameter;
  }
  void display(){
    counter++;
    if(counter==3){
      counter=0;
    }
    if(on==1){//if mouse over
      if(counter==1){
        displaceX=2;//move in x, jiggle in x axis
      }
      else if(counter==2){
        displaceY=2;//move in y, jiggle in y axis
      }
      else{
        displaceX=displaceY=-1;//jiggle in both
      }
    }
    noStroke();
    if(on == 1)
    {
      fill(0,255,0);//if mouse over, set color to green
      colored = 1;
      wasOn = 1;
    }
    else if(colored == 0)//makes sure it isn't already green
    {
      fill(255,255,100);//sets color to yellow when not mouse over
    }
    else if(colored == 1)//if it was green, then make it black
    {
      //fill(0,255,0);//for leaving the faces green after you mouse over
      //if above is commented, then it makes faces black
      uncolored = 1;
    }
    if(uncolored == 1 && on == 1)//if it was black, make the current face red
    {
      fill(255,0,0);
      uncolored = 2;
    }
    if(uncolored == 2 && wasOn == 1)//makes sure that the face remains red
    {
       fill(255,0,0); 
    }
    ellipse(x+displaceX,y+displaceY,diameter,diameter);
    fill(20);//actually colors it
    ellipse(x-diameter/5+displaceX,y-diameter/6+displaceY,diameter/5,diameter/5);
    ellipse(x+diameter/5+displaceX,y-diameter/6+displaceY,diameter/5,diameter/5);
    stroke(20);
    strokeWeight(2);
    if(on==0){
      line(x-diameter/5,y+diameter/5,x+diameter/5,y+diameter/5);
    }
    else if(uncolored != 2){//mouse over, so draw the two lines that make up the mouth
      line(x-diameter/5+displaceX,y+diameter/5+displaceY,x+displaceX,y+diameter/3+displaceY);
      line(x+diameter/5+displaceX,y+diameter/5+displaceY,x+displaceX,y+diameter/3+displaceY);
    }
    else
    {//if face is red, give his mouth a slant
      line(x-diameter/5+displaceX,y+diameter/5+displaceY,x+displaceX,y+diameter/3+displaceY);
    }
    displaceX=0;
    displaceY=0;
    x=restX;
    y=restY;
 
  }
  void cursorOn(){//checks if mouse if hoving over specific head
    if(mouseX>=x-diameter/2 && mouseX<=x+diameter/2 && mouseY>=y-diameter/2 && mouseY<=y+diameter/2){
      on=1;//mouse is over this head, so we make a variable to let us know
    }
    else{
      on=0;
    }
  }
}
//if we mouse over, it turns green, 
//then we leave the mouse over, it turns black
//then when we mouse back over the blacked out faces, the moused over face turns red
//when the face is red, its mouth becomes a slant

//http://www.openprocessing.org/sketch/138840


