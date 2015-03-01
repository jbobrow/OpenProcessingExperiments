


void setup(){

size(750,750);

}


void draw(){
  

if(keyPressed)
{
  if(key == '1')
  {
    stroke(0,0,0);
    fill(0,random(255),0);
    triangle(mouseX,mouseY,mouseX+10,mouseY+10,mouseX-10,mouseY-10);
   
  }

if(key == '2')
  {
    noStroke();
    fill(random(255),0,random(255));
    rect(mouseX-10,mouseY-10,mouseX-10,mouseY-10,mouseX+10,mouseY+10);
   
  }
if(key == '3')
  {
    int farts = random(6);
    //println(farts);
    if(farts < 1){    
        
     fill(random(101,255),random(101,255),random(101,255));
     quad(mouseX-10,mouseY-10,mouseX-50,mouseY+50,mouseX+10,mouseY+10,mouseX+100,mouseY+100);
   
    }
    
    else if( farts < 2)
    {
      fill(random(100),random(100),random(100));
     triangle(0,0,mouseX-100,mouseY-100,mouseX+10,mouseY+10);
    }
    else if (farts < 3) 
    {
     noFill();
     stroke(random(255),random(255),random(255));
     ellipse(mouseX,mouseY,random(250),random(250)); 
    }
    else if (farts < 4) {
    fill(random(101,200),random(101,200),random(101,200));
     triangle(750,750,mouseX-100,mouseY-100,mouseX+10,mouseY+10);
    }
    else if (farts < 5) {
    fill(random(200,255),random(200,255),random(200,255));
     triangle(0,750,mouseX-100,mouseY-100,mouseX+10,mouseY+10);
    }
    else{
    fill(random(200),random(200),random(200));
     triangle(750,0,mouseX-100,mouseY-100,mouseX+10,mouseY+10);
    }
  }
 
 
  }

}



