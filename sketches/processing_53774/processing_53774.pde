
void setup(){
  size(600,600);
  background(0,0,0);
}

void draw(){
background(mouseX-45,mouseX-45,mouseX-45);


  

 noStroke();
  fill(0,134,pmouseX-50,700-mouseX-50);
  rect(300,550,300,50-mouseX);
  
 fill(100,mouseX-50,15,600-mouseX-50);
  rect(50,300,-50+mouseX,300);
  
  fill(0,134,pmouseX-50,600-mouseX-50);
  rect(0,50,300,-50+mouseX);
  
  fill(100,mouseX-50,15,700-mouseX-50);
  rect(550,0,50-mouseX,300);
  
  fill(225,255,255,mouseX-200);
  rect(300,1,300,300);
  
  fill(225,255,255,mouseX-200);
  rect(1,300,300,300);

  noStroke();
 fill(217,255,255,mouseX-200);
 rect(300,550,300,50);
 
  noStroke();
 fill(217,255,255,mouseX-200);
 rect(1,1,300,50);
 
 noStroke();
 fill(217,255,255,mouseX-300);
 rect(1,1,50,600);
 
 noStroke();
 fill(217,255,255,mouseX-300);
 rect(550,1,50,600);
}

                
                
