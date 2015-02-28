
int x =10;
int colour =0;
float rotation =0;
float spin =0;

void mousePressed(){
  setup();
}
  
void setup(){
  
  size (700,400);
  background (255);
  
}

void draw(){
  
  fill(255,8);
  rect (0,0,700,400);
  
 
  if (mouseX < 233 && mouseY< 200) {
     stroke(154,0,255);
     strokeWeight(0.9);
     fill(154,0,255);
    ellipse(mouseX,mouseY,x,x);
    ellipse(mouseY,mouseX,x,x);
   
  }
  
  if ((mouseX>233 && mouseX<466) && (mouseY<200)){
    rotation =0;
    translate(mouseX,mouseY);
    rotate(radians(spin));
    spin = spin+1;
    
    while(rotation<360){
      
      rotate(radians(rotation));
      line (0,0,30,30);
      rotation = rotation + 10;
      line (0,0,30,30);
      rotation = rotation + 15;
      line (0,0,30,30);
      rotation = rotation + 20;
    }
  }

  if ((mouseX>466 && mouseX<700) && (mouseY<200)){
    stroke(0,255,179);
  if (mousePressed &&(mouseButton == LEFT)){
    noStroke();
    fill(125,239,38);
  }else if (mousePressed && (mouseButton == RIGHT)){
    noStroke();
    fill(280,0,40);
  }else{
    fill(255,80);
  }
    ellipse(mouseX/.9,mouseY/.9,x,x);    
  }  
  
  if ((mouseX<233) && (mouseY>200)){
    if (mousePressed &&(mouseButton == LEFT)){
    noStroke();   
    fill(125,239,38);
  }else if (mousePressed && (mouseButton == RIGHT)){
    noStroke();
    fill(280,0,40);
  }else {
    fill(255,80);
  }
    
    ellipse(mouseX,mouseY,x,x);
  }
  
  if ((mouseX>233 && mouseX<466) && (mouseY>200)){
    stroke(0,126,255);
    fill (0,126,255);
    ellipse(mouseY,mouseX,x,x);
    rect(mouseX,mouseY,x,x,x,x);
  }
  
  if ((mouseX>466 && mouseX<700) && (mouseY>200)){
    strokeWeight(2.3); 
       rotation =0;
    translate(mouseX,mouseY);
    rotate(radians(spin));
    spin = spin+1;
    
    while(rotation<360){
      
      rotate(radians(rotation));
      line (0,0,30,30);
      rotation = rotation + 10;
      line (0,0,30,30);
      rotation = rotation + 15;
      line (0,0,30,30);
      rotation = rotation + 20;
  }
 }
}
  


