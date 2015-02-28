
void setup(){
  size(300,300);
  background(222,136,203);
}

int x=0;

void draw(){
  if(x>300){
     fill(193,135,179);
     ellipse(width/2,3*height/4,50,50);  
     noFill();
     strokeWeight(3);
     curve(width/5 +50,height/2 -50,width/3.5,height/2,width/2.5,height/2,width/5 +70,height/2 -50);
     curve(100+ width/5 +50,height/2 -50,100+ width/3.5,height/2,100+ width/2.5,height/2,100+ width/5 +70,height/2 -50);
      }else{
        if(x>200){
          fill(250,216,43);
          ellipse(width/2,height/6,30,30);
        }else{
          if(x>150){
            fill(240,169,133);
            ellipse(width/2,height/2,x,x);
           }else{
             if(x>100){
               fill(225,0,0);
               ellipse(width/2,height/2,x,x);
             }
           }
         }
      }
  x++;
}

  

