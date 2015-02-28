
//My program
//Hannah Lingle
// With help from Processing.org
//http://www.ehow.com/facts_4928026_symptoms-first-year-stress-college.html#ixzz272bzpKGX
//http://www.ehow.com/list_6544737_stress-statistics-college-students.html#ixzz272ba8JvX
float X;
float Y;
void setup(){
  textFont(createFont("TOSCAZERO", 25));
  size(800,800);
  smooth();
  float X=1;
  float Y=2;
  
}
 
void draw(){
background(255);
noFill();
noStroke();
  if(X>10){
    X=-1;
  }
  if(mouseX >100 && mouseX < 150 && mouseY > 200 && mouseY < 250){
    fill(255,0,0);
    }else{
    fill(184,252,251);
    ellipse(X++,100,600,600);
  if(mouseX >200 && mouseX < 250 && mouseY > 100 && mouseY < 150){
    }else{
    fill(0,255,159);
    rect(X++,600,400,400);
  if(mouseX >200 && mouseX < 250 && mouseY > 100 && mouseY < 150){
    }else{
    fill(67,0,255);
    text("I suck at programming",0,X*5);
  if(mouseY >200 && mouseY < 250 && mouseX > 100 && mouseX < 150){
    }else{
    fill(67,0,255);
    text("I suck at programming",300,X*5);
  if(mouseX >200 && mouseX < 250 && mouseY > 100 && mouseY < 150){
    }else{
    fill(67,0,255);
    text("I suck at programming",600,X*5);
}
  if(X>600){
    X=-1;
  }
    if(mouseY >200 && mouseY < 250 && mouseX > 100 && mouseX < 150){
    }else{
    fill(255,0,153);
    text("I need help",600,X*600);
    }
    }
    }
    }

}

}
