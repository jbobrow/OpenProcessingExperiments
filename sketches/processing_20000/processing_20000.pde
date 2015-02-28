



void setup() {
  size(1000,600);
  background(0);
  noStroke();
  smooth();
  frameRate(10000);
}



int x = 0;
int x2 = 500;
int x3 = 250;
int x4 = 750;
int x5 = 1000;
int x6 = 0;


void draw () {
  
 

  fill(0);
  rect(0,290,1000,22);   //draws rect to show movement

  if(x >= width) {  //sets oscillating extents
    x = - width;
  }

 fill(255);
  ellipse(x2,height/2,20,20);   //stationary ellipses
 
 fill(255);
  ellipse(x3,height/2,20,20);
 
 fill(255);
  ellipse(x4,height/2,20,20);
 
 fill(255);
  ellipse(x5,height/2,20,20);
  
   fill(255);
  ellipse(x6,height/2,20,20);
 


  fill(255);
  ellipse(abs(x),height/2,20,20);  //oscillating ellipse
  x++;

  if(abs(x)==x2) {
    fill(random(100,255),random(75,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));  //500 reference ellipse
    fill(130,180,100,random(0,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));
  }
  
   if(abs(x)==x3) {
    fill(random(100,255),random(75,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));   //250 reference ellipse
    fill(130,180,100,random(0,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));
  }
 
 if(abs(x)==x4) {
    fill(random(100,255),random(75,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));  //750 reference ellipse
    fill(130,180,100,random(0,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));
  }
 
  if(abs(x)==x5) {
    fill(random(100,255),random(75,255));          
    rect(random(200,800),random(0,600),random(10,70),random(10,70));  // 1000reference ellipse
    fill(130,180,100,random(0,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70)); 
  
  if(abs(x)==x6) {
    fill(random(100,255),random(75,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70));  // 0 reference ellipse
    fill(random(100,255),random(75,255));
    rect(random(200,800),random(0,600),random(10,70),random(10,70)); 
}

  }
}

 void keyPressed(){
if((key =='b')||(key =='B')){
save("DRAWINGMACHINE.jpg");
println("saved");
}
}

