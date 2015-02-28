

int y=0;
boolean dir=true;

PFont myFont;

void setup(){
size(400,400);
frameRate(200);

 myFont = createFont("256Bytes", 32);
  textFont(myFont);



}

void draw(){
background(206,198,198);

noStroke();
fill(100, 99, 99);
rect(50,y, 25, 25);
fill(0);
rect(55, y+5, 5, 5);
rect(65, y+5, 5, 5);
rect(59, y+14,7, 7);
fill(255);
text("catch me if you can!", 110, y+25);


if(dir){ 
 if (y<=height-15){
   
   y=y+1;
 }
 
 else{
   dir=!dir;
 }
}

if(!dir){
   
 if (y>0){
   
   y=y-1;
 }
 
 else{
   dir=!dir;
 }


}
println(y);
println(dir);
}

