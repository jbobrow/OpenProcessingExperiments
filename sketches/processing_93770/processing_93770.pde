
float a=0;  //bubblegum width
float b=0;  //bubblegum height
int c=255;  //opacity of bubble gum
float d=285;      //y coordinate of the left shoulder
float e=285;      //y coordinate of the right shoulder 
int clicked=1;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {


  background(255);
  noStroke();
  textSize(20);
  fill(255, 0, 127);
  text("Click the bubble gum!", 180, 430);
  text("When it pops, click it again to restart",150,460);
 
  
  //hair

  fill(153, 56, 0);
  arc(250, 250, 250, 380, PI, PI+PI);

  //neck
  fill(255, 193, 158);
  rectMode(CENTER);
  rect(250, 270, 40, 50);


  //face
  ellipse(250, 180, 170, 190);


  //front hair
  fill(120, 55, 18);
  quad(240, 85, 270, 120, 260, 100, 250, 90);

  //eyeballs
  fill(255);
  arc(200, 160, 30, 40, PI, PI+PI);
  arc(300, 160, 30, 40, PI, PI+PI);

  //pupils
  fill(0);
  ellipse(200, 150, 15, 20);
  ellipse(300, 150, 15, 20);

  //points in pupils
  stroke(255);
  strokeWeight(3);
  fill(255);
  point(300, 150);
  point(200, 150);


  //nose
  stroke(0);
  strokeWeight(1);
  line(250, 180, 240, 190);
  line(240, 190, 250, 195);

  //eyebrow
  noFill();
  stroke(99, 2, 0);
  strokeWeight(2);
  curve(130, 165-mouseY/20, 190, 130, 210, 130, 250, 165-mouseY/20);
  curve(200, 165-mouseY/20, 290, 130, 310, 130, 370, 165-mouseY/20);


  noStroke();

  //lips
  fill(255, 0, 0);
  arc(245, 215, 10, 10, PI, PI+PI);
  arc(255, 215, 10, 10, PI, PI+PI);
  arc(250, 215, 20, 20, 0, PI);

  //body

  fill(103, 153, 255);
  rectMode(CENTER);
  rect(250, 335, 200, 100);

  //arc neck
  fill(255, 193, 158);
  arc(250, 285, 60, 80, 0, PI);

  //shoulder
  fill(103, 153, 255);
  triangle(150, 285, 220, 285, 150, d);
  triangle(280, 285, 350, 285, 350, e);
  
  if (a<90){
    d=d-0.2; e=e-0.2;}
  

  //bubble gum
  fill(255, a, 127, c);
  ellipse(250, 215, a, b);
  if (a<90)
  {
    a=a+0.5;
  }
  if (b<90)
  {
    b=b+0.5;
  }
}



void mouseClicked() {
  if (a<90)
  {
    a=a+0.5;
  }
  else if (clicked ==1)
  {
    c=80;
    d=285;
    e=285;
    clicked =0;
  }
  else if(clicked ==0)
  {
    a=0;
    b=0;
    c=255;
    d=285;
    e=285;
    
    clicked=1;
  }
  

    
  
}
