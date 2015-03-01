
/*Day 1, Homework: Create the Character, by Brian Tsukerman*/
int bigger = 20;
int smaller = 5;

void setup(){
  size(1000,500); 
}

void draw(){
  background(255);  

  //Draw bear's left ear
  fill(135,100,50);
  ellipse(width/2-125, height/2-125, 150, 150);

  //Draw bear's left inner ear
  fill(206,187,75);
  ellipse(width/2-125,height/2-125,100,100);

  //Draw bear's right ear
  fill(135,100,50);
  ellipse(width/2+125, height/2-125, 150, 150);

  //Draw bear's right inner ear
  fill(206,187,75);
  ellipse(width/2+125, height/2-125, 100, 100);
  
  //Draw bear's head
  fill(135,100,50);
  ellipse(width/2,height/2,300,300);

  //Draw bear's eyes
  fill(0);
  ellipse(width/2-50,height/2-50,20,20);    
  ellipse(width/2+50,height/2-50,20,20);      

  //Draw bear's eye shine
  fill(255);
  ellipse(width/2-55, height/2-55, 3, 3);
  
  ellipse(width/2+45,height/2-55,3,3);

  //Draw bear's nose
  fill(0);
  triangle(width/2, height/2+50, width/2-50, height/2, width/2+50, height/2);

  //Draw bear's jowl
  fill(135,100,50);
  ellipse(width/2-50,height/2+50, 100, 100);
  ellipse(width/2+50,height/2+50, 100, 100);
}


