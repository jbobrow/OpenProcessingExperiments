

float i = 0;




void setup(){
    smooth();
noStroke();
      size(1100, 1100);
}


void draw(){
 
  //background(252, 252, 252);  
  
  //for(float i = 0; i < width; i+=.1){
    
    i+= .01;
     float x = i;
      float y = x;
    x = 1000 * sin(x*1000)*sin(x)*sin(x);
   // x = map(x, 0 ,1024, 0, 900);
    y = 1000 * sin(y*1000)*sin(cos(x+y));
    //x = width -x;
    //y = map(y, 0 , 1024, 0, 900);
    //y = height - y;
    //println(x);
    //println(y);
   
   fill (x-50,150,i+300, 30);
   
   
   //rect(x,y,y-300,y-300);
   ellipse(x,y,y-300,x-300);
   fill (150, 0, 0, 30);
   ellipse(y,x,y-300,x-300);

  
  
  //for(int i = 0; i < 10;i++){
   //println(y);
  //}
  
  
}

