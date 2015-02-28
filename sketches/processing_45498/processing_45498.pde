
int xposition = 0;
int step = 20;
int yposition = 0;
int lineweight = 1;
int linestep = 1;

void setup(){
  size(800,800);
  
  background(255);
  
}

void draw(){
  noStroke();
  fill(random(155),random(155),random(155),5);
  rect(0,0,800,800);
  fill(255);
  rect(xposition,0,random(50),random(50));
  xposition = xposition + step;

  if (xposition>800){
    step = step *-1;
  }
  
  if (xposition<0){
    step = step *-1;
  }


  noStroke();
  fill(random(155),random(155),random(155),5);
  rect(0,0,800,800);
  fill(255);
  rect(xposition,750,random(50),random(50));
  xposition = xposition + step;

  if (xposition>800){
    step = step *-1;
  }
  
  if (xposition<0){
    step = step *-1;
  }


  noStroke();
  fill(random(255),random(255),random(255),25);
  rect(random(100,100),random(100,100), random(150),random(150)); 
  fill(random(255),random(255),random(255),25);
  rect(random(250,100),random(100,100), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(400,100),random(100,100), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(550,100),random(100,100), random(150),random(150));
 
  fill(random(255),random(255),random(255),25);
  rect(random(100,100),random(250,250), random(150),random(150)); 
  fill(random(255),random(255),random(255),25);
  rect(random(250,250),random(250,250), random(150),random(150)); 
  fill(random(255),random(255),random(255),25);
  rect(random(400,400),random(250,250), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(550,550),random(250,250), random(150),random(150));
  
  fill(random(255),random(255),random(255),25);
  rect(random(100,100),random(400,400), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(250,250),random(400,400), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(400,400),random(400,400), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(550,550),random(400,400), random(150),random(150));
  
  fill(random(255),random(255),random(255),25);
  rect(random(100,100),random(550,550), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(250,250),random(550,550), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(400,400),random(550,550), random(150),random(150));
  fill(random(255),random(255),random(255),25);
  rect(random(550,550),random(550,550), random(150),random(150));
  
  
stroke(random(147),144,144,random(255));
strokeWeight( lineweight = lineweight + linestep);

if (lineweight>5){
  linestep=linestep*-1;
}

if (lineweight<1){
  linestep=linestep*-1;
}

  
line(25,100,mouseX,mouseY);
line(585,200,mouseX,mouseY);
line(125,300,mouseX,mouseY);
line(765,400,mouseX,mouseY);
line(145,500,mouseX,mouseY);
line(275,600,mouseX,mouseY);
line(375,700,mouseX,mouseY);
line(245,100,mouseX,mouseY);
line(105,200,mouseX,mouseY);
line(265,300,mouseX,mouseY);
line(365,400,mouseX,mouseY);
line(775,500,mouseX,mouseY);
line(244,600,mouseX,mouseY);
line(85,700,mouseX,mouseY);
line(775,780,mouseX,mouseY);

}



  
  
  

