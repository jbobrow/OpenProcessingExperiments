
void setup(){
  size(600,600);
  noLoop();
  smooth();
  
}
 
void draw(){
 object1();
 object2();

}
 
void object2(){
   
  colorMode(RGB,255);
  noStroke();
     
    for (int x=0;x<width+1;x+=60){
      for (int y=0;y<height-2;y+=50){
        fill(random(25),205,125,100);
        ellipse(random(x),random(y),50,50);    
    }
  }
}
 
void object1(){
    colorMode(RGB,255);
    noStroke();
     
    for (int x=0;x<width+1;x+=75){
      for (int y=0;y<height+1;y+=75){
        fill(300,random(0,255),0);     
       ellipse(x,y,100,100);    
    }
  }
}



