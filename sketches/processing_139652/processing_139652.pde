
// andrea dunn
// sketch one

//background

      
//declare global variables
int eyeSize;
int peanut;
int butter;
int sandwich;
int food;
int drink;
int water;
int hungry;
int art;
int dinner;
int brows;
int eyes;
int eyezz; 
int head;

boolean clicked = false;

void setup(){
  size(300,300);
  background(153,0,51);
  noStroke();
}

void keyPressed(){
  clicked = ! clicked;
  
}
//head



void draw (){
  
  if (clicked == false){
    eyeSize = 10;
}   
  if (clicked == true){
    eyeSize = 7;
}

  if (clicked == false){
    peanut = 3;
}   
  if (clicked == true){
    peanut = 10;
}
    if (clicked == false){
    butter = -15;
}   
  if (clicked == true){
    butter = -19;
}
    if (clicked == false){
    sandwich = -1;
}   
  if (clicked == true){
    sandwich = -4;
}
    if (clicked == false){
    food = 0;
}   
  if (clicked == true){
    food = -4;
}
    if (clicked == false){
    drink= 0;
}   
  if (clicked == true){
    drink = 50;
}
    if (clicked == false){
    water = 0;
}   
  if (clicked == true){
    water = 30;
}
    if (clicked == false){
    hungry = 0;
}   
  if (clicked == true){
    hungry = 20;
}
    if (clicked == false){
    art = 20;
}   
  if (clicked == true){
    art = 25;
  }
    if (clicked == false){
    dinner = 7;
}   
  if (clicked == true){
    dinner = 13;
  }
      if (clicked == false){
    brows = -40;
}   
  if (clicked == true){
    brows = -50;
  }
        if (clicked == false){
    eyes = 10;
}   
  if (clicked == true){
    eyes = 15;
  }
          if (clicked == false){
    eyezz = 20;
}   
  if (clicked == true){
    eyezz = 18;
  }
    if (clicked == false){
    head = 70;
}   
  if (clicked == true){
    head = 50;
}

  translate(150,150);
  fill(153,204,255);
  ellipse(-1,-3,170,68);
   
  fill(0,0,0);
  ellipse(80,20,7,10);
  
  background(153,0,51);
  
  fill(153,204,255); 
  rect(-75,-89,150,190,head);
  
  
  fill(153,204,255);
  ellipse(-75,13,13,15);
  
  fill(153,204,255);
  ellipse(75,13,13,15);
  
  //eyes
  
  fill(255,255,255);
  ellipse(20,-20,art,art);
  
  fill(255,255,255);
  ellipse(-20,-20,20,25);
  
  fill(0,0,0);
  ellipse(-20,-20,eyeSize,eyeSize);
  
  fill(0,0,0);
  ellipse(20,-20,eyes,eyes);
  
  //nose
  
  fill(255,255,255);
  triangle(0,-5,-7,dinner,7,dinner);
  
  //mouth
  
  fill(255,102,153);
  rect(butter,30,30,25,peanut,peanut,30,30);
  
  fill(0,0,0);
  rect(-20,30,40,3);
  
  fill(5,5,5);
  rect(sandwich,30,1,16);
  
  fill(255,102,153);
  ellipse(food,drink,water,hungry);
  
  //cheeks
  
  fill(200,150,200);
  ellipse(-40,10,30,30);
  
  fill(200,150,200);
  ellipse(40,10,30,30);
  
  //eyebrows
  fill(0,0,0);
  rect(-30,brows,20,5);
  
  fill(0,0,0);
  rect(10,-40,20,5);
  
  //hair
  
  fill(0,0,0);
  quad(-40, -130, 0, -140, 15, -93, -17, -93);
  
  fill(0,0,0);
  quad(-30, -140, 10, -150, 25, -90, -7, -93);
  
  fill(0,0,0);
  quad(-20, -110, 30, -120, 35, -86, 0, -93);
  
  fill(0,0,0);
  triangle(-18,-96,27,-92,0,-60);
  
  fill(255,0,0);
  triangle(-28, -110,0,-102,-19,-97);
}





