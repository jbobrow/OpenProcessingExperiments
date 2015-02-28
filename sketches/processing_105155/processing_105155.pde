
   PImage img;
   int x=0;
   int score=0;
void setup(){

size(1900,900);
background(255,255,255);
}
void draw(){
 
 
  
  




 img = loadImage("Grassy-Field-2-P558TV0OO6-1280x960.jpg");
  size(1900,900);
  img.resize(1900,900);



  image(img,0,0);

  
  
  
  
  

stroke(0,0,0);
fill(63,196,77);
ellipse(1300,mouseY,350,350);
fill(255,3,3);
ellipse(1300,mouseY,275,275);
fill(255,247,0);
ellipse(1300,mouseY,200,200);
fill(0,0,0);
ellipse(1300,mouseY,150,150);
fill(37,0,255);
ellipse(1300,mouseY,100,100);
fill(15,108,69);
ellipse(1300,mouseY,50,50);
println("x: "+x+" mouseY "+mouseY);
if(x>1150&&x<1250&&mouseY>255&&mouseY<284){
println("You scored");
score++;
}
fill(0,0,0);
ellipse(1300,mouseY,25,25);

/*arc(200,275, 130, 300,HALF_PI+PI , TWO_PI+HALF_PI, CHORD);   //BOW and arrow//
fill(255,255,255);
noStroke();
ellipse(200,275,120,300);*/

fill(0,0,0);
ellipse(75,225,1,50);
ellipse(75,225,75,75);
rect(30,275,100,200);
rect(0,275,230,25);
rect(90,350,40,300);
rect(30,350,40,300);
if(mousePressed ){
  x=x+150;
fill(196+x,172,38);
rect(120+x,265,200,7);
fill(255,0,0);

triangle(320+x,258,320+x,280,325+x,269);
fill(196,172,38);
rect(20,300,200,7);
}else{
  x= 0;

fill(196,172,38);
rect(120,265,200,7);
fill(255,0,0);
triangle(320,258,320,280,325,269);
fill(196,172,38);
rect(20,300,200,7);
}
fill(0);
ellipse(1300,mouseY,10,400);
ellipse(1300,mouseY,400,10);




noFill();
strokeWeight(10);
bezier(199, 125,  257, 215,  257, 339,  200, 428);
strokeWeight(1);
textSize(25);
text("Try to hit the target (if you can)!", 600,300);
textSize(55);
text(" You Scored: "+score,  50,50);
text(" ___________________________ ",50,65);


    

}









