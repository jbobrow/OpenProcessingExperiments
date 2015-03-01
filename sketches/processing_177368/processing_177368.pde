
PImage b;
PImage c;


void setup()
{
 size(600,600); 
 b = loadImage("brush.png");
 c = loadImage("canvas_fine.jpg");
}

void draw()
{
//println(mouseY);
//println(mouseX);
  background (255);
  noTint();
 image(c, 300 ,300);

//christmas tre
pushMatrix();
noStroke(); 
translate(0,-50);
fill(35,106,0);
triangle(200,200,300,100,400,200);
triangle(150,300,300,150,450,300);
triangle(100,400,300,200,500,400);
fill(129,82,10);
rect(275,400,50,70);

//bauble
ellipseMode(CENTER);
fill(255);
noStroke();
ellipse(270,170,30,30);
ellipse(330,170,30,30);
ellipse(300,250,30,30);
ellipse(240,270,30,30);
ellipse(360,270,30,30);
ellipse(300,350,30,30);
ellipse(200, 360,30,30);
ellipse(400,360,30,30);

popMatrix();


//color palette
  pushMatrix();
  translate(0,500);
  noStroke();
  fill(188,191,54);
  rect(100,0,100,100);
  fill(203,2,5);
  rect(200,0,100,100);
  fill(101,245,241);
  rect(300,0,100,100);
  fill(171,61,188);
  rect(400,0,100,100);
  popMatrix();


//select color 

if (mouseX>=100 && mouseX<=500 && mouseY>=360)
{
//color gold  
if (mouseX>100 && mouseX<=200)

   { 
  tint(188,191,54);
  image (b,mouseX,mouseY);
     
  fill(188,191,54);
  pushMatrix();
  noStroke();
ellipseMode(CENTER);
translate (0,-50);
noStroke();
ellipse(270,170,30,30);
ellipse(330,170,30,30);
ellipse(300,250,30,30);
ellipse(240,270,30,30);
ellipse(360,270,30,30);
ellipse(300,350,30,30);
ellipse (200, 360,30,30);
ellipse (400,360,30,30);
  popMatrix();
   }


 
 // color red  
if (mouseX>=200 && mouseX<=300)
 {
  tint(203,2,5);
  image (b,mouseX,mouseY);
     
  fill(203,2,5);
  pushMatrix();
ellipseMode(CENTER);
translate (0,-50);
noStroke();
ellipse(270,170,30,30);
ellipse(330,170,30,30);
ellipse(300,250,30,30);
ellipse(240,270,30,30);
ellipse(360,270,30,30);
ellipse(300,350,30,30);
ellipse (200, 360,30,30);
ellipse (400,360,30,30);
  popMatrix();
   }


   
 //color blue
   if (mouseX>=300 && mouseX<=400)
 {
  tint(101,245,241);
  image (b,mouseX,mouseY);
  fill(101,245,241);
  pushMatrix();
  noStroke();
ellipseMode(CENTER);
translate (0,-50);
noStroke();
ellipse(270,170,30,30);
ellipse(330,170,30,30);
ellipse(300,250,30,30);
ellipse(240,270,30,30);
ellipse(360,270,30,30);
ellipse(300,350,30,30);
ellipse (200, 360,30,30);
ellipse (400,360,30,30);
  popMatrix();
   }


  //color purple
if (mouseX>=400 && mouseX<=500)
 {  
  tint(171,61,188);
  image (b,mouseX,mouseY);
  fill(171,61,188);
  pushMatrix();
  noStroke();
ellipseMode(CENTER);
translate (0,-50);
noStroke();
ellipse(270,170,30,30);
ellipse(330,170,30,30);
ellipse(300,250,30,30);
ellipse(240,270,30,30);
ellipse(360,270,30,30);
ellipse(300,350,30,30);
ellipse (200, 360,30,30);
ellipse (400,360,30,30);
  popMatrix();
 }
 
}
else
{
  noTint();
  image (b,mouseX,mouseY);
}
  imageMode(CENTER);
  image(b, mouseX,mouseY);

}

  


