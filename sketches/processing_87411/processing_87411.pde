
//float timer = 0.0
 float pic = 1;

void setup(){
  

  size(800,800);
  background(0);
  
 
}

void draw (){
  frameRate(30);
noStroke();


  
  
    if (pic < 2) {
      
       fill(random(0, 255), random(0, 255), random(0,255));
  ellipse(mouseX,mouseY,200,200);
  fill(random(0, 255), random(0, 255), random(0,255));
  ellipse(mouseX,mouseY,100,100);
      
  //random colors
   fill(random(0, 255), random(0, 255), random(0,255));
  //suare of circles
   ellipse(random(0, 50), random(0, 800), 100,100);
   ellipse(random(750, 800), random(0, 800), 100,100);
   ellipse(random(0, 800), random(0, 50), 100,100);
   ellipse(random(0, 800), random(750, 800), 100,100);
   //cross of circles
   ellipse(random(430, 470), random(0, 800), 100, 100);
   ellipse(random(0, 800), random(435,465), 100, 100);
    }
   
   if (pic < 3 && pic > 1) {
     
  fill(random(0, 255), random(0, 255), random(0,255));
  rect(mouseX,mouseY,200,200);
    
     fill(random(0, 255), random(0, 255), random(0,255));
  rect(mouseX,mouseY,100,100);
     
     fill(random(0, 255), random(0, 255), random(0,255));
       rect(random(100, 600), random(0, 800),200,200);
   }  
  
   /*if (pic > 2) {
 fill(random(0, 255), random(0, 255), random(0,255));
  //suare of circles
   ellipse(random(0, 50), random(0, 800), 100,100);
   ellipse(random(750, 800), random(0, 800), 100,100);
   ellipse(random(0, 800), random(0, 50), 100,100);
   ellipse(random(0, 800), random(750, 800), 100,100);
   //cross of circles
   ellipse(random(430, 470), random(0, 800), 100, 100);
   ellipse(random(0, 800), random(435,465), 100, 100);
    
     
     fill(random(0, 255), random(0, 255), random(0,255));
       rect(random(100, 600), random(0, 800),300,300);
       
       fill(random(0, 255), random(0, 255), random(0,255));*/
}

void mouseClicked(){
  
  if (pic < 2) {
    pic +=1;
  }
  else{
    pic = 1;
  }
}


