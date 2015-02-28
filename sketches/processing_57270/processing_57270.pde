
int counter;
  PImage img;
boolean once =true;
void setup() {  
    img = loadImage("http://www.watermanpolyhedron.com/images/millerscykindrical.png");
  size(500, 500);
  image(img,0,0);
}

void draw() 
{ 
    if(once)
    {
    imageMode(CENTER);
      image(img,width/2,height/2);
      once = false;
      }
    int x = round(random(0,500));
    int y = round(random(0,500));
    fill(round(random(0,255)),round(random(0,255)),round(random(0,255)));
    
    translate(width/2,height/2);
    rotate(radians(round(random(0,360))));

    textSize(round(pow(random(0,50),4)/125000)*2);
    text("MARIN",x,y);

}
