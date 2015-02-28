
 //float a = 17.5;

int amount = 24;
float[] x = new float [amount];
float[] y = new float [amount];
float xpos=100;
float ypos;

void setup() {
  size(500,500);
   //float ypos = -a;
   int i=0;
  while (i<x.length) {
    x[i] = xpos;
    y[i] = ypos;
    
    if (xpos<400){
    xpos+=100;
    i++;
    }else{
      ypos+=100;
      xpos=100;
    i++;
  }
  }
}

void draw() {

  background(255);
  Formation();
}
  void Formation(){
  int i=0;
  
  while (i<x.length){
    

   
    arc(x[i], y[i], 50, 50, PI, TWO_PI);
    arc(x[i], y[i], 35, 35, 0, PI);
    line(x[i]+25, y[i], x[i]-25, y[i]);
    strokeWeight(1.25);
    point(x[i]-7, y[i]+5);
    point(x[i]+6, y[i]+6);
    //line(x[i]-17.5, y[i], x[i]-25, y[i]);
    //line(x[i]+17.5, y[i], x[i]+25, y[i]);
    
    i++;
    
  
  
    
  }
    March();
  
}
    
    void March(){
      
     for (int i=0; i<amount; i++){
      y[i]++;
      
      if (y[i]==500){
        y[i]=0;
        
        }
            float dista = dist(mouseX, mouseY, x[i], y[i]);
      if(dista < 100) {
    
    x[i] = x[i] + (x[i] - mouseX)/50;
    y[i] = y[i] + (y[i] - mouseY)/50;
      //if(dista>100){
        //Formation();}
      }
    
  }
     }
      

  //void mouseMoved(){
      //int i=0;
      //while (i<x.length){
    
 // }}}

    
    
    


