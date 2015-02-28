
int x = 250;
int y = 250;

int w = 200;
int h = 200;

 int count = 0;
//top right
int w1 = w+x;
int h1 = y-h;
int x1 = x+w;
int y1 = y;
//bottom right
int w2 = w+x;
int h2 = y+h+h; 
int x2 = x+w;
int y2 = y+h;
//bottom left
int w3 = x-w+w;
int h3 = y+h+h;
int x3 = x-w+w;
int y3 = y+h;

//top left
int w4 = x-w+w;
int h4 = y-h;
int x4 = x-w+w;
int y4 = y-h+h;
 
int weight = 0;

//Movement

//top left
int xA = x;
int yA = y;

//top right
int xB = x+w;
int yB = y;

//bottom right
int xC = x+w;
int yC = y+h;

//bottom left
int xD = x;
int yD = y+h;



void setup() {
  size(700,700);


}

void draw() {
  background(0);
  smooth();
 stroke(255);
 strokeWeight(weight);
 //Square top left
line(xA,yA,x1,y1);
  x=x+w;
  //corner top right
line(xB,yB,w1,h1);

//Square top right
line(xB,yB,x2,y2);
y = y+h;
//corner bottom right
line(xC,yC,w2,h2);

//Square bottom right
line(xC,yC,x3,y3);
x = x -w;
//corner bottom left
line(xD,yD,w3,h3);

//Square bottom left
line(xD,yD,x4,y4);
y = y-h;
//Corner top left
line(xA,yA,w4,h4);
   

}

void keyPressed() {
  
  if(key=='c'){
    
   h1 = h1+10;
   w1 = w1+5;
   count = count+2;
  
    
   
    
      w2= w2-5;
      count = count +2;
          
   
    h3 = h3-10;
    w3 = w3-5;
    count = count+2;
    
  

    w4 = w4+5;
    count = count+2;
  
  

     }
     
     if(key == 'd'){
       weight = weight+1;
       
     }
     //Brings points closer
     if (key == 'x'){
       //top left
       xA = xA +5;
       yA = yA+5;
       
       //top right
       xB = xB-5;
       yB = yB+5;
       
       //bottom right
       xC = xC-5;
       yC = yC-5;
       
       //bottom left
       xD = xD+5;
       yD = yD-5;
     }
     
     if(key == 's'){
       save("third/"+count+".jpg");
     count++;
     }
}


void mousePressed() {
  
  x1 = x1 -5;
  y1 = y1-5;
  
  x2 = x2+5;
  y2 = y2-5;
  
  x3 = x3+5;
  y3 = y3+5;
  
  x4 = x4-5;
  y4 = y4+5;
  
 
}
   

