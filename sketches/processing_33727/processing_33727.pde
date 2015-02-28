
int plotX;  //tell computer I want to define an INTEGER
int plotY;
//int[] 




void setup(){
  
  size (600,600);
  
  plotX = 2;  // DEFINE the integer
  plotY = 5;
  
  
  
}



void draw(){
  
  line(plotX, plotY, 230, 40);
 // background(38,39,135);
  ellipse(plotX, plotY, 60,60);
  
   println(plotX);
 
  
}


void mousePressed(){  // IF MOUSE PRESSED overide the INT defined above and replace with mouse pos X, y
  
  plotX = mouseX;
  plotY = mouseY;
  
  

  
  
}

