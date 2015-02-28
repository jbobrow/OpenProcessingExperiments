
PImage myImage1;
PImage myImage2;
 
void setup() {
  size (1920,1080);
  myImage1 = loadImage("macro eye.jpg");
  
}
 
void draw() {
  tint(0,255,255,50);
image(myImage1, random(-1920,1920),random(-1080,1080));


  noStroke();
  fill(255,255,255,50);
  
    ellipse (mouseX,mouseY,random(100),random(100));
    stroke(255);
    line (200, 200,pmouseX,pmouseY);
  


  fill(random(4),21);
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));

  fill(155,155,155);


      stroke(5);
      line(pmouseX,pmouseY,mouseX+random(-70,70),mouseY+random(-70,70));
      fill(160,155,155,50);
     rect(pmouseX,pmouseY,random(10),random(10));
    }


   



  




