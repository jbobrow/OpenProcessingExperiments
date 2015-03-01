
size(500,600);

//Walls
noStroke(); fill(140,30,10); triangle(-100,600,710,600,200,350);
for (int l=0; l<500; l=l+0.05)
    {
        float k=random(50,255);
        float r=random(350,600);
        stroke(k,30,10,100); strokeWeight(2);
        curve(200,10, l,r, l+3,r, -400,0);
     }   
noStroke(); fill(150,30,10); quad(-100,600,200,400,200,0,0,0);
for (int p=0; p<200; p=p+0.2)
    {
        float r=random(0,480);
        float s=random(35);
        float t=random(100,200);
        float u=(10);
        
        stroke(t,30,10,80); strokeWeight(u);
        fill(t,30,10,80);
        ellipse(p,r,s,s);
     } 

     

noStroke(); fill(160,30,10); quad(200,400,200,0,500,0,710,600);

//Window
pushMatrix();
translate(360,140);
    stroke(120,30,10); strokeWeight(15); fill(25,25,60);
    rotate(radians(-3));
    rectMode(CENTER); rect(0,0,140,190);
pushMatrix();
//starzzzz
  for (int p=-60; p<60; p=p+5)
    {
      float m = random(-95,85);
      float n = random(5);
      float o = random(100,200);
      noStroke(); fill(255,o);
      rectMode(CENTER); rect(p,m,n,n);
     }
//Moon
  noStroke(); fill(255,230);
  ellipseMode(CENTER); ellipse(25,-50,50,50);
    fill(162,181,205);
    ellipse(35,-60,8,8);
    ellipse(40,-50,15,15);
    ellipse(12,-40,5,5);
    
//Frames
  stroke(120,30,10); strokeWeight(10); line(0,-95,0,85);
  stroke(120,30,10); strokeWeight(10); line(-60,0,60,0);
popMatrix();
popMatrix();


pushMatrix();
translate(350,150);
    stroke(140,30,10); strokeWeight(30); noFill();
    rotate(radians(-3));
    rectMode(CENTER); rect(0,0,155,205);
popMatrix();
//

int a=160;
int b=100;      
int c=2*width/3;
int d=3*height/5;

//PAJAMAS
  //gown
    //stroke(0); noFill(); rectMode(CORNER); rect(285,415,2*a/3,5*b/4);
    stroke(0,0,70); strokeWeight(1.5);
    for (int e=295; e<375; e=e+6)
      {
        line(e,420,e,530);
      } 
    //strokeWeight(5); line(297,530,372,530);
 //neckline
   //stroke(0,0,70); strokeWeight(3); 
   noStroke();
   fill(160,30,10);
   ellipse(c-3,d+48,81,40); 
  
 //sleeves
   stroke(0,0,70);
   for (int f=420; f<460; f=f+6)
     {
       line(293,f,265,485);
       line(375,f,415,465);
     }
     
  //buttons
  for (int g=360; g<530; g=g+15)
    {
      fill(0,0,70); stroke(160,30,10); strokeWeight(2);
      ellipse(335,g,12,12);
    }




                                                    //MARVIE BEGIN
//HEAD
pushMatrix();
translate(2*width/3, 3*height/5);
rotate(radians(-10)); 
   //1)

    noStroke(); fill(205,133,63);   
    ellipse(0,0,a,b);
   //2)
   fill(139,90,43);
   ellipse(-1,2,9*a/10,9*b/10);
popMatrix();

pushMatrix();
   //3(Face)
   translate(2*width/3, 3*height/5);
   fill(205,133,63);
   ellipse(2,-1,9*a/10,14*b/15);
   
   //eyes
    //left eye
      fill(94,38,18); ellipse(-30,-10,10,10);
    //right eye
      ellipse(30,-25,12,12);
popMatrix();

   //nose
pushMatrix();
   translate(c+12,d-10);
   rotate(radians(-5));
   fill(94,38,18,100); ellipse(0,0,10,-5);
popMatrix();   
   
   //mouth
pushMatrix();
   fill(160,30,10); triangle(c-3,d,c+25,d-5,c+5,d+20);
   //teeth
     fill(255,250,240); 
     quad(c,d,c+8,d-1,c+8,d+8,c+2,d+10); 
     quad(c+10,d-2,c+19,d-3,c+17,d+6,c+12,d+8);
popMatrix();

    //hair
pushMatrix();
    translate(c,d);
    noFill();
    stroke(94,38,18); strokeWeight(1.5); 
    curve(-43,-10, -15,-45, -30,-60, -100,0); 
popMatrix();

//HANDS
  //left
    noStroke(); fill(205,133,63);
    ellipse(width/2,5*height/6,30,30);
  //right
    ellipse(6*width/7,4*height/5,25,25);
    
//FEET
  //left
    pushMatrix();
        translate(300,560);
        rotate(radians(-15));
        ellipse(0,0,50,35);
    popMatrix();  
    
  //right
    pushMatrix();
       translate(370,560);
       rotate(radians(15));
       ellipse(0,0,45,30);
    popMatrix();
                                                   //MARVIE END    

      
//BED
  pushMatrix();
  translate(10,500);
    noStroke(); fill(162,181,205,240);
    rotate(radians(3));
    rectMode(CORNER); rect(0,0,130,80);
  popMatrix(); 
  pushMatrix();
     fill(202,225,255,240);
     quad(10,501,140,510,245,380,180,375);
     fill(188,210,238,240);
     quad(244,380,138,510,135,586,250,420);
  popMatrix();
  //pillow
    pushMatrix();
    translate(165,340);
      fill(255); ellipseMode(CORNER); ellipse(0,0,20,50);
      fill(255); ellipseMode(CORNER); ellipse(60,0,20,50);
      fill(255); rectMode(CORNER); rect(10,0,60,50);
      fill(202,225,255); ellipseMode(CORNER); ellipse(67,3,8,45);
   popMatrix();   
   
  
     
  

