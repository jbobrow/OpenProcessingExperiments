
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
    ellipse(a++,b,20,20);
 
     
   if(a >= width) {
       a = 0;
       b+=20;
   }
    fill(100);
    text("30 sec",0,120);
    text("1 min",0,240);
    text("1 min 30 sec",0,360);
    text("2 min",0,480);
    text("2 min 30 sec",0,600);
    text("3 min",0,720);

     
} 

