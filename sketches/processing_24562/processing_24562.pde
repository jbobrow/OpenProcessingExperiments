



void setup(){
  size(400,800);

  noLoop();


  smooth();
background(0);
  
}

void draw(){
noStroke();
  fill(87,118,206);
triangle(50,50,20,200,50,180);
quad(20,200,50,180,200,350,100,400);
fill(0);
triangle(200,350,100,400,110,300);
strokeWeight(2); 
noFill();
fill(94,50,100);

quad(200,0,380,0,330,150,220,120);
triangle(330,150,220,120,200,300);
fill(0);
triangle(240,0,320,0,280,50);

fill(94,50,100);

quad(400,450,400,500,380,600,328,480);
triangle(320,280,400,450,330,500);
triangle(400,470,330,490,300,600);
triangle(50,450,55,550,30,530);
quad(55,550,40,600,30,550,44,500);
triangle(30,530,3,580,50,540);

quad(220,600,200,800,220,800,240,700);
triangle(220,700,130,670,210,750);



  
}


