

void setup() {  //setup function called initially, only once
   size(400,250);
   background(0,255,255);
}

void draw() {  //draw function loops 
   if(mousePressed == true) {
      snowman(mouseX,mouseY);
   }
}
void snowman(int x,int y) {
  ellipse(x,y,20,20);
  fill(0,0,0);
  ellipse(x+5,y-2,3,3);
  ellipse(x-5,y-2,3,3);
  fill(255,140,0);
  triangle(x,y,x-7,y+3,x,y+3);
  fill(255,255,255);
  ellipse(x,y+25,30,30);
  fill(0,0,0);
  ellipse(x,y+24,5,5);
  ellipse(x,y+15,5,5);
  ellipse(x,y+34,5,5);
  fill(255,255,255);
  ellipse(x,y+60,40,40);
  ellipse(x-1,y+6,2,2); /*mouth*/
  fill(0,0,0);
  ellipse(x+15,y-15,3,3);
  line(x+16,y-16,x+16,y-30);
  ellipse(x+7,y-18,3,3);
  line(x+8,y-19,x+8,y-33);
  fill(255,255,255);
}
