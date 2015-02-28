
float x = 200;
float y = 200;
float r = 150;
float b = 0;
float g = 40;

void setup(){
  size(400, 400);
  background (0);
  smooth();

}

void draw(){
  noStroke();
  fill(0, 9);
  rect(0,0,width, height);
noFill();
stroke(r, g, b);
  ellipse(mouseX,mouseY, 50,50);
  if(mousePressed){
 ellipse(mouseX,mouseY, random(50,100),random(50,100));   
    ellipse(random(1,400),random(1,400),20,20);
 b=random(30,255);
 r=random(50,70);
 g=random(50,100);
 
 }
 else{
   b-=5;
   r-=5;
   g-=5;
   if(r<150){
       r=150;
   if(b<0){
     b=0;
     if(b>255){
   b=255;
   if(b>255){
   b=255;
   if(r>255){
     r=255;
     if(g>255){
     g=255;
     if(g<0){
     g=0;
     }
     
   }
   }
 }
  }
}
}
}
}
