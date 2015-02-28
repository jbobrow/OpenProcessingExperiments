
int count = 0;
int c= 10;
PFont f;
void setup(){
   size(500,500);
   f =createFont("Helvetica",14,true);
   background(0);
    stroke(255);
}  

void draw(){
   background(0);
   textAlign(CENTER);
   textFont(f,14);
   fill(255);
   text("bedrohlich",width/2,height/2);
   count = count +1;
   ellipse(width/2,count,c,c);
   
   if (count == height){
     c = c+2;}
   if (count ==height){
     count = 500;
     if (count > 480){
     c = c+300;
     }
   }
     
}

