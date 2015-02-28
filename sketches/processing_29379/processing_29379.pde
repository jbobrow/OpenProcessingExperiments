
int a = 1;
int b = 1;

void setup(){
    size(500,720);
    background(0);
    noFill();
    noStroke();
}

void draw(){
    fill(255);
    ellipse(a++,b,10,10);

    
   if(a >= width) {
       a = 0;
       b++;
   }
    fill(100);
    text("5 min",0,60);
    text("10 min",0,120);
    text("15 min",0,180);
    text("20 min",0,240);
    text("25 min",0,300);
    text("30 min",0,360);
    text("35 min",0,420);
    text("40 min",0,480);
    text("45 min",0,540);
    text("50 min",0,600);
    text("55 min",0,660);
    text("60 min",0,720);
  
    
}  

                                                
