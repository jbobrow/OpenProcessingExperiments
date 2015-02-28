
float b;
float w;
float h;
int cSize;
int x; 
int y;
int angle;


void setup () {
  background (255);
  size (600,800);
  smooth();
  cSize =2;
  x=0;
  y=0;
  angle=0;  
}

void draw (){
background (3,6,131);
fill (0);
 float ellSize = 0;
 for (int x = 0; x<width+10; x+=10){
   for (int y = 0; y<height+10; y+=10){
     ellSize = cos(x*random (20)*sin (random (50)+y))*9;
    ellipse (x,y,ellSize,ellSize); //the background pattern. 
   }
   }

pushMatrix();// the main figure controls. 
  translate (width/2,-400);
  scale (30,30);
  noStroke();
  fill (237,228,41);
  size (14);
  stroke(0);
  strokeWeight (.1);
  fill(237,41,133);
  size (cSize);//figure functions are on the next page. 
popMatrix();  
  
fill(255);

String s1 = "Size "; //changes the size at the bottom of the page. 
//int i = cSize; 
String sc1 = s1 + cSize; 
text (sc1,width/2-20, height-100);

fill (255);	
switch (cSize) {//case changes the words in relation to cSize
  case 0: 
   text ("size of average runway model", width/2-100, height/2);  
    break;
  case 2: 
   text ("standard dress forms are a size 2, not 8", width/2-125, height/2);  
    break;
  case 4: 
   text ("average size of a store mannequin", width/2-100, height/2);  
    break;
  case 6: 
   text ("marilyn monroe was a size 6, not a 12", width/2-120, height/2);  
    break;
    case 8: 
   text ("the size of the average plus size model", width/2-120, height/2);  
    break;
  case 10: 
   text ("the largest size for most designer clothes", width/2-120, height/2);  
    break;
  case 14: 
   text ("the average american woman is a size 14", width/2-120, height/2);  
    break;
  case 16: 
   text ("not available in your average clothing store", width/2-140, height/2);  
    break;
    case 30: 
   text ("60% of american women wear size 14 and larger", width/2-150, height/2);  
    break;
  }


   
}  
  void keyPressed () {//key controls. 
  if (key == CODED) {
   if (keyCode == UP) {
     cSize +=2; 
    if (cSize >=30){
      cSize=30;
    }
    } else if (keyCode == DOWN) {
     cSize-=2;
    if (cSize <=0){
      cSize=0;
    }
    }
    }
}
  


