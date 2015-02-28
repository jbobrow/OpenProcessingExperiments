
void setup() {
  size(800,700);
background(0);
stroke(255);
}
void draw(){
 background(0);//so you don't see the past shapes you made
  smooth();
  noFill();
  for (int l=0;l<200;l=l+10)//to have more than one circle and change where they are on the screen 

  ellipse(300+l,300, mouseX+mouseX, mouseY);//changing circles shapes based on placement of mouse
  for(int t=0;t<200;t=t+10)
  ellipse(300+t,400, mouseX+mouseX, mouseY);
}
