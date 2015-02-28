

  /*@pjs preload="shirt.jpg";*/


int k = 1;
int j = 1;
float t;
float p;

void setup (){
  size (600,600);
PImage img;
  
   img= loadImage("shirt.jpg");
background(255);
//tint (255, 100);

tint(255, 255);
image(img, 150, 230, 300, 200);

}

void draw(){

  
  fill(155);
rect(200, 100, 200, 100); 

colorMode(HSB);
k = k+30;
fill (k,k,k,k);
if (k > 250) {
  k = 1;
}
ellipse(250,150, 30,30); //eye
ellipse(350, 150, 30,30); //eye


noFill();
strokeWeight(4);
line(300, 100, 300, 90); //siren


fill (#FF0000);
ellipse(300,70, 20, 40); //siren

fill(90);
rect(275, 200, 50,30);

noFill();
for (int x=1; x<20; x++){
bezier(270,400, 270+x,400+x, 300+x,600+x, 150, 550);
bezier(330,400, 330-x,400+x, 300-x,600+x, 450, 550); //legs
bezier(175,275, 150+x,300+x, 100+x,300+x, 100, 400); //arms
bezier(425,275, 450-x,300+x, 500-x,300+x, 500, 400);
}
  }





    




