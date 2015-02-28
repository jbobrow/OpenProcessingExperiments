
float variable;

void setup(){
  variable = 50;
  size(600,600);
  background(207,183,155);
}

void draw (){
  variable = variable + 1;
  println(variable);
  noStroke();
  fill(170,random(170),170);
  rect(mouseY,mouseX,100,100);
  fill(170,170,random(170));
  rect(mouseX,mouseY,100,100);
  fill(random(170),170,170);
  ellipse(300,300,variable,variable);
}

void mouseClicked(){
   ellipse(300,300,variable=50,variable=50);
}

