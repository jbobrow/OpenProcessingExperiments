
class Tumbleweed
{
  float x,y;
  float speed;
  float w,h;
  
  Tumbleweed()
  {
    x= random(width);
    y= random(100,500);
   
    speed= random(1,4);
  }
  
  void update()
  {  
    x+=speed;
    if(x> width+50)
    x=-50;
    
    
    if(x<-50)
    x=width+50;
   
  }
  void display()
  {
    fill(152,117,52,60);
    stroke(64,47,15);
    pushMatrix();
    float tempy= y-abs(sin(x*.03)*45);
    translate(x,tempy);
   
    ellipse(5,5,60,60);
    ellipse(-2,2,50,50);
    ellipse(10,10,40,40);
    ellipse(-5,-5,50,50);
    ellipse(-7,-7,80,80);
    ellipse(-3,-3,60,60);
    ellipse(-8,8,40,40);
    ellipse(7,7,30,30);
    ellipse(1,-1,40,40);
   ellipse(-1,-1,50,50); 
   ellipse(4,-4,80,80);
   ellipse(-6,6,80,80);
   ellipse(-4,4,60,60);
   ellipse(6,-6,70,70);
   ellipse(8,8,70,70);
    ellipse(0,0,70,70);
     
    popMatrix();
  }
}
ArrayList western;

void setup()
{size(500,500);
western= new ArrayList();
for(int i=0; i<1;i++)
{western.add(new Tumbleweed());}
}

void draw()
{
background(255,237,70);

noStroke();
//desert ground
fill(232,216,70,150);
rect(100,200,400,300);
fill(237,227,134,70);
rect(0,100,500,250);
fill(201,188,71,110);
rect(200,100,400,200);
fill(198,192,136,110);
rect(0,300,300,300);
fill(237,221,69,80);
rect(260,280,250,200);
//sky and sun
fill(2,209,207);
noStroke();
rect(0,0,500,100);
fill(233,255,3);
ellipse(490,0,50,50);
//mesa
fill(116,82,41);
triangle(200,30,235,60,165,60);
rect(0,30,200,100);
rect(200,60,150,60);
strokeWeight(1);
stroke(0);
fill(255,166,0);
//rocks
ellipse(100,460,50,30);
ellipse(400,320,30,10);
ellipse(200,250,10,4);
ellipse(320,180,10,4);
ellipse(150,150,15,5);
ellipse(350,380,10,10);


for(int i=0; i<western.size();i++)
{Tumbleweed p=(Tumbleweed) western.get(i);
p.update();
p.display();
}
//cactus
noStroke();
fill(0,160,20);
pushMatrix();
rotate(radians(-.5));
translate(-12,0);
ellipse(440,260,40,70);
rect(422,260,40,35,6);
popMatrix();
ellipse(480,260,60,200);
noStroke();
rect(455,310,60,60,6);
fill(0);
ellipse(480,260,30,30);
//bush
fill(160,136,0,145);
arc(50,240,100,50,PI,TWO_PI);

}
