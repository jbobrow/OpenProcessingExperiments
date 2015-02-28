
ArrayList<Sphere> manySpheres;

//weather info in 18.5
// Sun Variables
float chance = random(0,50);
int sunRadius = 60;     
int xStart = -sunRadius; 
int yStart = 20;         
float xSun = xStart;     
float ySun = yStart;    

// Arc variables
float t = 0;   
float duration = 60 * 1000;
float conversionFactor = 2 * 3.14 / duration;

Cloud cloudOne,cloudTwo,cloudThree,cloudFour,cloudFive,cloudSix,cloudSeven;
Star starOne,starTwo,starThree,starFour,starFive,starSix,starSeven,starEight;
void setup(){
size(800,750);
background (33,0,161);
 cloudOne = new Cloud(500,50,random(0.3,0.8));
 cloudTwo = new Cloud(700,200,random(0.3,0.8));
 cloudThree = new Cloud(300,100,random(0.3,0.8));
 cloudFour = new Cloud(100,450,random(0.3,0.8));
 cloudFive = new Cloud(225,300,random(0.3,0.8));
 cloudSix = new Cloud(-150,195,random(0.3,0.8));
 cloudSeven = new Cloud(-200,335,random(0.3,0.8));
 starOne = new Star(random(50,750),random(50,700));
 starTwo = new Star(random(50,750),random(50,700));
 starThree = new Star(random(50,750),random(50,700));
 starFour = new Star(random(50,750),random(50,700));
 starFive = new Star(random(50,750),random(50,700));
 starSix = new Star(random(50,750),random(50,700));
 starSeven = new Star(random(50,750),random(50,700));
 starEight = new Star(random(50,750),random(50,700));
  manySpheres = new ArrayList<Sphere>();
}

void draw()
{
  //sky color variables
  float skyColorR = map(ySun,0,height,23,0);
  float skyColorG = map(ySun,0,height,162,0);
  float skyColorB = map(ySun,0,height,255,0);
  //window color variables
  float winColorR = map(ySun,0,height,0,255);
  float winColorG = map(ySun,0,height,0,236);
  float winColorB = map(ySun,0,height,0,12);
  //sun color variables
  float sunColorR = map(ySun,0,height,255,255);
  float sunColorG = map(ySun,0,height,231,50);
  float sunColorB = map(ySun,0,height,18,0);
  //castle color variables: darks
  float casDColor = map(ySun,0,height,35,0);
  //castle color variables: lights
   float casLColor = map(ySun,0,height,50,25);
   //landscape color variables
     float lanColorR = map(ySun,0,height,48,18);
  float lanColorG = map(ySun,0,height,16,6);
  float lanColorB = map(ySun,0,height,2,1);
   
  // Refresh background
  background(skyColorR,skyColorG,skyColorB);
  
  // Draw the sun
  fill(sunColorR,sunColorG,sunColorB);
  ellipse(xSun, ySun, sunRadius, sunRadius);

 
  
  //sun functions
  t = millis() * conversionFactor;

  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;
  
  //calls cloud/star functions
   starOne.makeStar();
   starTwo.makeStar();
   starThree.makeStar();
   starFour.makeStar();
   starFive.makeStar();
   starSix.makeStar();
   starSeven.makeStar();
   starEight.makeStar();
   cloudOne.makeCloud();
   cloudTwo.makeCloud();
   cloudThree.makeCloud();
   cloudFour.makeCloud();
   cloudFive.makeCloud();
   cloudSix.makeCloud();
   cloudSeven.makeCloud();
   fill(45,0,190);
     for(int i=0;i<manySpheres.size();i++){
    Sphere tempSphere = manySpheres.get(i);
    tempSphere.run();
  }
   //horizon
   fill(45,0,190);
  rect(0,650,800,100);
  //castle
  float y,ymo;
  y = 0;
  ymo = 1.5;
  
 
  fill(casDColor);
    noStroke();
    triangle(380, y+300, 580, y+300, 480, y+200);
    triangle(630, y+630, 635, y+651, 640, y+640);
    triangle(200, y+550, 700, y+550, 500, y+700);
    triangle(430, y+690, 380, y+600, 480, y+600);
    triangle(530, y+690, 480, y+600, 580, y+600);
    triangle(580, y+680, 530, y+550, 630, y+600);
    triangle(310, y+600, 330, y+608, 302, y+615);
    triangle(258, y+650, 260, y+658, 250, y+665);
    fill(casDColor);
    triangle(335, y+100, 445, y+100, 390, y+10);
    fill(casLColor);
    triangle(420, y+100, 445, y+100, 390, y+10);
    fill(casDColor);
    ellipse(390, y+100, 110, 25);
    fill(casLColor);
    triangle(580, y+300, 580, y+400, 480, y+200);
    ellipse(450, y+550, 500, 40);
    noStroke();
    fill(casDColor);
    rect(350, y+100, 80, 300);
    fill(casLColor);
    rect(400, y+100, 30, 300);
    fill(casDColor);
    rect(300, y+300, 300, 250);
    noStroke();
    fill(casLColor);
    quad(600, y+300, 650, y+400, 650, y+550, 600, y+550);
    fill(winColorR, winColorG, winColorB);
    rect(370, y+150, 5, 10);
    rect(390, y+200, 5, 10);
    rect(370, y+250, 5, 10);
    
   //Landscape
   fill(lanColorR,lanColorG,lanColorB);
   quad(-50,550,85,625,200,660,-50,660);
   quad(850,600,780,635,710,710,850,710);
 /*  Will draw rain
    if(chance>5){
    
    float x = random(0,1000);
    float Y = random(-50,-25);
    float d = random(2,5);
    
    manySpheres.add(new Sphere(x,Y,d));
}
loop();
       
*/    
}


  

