

void setup(){
  size(600,600); smooth();
}
void draw(){
  background(193,179,158);
 
  if(keyPressed==true){
  fill(255); rect(0,0,600,600);
}

fill(143,132,102);
rect(0,0,320,320);
for (int x = 320; x < 600; x += 80){
  for(int y = 320; y < 600; y += 80){
    rect(x,y,40,40);
  }
}

int radius = 20;
float check1= dist(100,50, mouseX, mouseY);
if(check1<radius){fill(250,30,10);
}else{fill(0);}
ellipse(100,50,40,40);
rect(0,320,320,280);
rect(320,0,280,320);


float check2 = dist(100,110, mouseX, mouseY);
if(check2<radius){fill(255,255,100);
}else{fill(0);}
ellipse(100,110,40,40);  
strokeWeight(25); 
ellipse(420,320,100,100);

float check3 = dist(100,170, mouseX, mouseY);
if(check3<radius){fill(80,0,255);
}else{fill(0);}
ellipse(100,170,40,40);


stroke(50);   
strokeWeight(15);   
fill(255,0,100);   
ellipse(340,160,240,240);  //biggest 

stroke(0);   
strokeWeight(2);   
fill(0);   
ellipse(500,70,60,60);  //smallist






strokeWeight(25); 
fill(255);   
//ellipse(420,320,100,100); //middle


noFill();   
strokeWeight(20);    
ellipse(400,600,800,800);  //black line 

stroke(255);   
strokeWeight(15);   
ellipse(400,600,880,880); // down  

strokeWeight(6);  
ellipse(400,600,980,980);  //up



strokeWeight(5); stroke(3);  
quad(440,320,320,380,400,540,520,420);  

noStroke();   
fill(255,255,0);   
quad(120,500,125,515,365,415,360,400);  

fill(80,0,255);   
quad(400,400,260,460,263,470,403,410);    

if(mousePressed == true) {
  for (int y = 0; y <= height; y +=20) {
for (int x = 0; x <= width; x += 25) {
ellipse(x , y, 30 - y/10.0, 30 - y/10.0);}
  }
  }  
  
}


