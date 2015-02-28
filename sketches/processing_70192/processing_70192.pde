
int mywidth=5; 
 int myheight=200;
 int x= 25;
 int y= 250;
 int z=300;
int k= 120;
int m= 20;
int p= 120;
int w= 200;


void setup (){
  size(400,400);
  background (200,200,225);
}

void draw() {
  

  
  //first small square lines 
  if (keyPressed == true) {
    fill(0);
  } else {
    fill(200,mywidth,y,20);
  }
  //first square left
  rect(x, x, 2, 70);
  rect (x+6,x,2,70);
 rect (x+12,x,2,70);
 rect (x+18,x,2,70);
  rect (x+24,x,2,70);
  rect (x+30,x,2,70);
   rect (x+36,x,2,70);
   rect (x+42,x,2,70);
   rect (x+48,x,2,70);
    rect (x+54,x,2,70);
     rect (x+60,x,2,70);
     
     //2nd aquare    
 rect (y,y,9,250);
 rect (y-12,y,9,250);
 rect (y-24,y,9,250);
 rect (y-36,y,9,250);
 rect (y-48,y,9,250);
 rect (y-60,y,9,250);
 
//3rd square

rect (k,z,100,5);
rect (k,z+10,100,5);
rect (k,z+20,100,5);
rect (k,z+30,100,5);
rect (k,z+40,100,5);
rect (k,z+50,100,5);
rect (k,z+60,100,5);

//4th square

rect (m, 110, 300, 10);
rect (m+5, 110, 300, 10);
rect (m+10, 110, 300, 10);
rect (m+15, 110, 300, 10);
rect (m+20, 110, 300, 10);
rect (m+25, 110, 300, 10);
rect (m+30, 110, 300, 10);
rect (m+35, 110, 300, 10);
rect (m+40, 110, 300, 10);

// 5th long square
rect (m, p, 300, 10);
rect (m+5, p, 300, 10);
rect (m+10, p, 300, 10);
rect (m+15, p, 300, 10);
rect (m+20, p, 300, 10);
rect (m+25, p, 300, 10);
rect (m+30, p, 300, 10);
rect (m+35, p, 300, 10);
rect (m+40, p, 300, 10);

rect (m, 130, 300, 10);
rect (m+5,130, 300, 10);
rect (m+10,130, 300, 10);
rect (m+15,130, 300, 10);
rect (m+20,130, 300, 10);
rect (m+25,130, 300, 10);
rect (m+30,130, 300, 10);
rect (m+35,130, 300, 10);
rect (m+40,130, 300, 10);

rect (m,140, 300, 10);
rect (m+5,140, 300, 10);
rect (m+10,140, 300, 10);
rect (m+15,140, 300, 10);
rect (m+20,140, 300, 10);
rect (m+25,140, 300, 10);
rect (m+30,140, 300, 10);
rect (m+35,140, 300, 10);
rect (m+40,140, 300, 10);

rect (m, 150, 300, 10);
rect (m+5,150, 300, 10);
rect (m+10,150, 300, 10);
rect (m+15,150, 300, 10);
rect (m+20,150, 300, 10);
rect (m+25,150, 300, 10);
rect (m+30,150, 300, 10);
rect (m+35,150, 300, 10);
rect (m+40,150, 300, 10);

rect (m, 160, 300, 10);
rect (m+5,160, 300, 10);
rect (m+10,160, 300, 10);
rect (m+15,160, 300, 10);
rect (m+20,160, 300, 10);
rect (m+25,160, 300, 10);
rect (m+30,160, 300, 10);
rect (m+35,160, 300, 10);
rect (m+40,160, 300, 10);

}

//3 small circle upperleft
void mousePressed(){
stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(0,20,50,50);
  
  stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(30,50,50,50);
  //large middle circle left
   stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(100,200,myheight,myheight);
  // large cirlce bottom left
    stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(x,y,myheight,myheight);
  
  //meduim circle right
  stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(300,20,120,120);
  
  // second meduim circle
  stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(300,150,250,250);
  
  //lower right circle 
  
  stroke(47,mywidth,93,20);
  fill(47,mywidth,93,20);
  ellipse(275,350,170,170);
 
  }

void keyPressed () {
if (key== 't') {
  //first set of lines upper right
  fill (0);
rect (w+10,50,1,w);
 fill (0);
rect (w+20,50,1,140);
 fill (0);
rect (w+30,50,1,140);
 fill (0);
rect (w+40,50,1,140);
 fill (0);
rect (w,50+50,1,140);
 fill (0);
rect (w,50+60,1,140);



 fill (0);
rect (90-1,275,4,150);
  fill (0);
rect (90+10,275,4,150);
 fill (0);
rect (90+20,275,4,150);
 fill (0);
rect (90+30,275,4,150);
 fill (0);
rect (90+40,275,4,150);
  fill (0);
rect (90+50,275,4,150);
 fill (0);
rect (190+60,275,4,150);


  
}
 
  
}

