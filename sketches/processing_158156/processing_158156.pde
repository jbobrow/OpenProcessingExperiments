
int r=0,b=0,g=0; 

class Pupil
{
  PVector origin;
  int diameter; //225, radius 112
  //0-20 black to red 0-100
  //20-50 black to red 100-255
  //50-100 red to yellow 
  //100-112 black
  Pupil(float dxyor){
    if(dxyor<200){
      origin = new PVector(mouseX, mouseY); 
    }
    else{
      float angle=atan2(mouseY-height/2, mouseX-width/2); 
      println("angle ",angle); 
      println("x ", mouseX, " y ", mouseY); 
      println(width/2-(cos(angle)*200)," ",width/2+(cos(angle)*200));
      println(height/2+(sin(angle)*200)," ",height/2-(sin(angle)*200));
      float x, y; 
      if(angle<=-1.5){
         x=constrain(mouseX,width/2+(cos(angle)*200),width/2-(cos(angle)*200));
         y=constrain(mouseY,height/2+(sin(angle)*200),height/2-(sin(angle)*200));
      }
      else if(angle<=0 && angle>-1.5){
        x=constrain(mouseX,width/2-(cos(angle)*200),width/2+(cos(angle)*200));
        y=constrain(mouseY,height/2+(sin(angle)*200),height/2-(sin(angle)*200));
      }
      else if(angle>0 && angle<=1.5) {
        x=constrain(mouseX,width/2-(cos(angle)*200),width/2+(cos(angle)*200));
         y=constrain(mouseY,height/2-(sin(angle)*200),height/2+(sin(angle)*200));
      }
      else{
        x=constrain(mouseX,width/2+(cos(angle)*200),width/2-(cos(angle)*200));
         y=constrain(mouseY,height/2-(sin(angle)*200),height/2+(sin(angle)*200));
      }
       
      origin = new PVector(x,y);
    }
     
    diameter=224; 
  }
  
  void draw(){
    
    for (int y=int(origin.y-112); y<int(origin.y+112) ; y+=5){
      for (int x=int(origin.x-112); x<int(origin.x+112) ; x+=5){
        float dc= sqrt((width/2 -x)*(width/2 -x) +(height/2 -y)*(height/2-y));
        float dor=sqrt((origin.x -x)*(origin.x-x) +(origin.y -y)*(origin.y-y));
        if(dc<225 && dor<=20){
          float m= map(dor, 0,20,0, 100); 
          fill(m,0,0); 
          ellipse(x,y,5,5);
        }
        else if(dc<225 && dor<=50){
          float m= map(dor, 20,50,100, 255); 
          fill(m, 0, 0); 
          ellipse(x,y,5,5); 
        }
        else if(dc<225 && dor<=100){
           float m= map(dor, 60, 100, 0, 255); 
           fill(255,m, 0);
           ellipse(x,y,5,5); 
        }else if (dc<225 && dor<=112){
          fill(0);
          ellipse(x,y,5,5); 
        }
        
      } //end of inner for loop
    } //end of outer for loop 
    
  }// endof draw funciton=
}

void setup(){
 
 size(700,700);  
 frameRate(10); 
}

void draw(){
  background(0); 
  boolean method= true; //true for defalut method 1 false for 2nd 
  
  //eyeball 450 wide (diameter) 
  float dxyor= sqrt((width/2 -mouseX)*(width/2 -mouseX) +(height/2 -mouseY)*(height/2-mouseY)); 
  //float dxy= sqrt((mouseX -a)*(mouseX-a) +(mouseY -c)*(mouseY-c));
  float angle=atan2(mouseY-height/2,mouseX-width/2); 
  
  //draw pupil
   
   Pupil x= new Pupil(dxyor); 
   x.draw(); 

   
  
  //drawing eyball
  int c=120;
  for(int i=0; i<92; i++){
     int a=120; 
      for(int j=0; j<92; j++){
        //distacne from center of eyeball;
        float d= sqrt((width/2 -a)*(width/2 -a) +(height/2 -c)*(height/2-c)); 
        float dxc= sqrt(( x.origin.x - a)*( x.origin.x - a)+( x.origin.y -c)*(x.origin.y -c)) ;
        if(d<=225 && dxc>=113){
        noStroke(); 
        fill(255);
         ellipse(a,c,5,5);
        }
        a+=5;  
      }
   c+=5; 
  }
  
  
}


