
//SOMA2607: Week 3 Homework_Expressive Eyes
//tutorial group: Fri 2-5pm
//z3430312,DongniLi

void setup(){
  size(500,500);
  smooth();
  noStroke();
}

void draw(){
  ellipseMode(CENTER);
  
  //ear_left
  fill(255);
  ellipse(150,100,80,80); 
  fill(random(0,255),random(0,255),random(0,255),random(0,63));
  ellipse(150,100,60,60); 
 
  //ear_right
  fill(255);
  ellipse(350,100,80,80);
  fill(random(0,255),random(0,255),random(0,255),random(0,63));
  ellipse(350,100,60,60);
 
  //upper_Head
  fill(255);
  ellipse(250, 180, 180, 190);
 
  //lower_Head
  fill(255);
  ellipse(250, 310, 210, 190);
 
  if(mousePressed == false){
   
  float x1 = map(mouseX, 0, 500, 205, 245);
  float x2 = map(mouseX, 0, 500, 255, 305);
  float x3 = map(mouseY, 0, 500, 115, 155);
 
  //eye_left
  fill(0);
  ellipse(x1, x3, 20, 20);
 
  //eye_right
  fill(0);
  ellipse(x2, x3, 20, 20);
  
  } else {
  noFill();
  stroke(218, 218, 218);


  line(200, 135, 235, 155);
  line(200, 150, 235, 140);
  
  line(300, 135, 265, 155);
  line(300, 150, 265, 140);
   
 }
   
  //nose
  fill(0);
  ellipse(250, 280, 80, 80);
 
  //mouse
  fill(0);
  ellipse(250, 360,mouseX/10,mouseY/10);

}


