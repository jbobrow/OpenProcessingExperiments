
//hello, world.
//margot, here.
//do you know what's about to go down?
//let me tell you--basically nothing, ontologically. 

int molly;

void setup(){
  size(700,700);
  molly=0;
  molly=molly+1;
  smooth();
}

void draw(){
 //background(#47C634);
  molly++;
  stroke(#000000);
  
  line(500,100,144,height/2);
  molly--;
  fill(#FA5E32);
  line(500,100,molly,height);
  if(molly > 300);
  noFill();
  molly++;
  fill(500,100,800,height);
  fill(#831BF0+molly);
  if(mouseX < width/3){
    fill(500,200,width,height);
  ellipse(width/9,height/2,width/6,molly);
  }
  noFill();
  println(molly);
  fill(150,molly,molly,molly);
  line(0,0,molly,molly);
  stroke(0,molly,molly,molly);
  fill(molly,300,400,molly/2);
    ellipse(400,700,90,90);
    ellipse(600,300,55,55);
    ellipse(200,40,35,35);
    ellipse(600,750,70,70);
    ellipse(500,400,65,65);
    ellipse(-molly,molly,molly,-molly);
  line(mouseX,mouseY,pmouseX,pmouseY);
println("x: " + mouseX + "y: " + mouseY);
}

//don't laugh...

