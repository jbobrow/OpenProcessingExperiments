
float a;
float b;
float c;
float d;
float xpos;
float ypos;
void setup(){
  size(600,600);
noFill();
frameRate(10);
xpos=mouseX;
}


void draw(){
 if(mousePressed == true){
//   ellipse(width/2,height/2,r,r);
beginShape();
vertex(xpos+250-a,xpos+250-a);
vertex(xpos+300+b,xpos+250-b);
vertex(xpos+300+c,xpos+300+c);
vertex(xpos+250-d,xpos+300+d);

endShape(CLOSE);
  
   a=a+random(1,10);
   b=b+random(1,20);
   c=c+random(1,30); 
   d=d+random(1,10);
 }

}

