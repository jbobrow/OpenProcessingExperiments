
void setup(){
  size(400,400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(100);

}
 int x=115;
  int y=100;
      int  P = 0;
      int P2=0;
void draw(){
  pizza(x,y);
}
// larger pizza right click
void mousePressed () {
  background(100);
    x+=4;
      y+=4;
      P++;
      P2++;
      pizza(x,y);
  }
  // smaller pizza press l
  void keyPressed(){
    background(100);
    if(key == 'l'){
    x-=4;
      y-=4;
      pizza(x,y);
    P--;
     P2--;
  }
  // peperoni press p
      if(key =='p'){
        background(100);
        pizza(x,y);
        fill(245,15,64);
        ellipse(random(150+P,250+P),random(150+P2,250+P2),5,5);
        noFill();
      }
      // bacon click b
       background(100);
        pizza(x,y);
       if(key =='b'){
        fill(247,154,149);
       rect(random(150+P,250+P),random(150+P2,250+P2),5,10);
        noFill();
  }
  // ham click h
   if(key =='h'){
      background(100);
        pizza(x,y);
        fill(90,51,12);
        ellipse(random(150+P,250+P),random(150+P2,250+P2),5,5);
        noFill();
  }
  // vegitables click v
   if(key =='v'){
         background(100);
        pizza(x,y);
        fill(46,144,16);
        ellipse(random(150+P,250+P),random(150+P2,250+P2),5,5);
        noFill();
  }
  }


//pizza

  void pizza(float A, float B){
  fill(194,162,86);
  ellipse(width/2,height/2,A,A);
  fill(255,240,136);
  ellipse(width/2,height/2,B,B);

  
}  

