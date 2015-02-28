
void setup() {
 size (600,600);
}


//// Drawing ////
void draw() {
println(mouseY);
background (0,0,0);
  int r = 255;
  int g = 200;
  int b = 0;
  
  if(mouseX < 75){
    r = 100;
    g = 180;
    b = 0;
  }else if(mouseX < 75+50){
    r = 125;
    g = 200;
    b = 0;
  }else if(mouseX < 75+100){
    r = 150;
    g = 210;
    b = 0;
   }else if(mouseX < 75+150){
    r = 175;
    g = 215;
    b = 0;
   }else if(mouseX < 75+200){
    r = 200;
    g = 220;
    b = 0;
   }else if(mouseX < 75+250){
    r = 225;
    g = 225;
    b = 0; 
    
  }
  
fill(r, g, b);
ellipse(300,300,450,450);
  
fill(r, g-20, b);
ellipse(300,300,400,400);

fill(r, g-40,b);
ellipse(300,300,350,350);

fill(r,g-60,b);
ellipse(300,300,300,300);

fill(r,g-80,b);
ellipse(300,300,250,250);

fill(r,g-100,b);
ellipse(300,300,200,200);

fill(r,g-120,b);
ellipse(300,300,150,150);

fill(r,g-140,b);
ellipse(300,300,100,100);

fill(r,g-160,b);
ellipse(300,300,50,50);

fill(r,g-180,b);
ellipse(300,300,25,25);


/*
//// Assignment01 Poem ////
println("Bird of Prey by Jim Morrison");
println(" ");
println("Bird of Prey");
println("Bird of Prey");
println("Flying high");
println("Flying high");
println("In the summer sky");
println(" ");

println("Bird of Prey");
println("Bird of Prey");
println("Flying high");
println("Flying high");
println("Gently pass on by");
println(" ");

println("Bird of Prey");
println("Bird of Prey");
println("Flying high");
println("Flying high");
println("Am i going to die?");
println(" ");

println("Bird of Prey");
println("Bird of Prey");
println("Flying high");
println("Flying high");
println("Take me on your flight");
*/
}


