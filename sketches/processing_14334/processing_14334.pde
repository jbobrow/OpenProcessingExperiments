
//int

int a = 300;
int b = 255;

void setup() {
  size(600,600);
  background(b,b,b);
  smooth();
}  

// for loof

void draw() { 

  for (int x=0; x<width+20; x=x+40)
  {
    for (int y=0; y<height+20; y=y+40)
    {
      fill(235,b,b);
      noStroke();
      ellipse(x,y,40,40);

      // code arrange  &  color

      fill(30,180,150);  
      rect(30,50,180,180);  
      fill(30,150,180);  
      rect(240,30,120,120);  
      fill(60,60,220);  
      rect(380,10,80,80);  
      fill(200,150,250);  
      rect(500,0,100,150);  
      fill(250,80,150);  
      rect(380,230,200,270);  
      fill(b,150,100);  
      rect(20,280,a,a);  
      fill(235,250,250);  
     
       //mouse
     
      if (mousePressed == false) {
        rect(550,0,50,50);  
        rect(415,a-35,130,200);  
        rect(100,360,140,140);
      }

 noStroke(); 

      if ((mouseX >=30) && (mouseX <210) &&   
        (mouseY >=50) && (mouseY <=230 )) {  
        fill(b,b,180);  
        rect(30,50,180,180);
      }  
      else if((mouseX >=240) && (mouseX <=360) &&       
        (mouseY >=30) && (mouseY <150)) {  
        fill(b,200,150);  
        rect(240,30,120,120);
      }  

      else if((mouseX >=380) && (mouseX <460) &&  
        (mouseY >=10) && (mouseY <90)) 
     
        {  fill(b,160,100);  
        rect(380,10,80,80);  }  
        
      { point(mouseX, mouseY);  
        fill(0,b-100,b);
        ellipse(mouseX,mouseY, 30,30);  }
      } }

  noCursor(); 



  //key

  if(keyPressed==true)  

    stroke(50,200,150);  
  fill(255,0,0,0); 
  strokeWeight(65);  
  rect(385,235,180,250); 
  rect(20,280,a,a); 
  rect(500,0,100,150);
}


