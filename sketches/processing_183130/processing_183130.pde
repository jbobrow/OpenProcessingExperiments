
//Assignment 4a:Create a visually compelling animation by using all of the following items: random function, draw(), for loop. 2pts
size(1000,400);
//heart variables
    int heart=20;
//arrow one variables
    int x=50;
    int y=40;
    int a=80;
    int b=100;
    int c=150;
    int ca=160;
    int speed=10;
//arrow one colors
    float red=random(255);
    float redish=random(200);
    red>100;
    redish>25;
    
 float blackish=random(150);    
                //fill(red,redish,blackish);    Is the code  better with this line or without?
    int n1=800;
    int n2=900;
    int n3=910;
    int n4=880;
    int n5=790;
    int n6=870;
//arrow two colors
 
void draw(){
background(250);
//hearts 
    beginShape();
    noStroke();
    for(int heart=20; heart<1000; heart=heart+150){
    for(int hearts=40; hearts<1000; hearts=hearts+150){
    ellipse(heart,heart,20,20); 
    ellipse(hearts,heart,20,20);
    triangle(heart-10,heart,heart+30,heart,heart+10,heart+30);
    endShape();
     frameRate(30);
    }
    }
//arrow blizzard
    float black=random(100);
    stroke(black,black,black,blackish);
   

        line(n1,30,n2,30);
        quad(n6,30,n2,30,n3,40,n4,40);
        quad(n6,30,n2,30,n3,20,n4,20);
        triangle(n1,20,n1,40,n5,30);
        
        
         line(n1,30*3,n2,30*3);
        quad(n6,30*3,n2,30*3,n3,100,n4,100);
        quad(n6,30*3,n2,30*3,n3,80,n4,80);
         triangle(n1,80,n1,100,n5,90);
   
           line(n1,380,n2,380);
         quad(n6,380,n2,380,n3,390,n4,390);
        quad(n6,380,n2,380,n3,370,n4,370);
         triangle(n1,370,n1,390,n5,380);
         
         line(n1,330,n2,330);
         quad(n6,330,n2,330,n3,340,n4,340);
        quad(n6,330,n2,330,n3,320,n4,320);
         triangle(n1,320,n1,340,n5,330);
         


         
      n1=n1-speed;
      n2=n2-speed;
      n3=n3-speed;
      n4=n4-speed;
      n5=n5-speed;
      n6=n6-speed;
//arrow one 
    strokeWeight(3); 
    stroke(red,0,0);
    //fill(255);
    quad(x,250,y,240,a,240,b,250);
    quad(x,250,y,260,a,260,b,250);
    triangle(c,240,c,260,ca,250);
    line(x,250,c,250);
//arrow animation
    x=x+speed; 
    y=y+speed;
    a=a+speed;
    b=b+speed;
    c=c+speed;
    ca=ca+speed;
//arrow two 
    strokeWeight(3); 
    stroke(red,0,0);
    //fill(255);
    quad(x,150,y,140,a,140,b,150);
    quad(x,150,y,160,a,160,b,150);
    triangle(c,140,c,160,ca,150);
    line(x,150,c,150);
//
if(mousePressed==true){
noStroke();
fill(black);
ellipse(mouseX,250,20,20)
}
//
//arrow blizzard 
    //for(int n=1000, n>0,n=n-50);
    //for(int n1=10,n1<1000,n1+n1+50);
   // quad(0,1000,10,990,30,990,50,1000);
   // quad(0,1000,10,1010,30,1010,50,1000);
    //triangle(100,990,100,1010,110,1000);
    //line(0,1000,100,1000);

//if ((x<0)||(x>=100)){ speed=speed*-1; } }
}
