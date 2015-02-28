
PImage landscape;
float x = 200;   //x-coordinate
float y = 180; // y-coordinate
float bodyHeight = 150; //body height
float neckHeight = 20; //neck height
float radius = 45; // head radius
float angle = 0.0;
float ny = y- bodyHeight - neckHeight - radius; // Neck Y

  
    void setup() {
  size(500,500);
  landscape = loadImage ("purple500.jpg");
  smooth();
  strokeWeight(1.5);
  
  }
  
  void draw() {
      background(landscape);
    //change position by a small random amount
    x += random(-4, 4);
    y += random(-1,1);
    
    //change height of neck
    //neckHeight= 80 + sin(angle) * 30;
    angle += 0.05;
    
    //adjust the height of the head
    float ny = y - bodyHeight - neckHeight - radius;
      

  
  ellipse(x+30,y+150,20, 20); // 1st wheel 
  ellipse(x+50, y+150, 20, 20);// 2nd Wheel    
  ellipse(x+70, y+150, 20, 20); // 3rd Wheel
  
  
  fill(16,222,148); // colour of body
  rect(x, y, 100,bodyHeight); // body
  fill(8,95,64);
   if (mousePressed) {
    fill (229,90,220);}
  rect(x, y+25,100,20);//body stripes:
  rect(x, y +50, 100,15);
  rect(x, y+70, 100,10);
  rect(x, y+85,100,5); 
 

  rect(x+40, y-20, 20, neckHeight);// neck 
  fill(8,95,64); //colour of head
  ellipse(x+50,y-60,90,90); //head
 
  
   line(x ,y+50,x-80,y); //left arm
   ellipse(x-80 ,y,15,15); // left hand
   line(x + 100,y+ 50,x+180,y); //right arm
   ellipse(x+180,y,15,15); //right hand
  
  fill(200); // eyes fill
  rect(x + 20,y-75,60,15); //eyes shape
  ellipse(x +50 ,y-40,23,23);//mouth circle
  fill(8,95,64);
 
  
  
  }
  
 

