
  int h=0;

void setup(){
 size(200,200);
background(0);


}

void draw(){


 for(int x=0; x<height; x+=10) {
 fill(random(255),random(255),random(255));
    rect(x,h,10,10);
     }   

     h=h+10;   
}

  
