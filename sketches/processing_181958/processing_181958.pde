
size(800,300);
// background
   background(5,30,95);
   noStroke();
   for (int i=900; i>100; i=i-50)
      {
         for (int a=255; a>16; a=a-16) // YAYAYAY OMG decreasing opacity!!!
            {
               fill(255,a);
             }
         ellipse(750,150,3*i/2,i);
       }


//HELMET
int x=225;
int y=290;

  //back of head
    stroke(208,29,29,230); strokeWeight(5);
    fill(238,59,59);
    ellipse(672,125,x,y);
  //neck
    rectMode(CORNER); rect(665,125,102,200); 
  
  
  //face
    stroke(225,163,7,230); strokeWeight(5);
    fill(255,193,37);
    ellipse(652,135,5*x/6,11*y/13);
    //brow piece
      quad(550,113,575,30,700,30,770,113);


 stroke(208,29,29,230); strokeWeight(5); fill(238,59,59);  
  //temple
    triangle(770,113,690,10,705,113);
 
  
  //cheek
    triangle(767,125,700,165,700,265);
  //cheek left
    quad(570,165,553,155,600,266,610,245);  
    
  //chin piece
    rectMode(CORNER); rect(600,245,95,30);
    triangle(695,245,695,260,770,165);
  //ear piece
    ellipse(775,115,30,80);
  //forehead
    quad(715,0,715,30,565,30,595,0);
        quad(610,0,655,0,650,57,610,55);
        
        
//eyes
  stroke(0,245,255,150); strokeWeight(6);
  fill(187,255,255);
  //right
    rectMode(CENTER); rect(595,120,45,15);
  //left
    rect(676,120,45,15);
    
//mouth
  noStroke(); fill(0,150);
  rectMode(CORNER); rect(610,215,60,10);
  
stroke(255,100);
for (int i=400; i>=100; i=i-40)
  {
    if (i<0) 
    {
     triangle(75,19,480,127,800,0);
    }
    else
    {
      line(676,120,i,i+100);
    }
  }

for (int b=400; b>=100; b=b-40)
  {
    if (b<0) 
    {
     triangle(75,19,480,127,800,0);
    }
    else
    {
      line(595,120,b,b+100);
    }
  }
