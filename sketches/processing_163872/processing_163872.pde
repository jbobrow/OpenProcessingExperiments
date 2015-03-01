
//sets size and background color
void setup (){
  size(650,700);
  background(45,64,94);
}

void draw(){

  int row = 0;
  int x = 100;
  int y = 100;
  int width = 100;
  int height = 100;

/*prints 4 rows of 4 circles each. after two rows have been printed
  the y coordinate is increased by 200 for one row */
  while(row<=3){
    printrow(x,y,width,height);
    if(row==1)
      y=y+200;
    else
      y=y+150;
    row++;
  }

}

//prints a row of circles
void printrow(int x,int y,int width,int height){
  int print = 0;
  fill(mouseX+2,mouseX,mouseX+4);
  noStroke();
  
  while(print<=3){
        ellipse(x,y,width,height);
        x=x+150;
        print++;
  }  
}


