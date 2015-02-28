
color cr=color(255,0,0);      //defines RED
color cg=color(0,255,0);      //defines GREEN
color cb=color(0,0,255);      //defines BLUE
color cy=color(255,255,0);    //defines YELLOW
color[] colors = {            //random selects one of above colors
  cr,cg,cb,cy
};
color c1=(colors[int(random(0,4))]);  //assigns a random color from above to c1-4
color c2=(colors[int(random(0,4))]);
color c3=(colors[int(random(0,4))]);
color c4=(colors[int(random(0,4))]);
             
Stripe[]stripes=new Stripe [14];

void setup() {
  size(800,507);
  for (int i =0; i < stripes.length; i++) {
    stripes[i] = new Stripe();
  }
}
  
 void draw() {  
   background(c3);
   for (int i =0; i < stripes.length; i++) {
   //check if mouse is over the stripe
    stripes[i].move();
    stripes[i].display();
    stripes[i].rollover(mouseX,mouseY);
  }
 }
class Stripe {
 float x;
 float speed;
 float w;//width of stripe
 boolean mouse; //state of stripe 
 
 Stripe() {
   x = 0;
   speed = random(1);
   w= random (10,30);
    mouse = false;
 }
 //Draw Stripe
 void display() {
   if (mouse) {
     fill(c1);
   } else {
     fill (c2);
   }
   noStroke();
   rect(x,0,w,height);
 }

  
 //move stripe
 void move() {
 x+= speed;
 if (x > width+20) x = -20;
 }
 
 void rollover (int mx,int my) {
   if (mx > x && mx < x + w) {
     mouse = true;
   }else{
     mouse = false;
   }
 }
}