////////////////////////////////////////
class Cloud{
  
  float pX,pY,x,y,r,g,b,t,cS;
  
 Cloud(float parameterX, float parameterY, float cloudSpeed){
 pX = parameterX;
 pY = parameterY;
 x = random(50,200);
 y = random(25,45);
 r = random(58,65);
 g = random(2,5);
 b = random(100,115);
 t = random(180,245);
 cS = cloudSpeed;
 }
void makeCloud(){
  fill(r,g,b,t);
  ellipse(pX,pY,x,y); 
  ellipse(pX-15,pY+25,x+10,y+5);
  ellipse(pX-75,pY,x-20,y-10);
  ellipse(pX+20,pY+5,x+10,y-10);
  ellipse(pX+10,pY+30,x+50,y-10);
  pX = pX + cS;
  if (pX > 1000) { 
  pX = -200; 
 }
}
}
/////////////////////////
class Star{
  float pX,pY;
  Star(float parameterX, float parameterY){
    pX = parameterX;
    pY = parameterY;
  }
  void makeStar(){
    //Star brightness variables
  float starColorR = map(ySun,300,height,23,255);
  float starColorG = map(ySun,300,height,162,255);
  float starColorB = map(ySun,300,height,255,255);
    fill(starColorR,starColorG,starColorB);
    ellipse(pX,pY,2,2);
    ellipse(pX+200,pY+300,2,2); 
    ellipse(pX-1750,pY-200,2,2);
    ellipse(pX-300,pY+350,2,2); 
    ellipse(pX+100,pY-125,2,2);
  }
}
//////////////////////////////
class Sphere{
  float x,y,d,xmo,ymo;;
  
 Sphere(float parameterX,float parameterY,float parameterD){
   x = parameterX;
   y = parameterY;
   d = parameterD;
   xmo= -.50; 
   ymo= 1.5;
   
   
 } 
  void run(){
    makeSphere();
    moveSphere();

  }
 void makeSphere(){
   fill(45,0,190);
   ellipse(x,y,d,d);
   fill(136,180,255);
   ellipse(x+2,y-2,d-3,d-3);
 }
 void moveSphere(){
    x+=xmo;
    y+=ymo;
 }
}
///////////////////////




