
void rectA(x,y,h,w){
     line(x,y,x,y+h);
     line(x,y+h,x+w,y+h);
     line(x+w,y+h,x+w,y);
     line(x+w,y,x,y);
 }
 
 size(500,500);
 for(int i=0; i<5; i++){
     rectA(random(0,500),random(0,500),random(5,100),random(5,100));
 }
