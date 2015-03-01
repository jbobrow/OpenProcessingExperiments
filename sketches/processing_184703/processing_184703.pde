
counter[][] numbers;
grownumber thegrownumber;

//SETTINGS
int canvas_width = 800;
int number_size = 16;
int speed = 20;

int row,col;
int canvas_height;
int i,j;

int grownumber;
int grownumberx, grownumbery;



void setup() {
  frameRate(speed);
  
  canvas_height = canvas_width*9/16;
  color c=color(64,200,0);
  row= canvas_width/number_size;
  col= canvas_height/number_size;

  size(canvas_width- number_size*2, canvas_height - number_size*2);
  smooth();
  textAlign(CENTER, CENTER);
  background(0);  
 
  numbers = new counter[row][col];
  for(i=0;i<row;i++){
    for(j=0;j<col;j++){
      c=color(random(0,255),random(128,255),0);
      
      numbers[i][j] = new counter(c,i*number_size,j*number_size);
    }
  }  
  
  thegrownumber = new grownumber(int(random(0,9)),int(random(0,width)),int(random(0,height)));
}

void draw(){
  background(0);
  
    //scroll the screen
  translate(0,-frameCount % number_size);   
  
  for(i=0;i<row;i++){
    for(j=0;j<col;j++){
      numbers[i][j].display();
    }
  }
  
  if(frameCount % (speed) == 0){
    thegrownumber.grownumberx = int(random(0,width));
    thegrownumber.grownumbery = int(random(0,height));
    thegrownumber.n = int(random(0,9));
    thegrownumber.grownumbersize = number_size;
    println("hi");
  }  
  
  thegrownumber.display();
  

  

}

class grownumber{
  int n;
  float grownumbersize;
  int grownumberx, grownumbery;
 
 grownumber(int tempn, int tempgrownumberx, int tempgrownumbery){
   n=tempn;
   grownumberx = tempgrownumberx;
   grownumbery = tempgrownumbery;   
 }
 
 void display(){
   grownumbersize = grownumbersize *1.3 ;
    textSize(grownumbersize);     
    fill(128,190,0,200);
    text(n, grownumberx, grownumbery);
 }
}

  
class counter{
  color c;
  int x,y;
  int n;

  counter(color tempc, int tempx, int tempy){
    c=tempc;
    x=tempx;
    y=tempy;      
  }
 
  void display(){
    fill(c);    
    textSize(number_size);
    n=int(random(0,9));
    text(n,x,y);
  }
}


