

int xsize = 40;
int ysize = 40;
int sB = xsize;  //sizeBuff


int xtemp = 0; //left right 
int ytemp = 0; //

int cBuff = 25;
jBox[] boxes = new jBox[cBuff];

void setup(){
  
  size(200,200);
  smooth();



  //first define width and height before using them! 
  int ROW = (width/xsize);
  int COL = (height/ysize); 

  int cBuff = (ROW * COL); 

for(int i = 0; i < cBuff; i++){
  boxes[i] = new jBox(xtemp, ytemp, xsize, ysize);
  xtemp = xtemp + sB; 
  println(xtemp);
  //println(ROW);
  if(xtemp == 200){
    xtemp = 0;
    ytemp = ytemp + sB; 
  }  
}


}

  


void draw(){  
  background(255);  
  for(int i = 0; i < cBuff; i++){
   boxes[i].display();
   boxes[i].update(); 
  }
}




class jBox{
  int x; 
  int y;
  int xs;
  int ys;
  float gTemp = 0; 
  
  jBox(int xtemp, int ytemp, int xsize, int ysize) {
    x = xtemp;
    y = ytemp;
    xs = xsize;
    ys = ysize; 
    
  }
  
  void display(){
  //stroke(255);
  fill(gTemp);
  rect(x,y, xs, ys);
  }

  void update(){
      //fill temp buff 
      gTemp = constrain(gTemp, 0.0, 255.0); 
     
      
      
    if((mouseX > x) && (mouseX < (x + xsize)) && (mouseY > y) && (mouseY < (y + ysize))){
      fill(gTemp);
      rect(x,y,xs,ys);
      gTemp = gTemp + 19.0; 
    }else {
  
    fill(gTemp);
    rect(x,y,xs,ys);
    gTemp = gTemp - 1.00;      
    }  
 println(gTemp);
  
}
  

  

}

