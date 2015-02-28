
void setup(){
size(600,600);
smooth();
}


void draw(){
for(int x=0;x<width;x+=10){
  for(int y=0;y<height;y+=10){
    if(mouseX> x&& mouseX< x+10&&mouseY>y&&mouseY<y+10){
      fill(random(255),random(300),0);
    }else{
      noFill();
    }
      rect(x,y,10,10);
      if(x%20==0 && y%40==0){
        ellipse(x,y,mouseX/10,mouseY/10);
        if(x%20==0 && y%40==0){
          triangle(mouseX, mouseY, HSB, 20, 86, 75);
           //concentrate ellioses
 for(int i=10; i<20;i++){
   ellipse(mouseX,mouseY, i*5,i*5);
 }
       }
      }
     }
    }
   }
   void mouseReleased(){
     background(400);
   }

