
void setup() {
 size (600,600);
}


//// Drawing ////
void draw() {
println(mouseX);
background(0,0,0);
  int r = 0;
  int g = 0;
  int b = 0;

  if(mouseX < 200){
    r = 100;
  }else if(mouseX < 400){
    r = 150;
  }else if(mouseX < 600){
    r = 200;
  }
  
println(mouseY);
  if(mouseY < 200){
    g = 100;
  }else if(mouseY < 400){
    g = 150;
  rect(300,300,600,600);
  }else if(mouseX < 600){
    g = 200;
  }
  fill(r,g,b);
  rect(0,0,600,600);
}

