
int x=-400;
int y=450;
void setup(){
  size(500,300);
  smooth();
  noStroke();
}
int xspeed=3;
int yspeed=3;
void draw(){
  //for (int i=0; i<100; i=i+10){
  background(137,229,255);
  frameRate(30);
  //pushMatrix();
  //translate(0,50);
  //rotate(radians(15));
  rectMode(CENTER);
  fill(255,192,137);
  rect(x,80,80,60,40);
  //popMatrix();
  //triangle(x-50,30,x-50,70,x,50);
  x=x+xspeed;
  y=y-yspeed;
  if ((x<=-400)||(x>=600)){
    xspeed=xspeed*-1;}
  if (xspeed>0){
    triangle(x-75,50,x-65,110,x,80);
    fill(251,126,67);
    rect(x-10,90,20,15,0,0,75,0);
  } 
  fill(255,192,137);
  if (xspeed<0){
    triangle(x+75,50,x+65,110,x,80);
    fill(251,126,67);
    rect(x+10,90,20,15,0,0,0,75);
  }
//}
   if (xspeed>0){
     fill(0);
     ellipse(x+5,65,15,15);
     fill(255);
     ellipse(x+6,60,6,6);
   }
   if (xspeed<0){
     fill(0);
     ellipse(x-5,65,15,15);
     fill(255);
     ellipse(x-2,62,6,6);
     noFill();
     stroke(0);
     strokeWeight(2);
     line(x,59,x-10,55);
   }
   noStroke();
    if (xspeed<0){//shark
     fill(150);
     rectMode(CORNER);
     rect(x+150,50,130,80,50);
     fill(255);
     triangle(x+175,70,x+195,65,x+195,75);
     fill(150);
     triangle(x+245,90,x+315,50,x+315,130);
     triangle(x+195,50,x+240,50,x+240,20);
    }
   for (int i=0; i<100; i=i+20){
   float r=random(255);
   fill(40,191,r,100);
   ellipse(x,y,i,i);
   if (y<=0){
     y=350;
   }
   fill(40,r,251,100);
   ellipse(x+100,y-50,i/2,i/2);
   fill(r,191,251,100);
   ellipse(x+250,y-150,i/3,i/3);
   }
}

