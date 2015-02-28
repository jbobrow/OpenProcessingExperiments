
void setup() {

size(400,420);
}

  
void draw() {
background(0);
  
  if (mouseX < 200 && mouseY < 200) {
    fill (225,0,0);
    rect (0,0,200,200);    
  } else if (mouseX > 200 && mouseY < 200) {
    fill (0,225,0);
    rect (200,0,200,200);
  } else if (mouseX < 200 && mouseY > 200) {
    fill (0,0,225);
    rect (0,200,200,200);
  } else if(mouseX > 200 && mouseY > 200) {
    fill (225,225,0);
    rect(200,200,200,200);
  }


int spacing = 10; 
int len = 10; 
 
  noStroke();
  fill(225);
  rect(0,400,400,400);
  for(int i = 0; i < 400; i++)
  { int x = (i*spacing) + 0;
fill(225,0,0,i*5);
rect(x,400,10,10 + len);

//{ int kleur = 255-(i*(255/20));


  }
  }

