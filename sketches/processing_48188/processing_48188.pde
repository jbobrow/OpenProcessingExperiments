
int page = 1;  
PFont font;  
PFont font2;  
PVector location;
PVector velocity;
PVector mouse; 
   

  
void setup(){
size(800,700);
 location = new PVector(width, height);
  velocity = new PVector(mouseX,0);
  smooth();
  noStroke();
}

void draw(){
  mouse = new PVector(mouseX,mouseY);
  PVector dir = PVector.sub(mouse,location);
  dir.normalize();
  velocity.add(dir);
  velocity.limit(1);
  location.add(velocity);
 
  pushMatrix();
  fill(255,0,0,64);
    translate(location.x,location.y);
    dir.mult(50);
    ellipse(50,50,dir.x,dir.y);
  popMatrix();
  
 if (page == 1) {  
    pageOne();  
 }else if (page == 2) {  
    pageTwo();  
 }else if (page == 3) { 
    pageThree();  
 }else if (page == 4) {  
    pageFour();  
 }else if (page == 5) {  
    pageFive();  
 }else if (page == 6) {  
    pageSix();  
 }else if (page == 7) {  
    pageSeven();  
 }else if (page == 8) {  
    pageEight();  
 }else if (page == 9) {  
    pageNine();  

  background(0);
smooth();
fill(260,0,0,64);
ellipse(mouseX,mouseY,50,50);

noStroke();
fill(0,130,227,90);
ellipse(100,580,50,50);


}

}
void mousePressed() {  
  if (page == 1) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 2;}   
    else if (overButton(125, 410, 75, 35) == true) {  
      page = 3;}  
  } else if (page == 2) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 4;} 
    else if (overButton(400,410,75,35) == true) {  
      page = 5;}  
  } else if (page == 3) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 6;}  
    else if (overButton(400,410,75,35) == true) {  
      page = 7;}  
  } else if (page == 4) {  
    if (overButton(265,410,75,35) == true) {  
      page = 8;} 
   } else if (page == 5) {  
    if (overButton(265,410,75,35) == true) {  
      page = 9;}  
   }
}


boolean overButton(int x, int y, int w, int h) {  
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {  
    return true;   

  }   

  else {  
    return false;   

  }  

}  
   

void pageOne() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  

  text("You’re in a forest. You stand in a clearing, with a dense canopy of trees above",320,25);
  text("and to either side of you. The ground is damp and covered with ochre-tinted leaves.",320,40);  



  if (overButton(125, 410, 75, 35) == true) {  



  } 
  
  fill(0);    
  fill(255);  
  text("Go forward", 125 + 75/2, 410+20);  


  if (overButton(400,410,75,35) == true) {  
  }  

  
  fill(0);  
  rect(400,410,74,35);  
  fill(255);  
  text("Go backwards", 400 + 75/2, 410+20);  

  
}  
   

void pageTwo() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("You part the bushes and arrive at another clearing", 320,25);
  text("There is a bearded gnome sitting cross-legged against an elm.", 320,40); 
  text("He doesn’t look like he wants to be bothered...",320,55);  

 


  if (overButton(125, 410, 75, 35) == true) {  



  }  

  
  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Wake him", 125 + 75/2, 410+30);    

  if (overButton(400,410,75,35) == true) {  

  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("Go forward", 400 + 75, 410+30);  

     

}  

  
void pageThree() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("The gnome is startled by your hand on his shoulder and",320,25);
  text("blinks up at you, silent and dumbdounded. He brings a finger to",320,35);
  text("his lips, admonishing you to stay silent. He grabs your hand, motion",320,45);
  text("for you to guide him. .",320,55); 

  if (overButton(125, 410, 75, 35) == true) {  
  } 

  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("test", 125 + 75/2, 410+20);  
  text("test", 125 + 75/2, 410 + 40);  

     
  if (overButton(400,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("test", 400 + 75/2, 410+20);  

  text("test", 400 + 75/2, 410 + 40);  

}  

void pageFour() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("test.",320,25);  

  text("test.",320,45);  

     

  if (overButton(265,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(265,410,75,35);  

  fill(255);  

  text("Continue", 265 + 75/2, 410+30);  

     

}  


void pageFive() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("test.",320,25);  

  text("test.",320,45);  

     

  if (overButton(265,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(265,410,75,35);  

  fill(255);  

  text("Continue", 265 + 75/2, 410+30);  

     

}  

   

   

void pageSix() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You sit at the table, where the man in the hat proceeds to annoy you with riddles. Your patience is waning.",320,25);  

  text("Everyone changes seats and the 'Mad Hatter' offers you tea.",320,45);  



  if (overButton(125, 410, 75, 35) == true) {  



  }  

   

  fill(0);  

  rect(125, 410, 75, 35);  

  fill(255);  

  text("Drink tea", 125 + 75/2, 410+30);  

     


  if (overButton(400,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("test", 400 + 75, 410+30);  

     

}  

   
   

void pageSeven() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("test1.",320,25);  

  text("test1.",320,45);  

     

  if (overButton(265,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(265,410,75,35);  

  fill(255);  

  text("Continue", 265 + 75/2, 410+30);  

     

}  

   

   

void pageEight() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("test.",320,25);  

  text("test.",320,45);  

     


  if (overButton(125, 410, 75, 35) == true) {  



  }  

   

  fill(0);  

  rect(125, 410, 75, 35);  

  fill(255);  

  text("test", 125 + 75/2, 410+20);  

  text("test", 125 + 75/2, 410+40);  

     

  if (overButton(400,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("Run away", 400 + 75/2, 410+30);  

     

}  

 

void pageNine() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("test2.",320,25);  

  text("test2.",320,45);  

     

  if (overButton(125, 410, 75, 35) == true) {  



  }  

   

  fill(0);  

  rect(125, 410, 75, 35);  

  fill(255);  

  text("Listen to the", 125 + 75/2, 410+20);  

  text("Caterpillar", 125 + 75/2, 410+40);  

     
 

  if (overButton(400,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("test", 400 + 75/2, 410+30);  

     

}  


