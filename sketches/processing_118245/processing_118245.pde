
int number=20;
Orb orb1;
Orb[] ball=new Orb[number];
 
void setup(){
  size(1000,350);
//for (int i = 0; i < C.length; i++) {
  //C[i]=new Orb(random(width),random(height),random(-3,3),random(-3,3),random(10,40));
  //}
  //orb1=new Orb(random(width),random(height),random(-3,3),random(-3,3),random(10,40),color(234,26,26));
   
  for (int i=0;i<number;i++){
  ball[i]= new Orb(random(-3,3),random(-3,3),50,color(random(255),random(255),random(255)));
  }
   
  for(int i=0; i<number; i++)
  {
    for(int j=0; j<number; j++)
    {
      if(j!=i)
      {
        
        float distance = dist(ball[i].x,ball[i].y,ball[j].x,ball[j].y);
        
        if(distance<=(ball[i].size+ball[j].size)/2){
       //if(distance<=(ball[i].size+ball[j].size)/2)
     // {
        ball[i].size = distance/2;
         ball[j].size = distance/2;
       // ball[i].x=ball[j].x+ball[j].size;
       
       // }  
        }
      }
    }
  } 
 
   
   
}
 
void draw(){
  background(255);
  //fill(255,20);
  //rect(0,0,width,height);
  //noFill();
//orb1.display();
//orb1.move();
 for (int i=0; i<number;i++){
ball[i].move();
ball[i].collision();
ball[i].display();
}  

 
 
}
 
void mousePressed(){
  setup();
}
 
class Orb {
  float x,y,xspeed,yspeed,size;
  color colors;
  
   
  Orb(float xposspeed,float yposspeed,float _size,color _colors){
   x=random(width);
  y=random(height);
  xspeed=xposspeed;
  yspeed=yposspeed;
  size=_size;
  colors=_colors; 
  }
  
 void display(){
  fill(colors,100);
  //noStroke();
  stroke(colors);
  strokeWeight(1);
  ellipse(x,y,size,size);
   
 }
  
 void move(){
   x+=xspeed/3;
   y+=yspeed/3;
    
   if(x+size/2>=width ){
    xspeed=-xspeed;
    x=width-size/2;
     colors=color(random(255),random(255),random(255));
   }
   if( x-size/2<=0){
     xspeed=-xspeed;
     x=size/2;
   }
   if(y+size/2>=height ){
    yspeed=-yspeed;
    y=height-size/2;
     colors=color(random(255),random(255),random(255));
   }
   if( y-size/2<=0){
     yspeed=-yspeed;
     y=size/2;
   }
  }
    
void collision() {
   
    for ( int i=0; i<ball.length; i++){
       if (dist(x,y,ball[i].x,ball[i].y)<= size/2+ball[i].size/2 && ball[i]!=this ){
         xspeed=-xspeed;
          yspeed=-yspeed;
         
          colors=color(random(255),random(255),random(255));
//      size=size/2;
//      if(size<20){
//        size=10;
//       }
       }
       if(dist(x,y,ball[i].x,ball[i].y)<=100){
         stroke(colors);
       line(x,y,ball[i].x,ball[i].y);
     }
    } 
   
   for ( int i=0; i<ball.length-1; i++){
     if(dist(x,y,ball[i].x,ball[i].y)<=100){
       noStroke();
       fill(colors,15);
        triangle(x,y,ball[i].x,ball[i].y,ball[i+1].x,ball[i+1].y);
       
     } 
   }
   
    
}
}

