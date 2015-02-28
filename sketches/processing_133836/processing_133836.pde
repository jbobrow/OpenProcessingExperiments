
/*
Jaeseong Yi
Feb 13 2014
Creative Computing Section B
Benjamin Bacon
*/

void setup() {
size(800,800);
smooth();
}

void draw() {
   int a = int(random(0,100)); //red
   int b = int(random(0,200)); //green
   int c = int(random(0,50)); //blue
   int d = int(random(0,100)); //size
   int e = int(random(0,100)); //transparency
   
   noStroke();
   fill(a,b,c,e);
   ellipse(mouseX,mouseY,d,d);
   
   int a1 = int(random(0,215)); //red
   int b1 = int(random(0,2)); //green
   int c1 = int(random(0,170)); //blue
   int d1 = int(random(0,120)); //size
   int e1 = int(random(0,100)); //transparency
   
   noStroke();
   fill(a1,b1,c1,e1);
   ellipse(mouseX-100,mouseY-100,d1,d1);
   
   int a2 = int(random(0,3)); //red
   int b2 = int(random(0,87)); //green
   int c2 = int(random(0,213)); //blue
   int d2 = int(random(0,20)); //size
   int e2 = int(random(0,100)); //transparency
   
   noStroke();
   fill(a2,b2,c2,e2);
   ellipse(mouseX+100,mouseY+100,d2,d2);
   
   int a3 = int(random(200,225)); //red
   int b3 = int(random(200,225)); //green
   int c3 = int(random(200,225)); //blue
   int d3 = int(random(0,60)); //size
   int e3 = int(random(0,100)); //transparency
   
   noStroke();
   fill(a3,b3,c3,e3);
   rect(mouseX-100,mouseY+100,d3,d3);
   
 
}



