

void setup() {  

  background(200,200,200); 
  size(400, 400);
 
}

void draw() { 
 
 for (int a = 10%100; a < 400; a = a+80) {
  
  stroke(255,255,255);
  fill(200,200,200);
  ellipse(a,50,random(60),random(60));
  ellipse(a+50,150,random(60),random(60));
  ellipse(a,250,random(60),random(60));
  ellipse(a+50,350,random(60),random(60));
  line(40+a,0,40+a,10);
  line(a,90,a,100);
  line(a,290,a,300);
  
}


 
}

                
                                
