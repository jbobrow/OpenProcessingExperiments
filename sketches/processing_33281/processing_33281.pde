
//Nicole Del Senno
//N00211488

int x=10;
int y=0;

void setup(){
  size(600,600);
  noStroke();
  smooth();
  frameRate(100);
}

void draw(){
  background(0);
  for (int i=10; i<=width-10; i+=25){
    ellipse(x,i,20,20);
  }
  x++;
  if (x > width){
    x=0;
  }
  if(x>60 && x<540){
    fill(148,0,211);
    
    if(x>120 && x<480){
     fill(85,26,139);
          
      if(x>180 && x<420){
       fill(0,0,255);
         
        if(x>240 && x<360){
         fill(223,255,255);
           
          if(x>280 && x<300){
           fill(255,255,255);
           
    }else{
      fill(238,130,238);
}

       }
      }
    }
  }
}
 




