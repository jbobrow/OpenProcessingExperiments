
colorMode(HSB, 100, 20, 10);


                
                void setup() {
  size(200,200);
}


void draw() {
  translate(240,240);
  rotate(radians(180));
  scale(1.4);
  myDraw();
 
 
  
}


void myDraw() {
  //얼굴
strokeWeight(5);
fill(220,10,50);
ellipse(100,100,150,150);
 
  
//눈1
 
strokeWeight(3);
fill(0,0,0);
ellipse(145,100,20,20);
  
strokeWeight(1);
fill(255);
ellipse(140,102,5,5);
 
  
  
//눈2
strokeWeight(3);
fill(0,0,0);
ellipse(50,100,20,20);
  
strokeWeight(1);
fill(255);
ellipse(45,102,5,5);
  
  
//코
fill(100,50,50);
ellipse(100,120,10,10);
  
//입
strokeWeight(2);
line(88,143,100,150);
line(100,150,112,143);


  
}



