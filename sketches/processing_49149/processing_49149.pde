
//alexander uhrich
//mathematics of information visualization
//nick lally
//final project
//source data personally collected



int data[]= {18, 17, 21, 16, 19, 11};
String colors[] ={"RED   ", "GREEN ", "BROWN ", "BLUE  ", "YELLOW ", "ORANGE"};

OverRect r = new OverRect(110,10,45);
OverRect r2 = new OverRect(110,60,45);
OverRect r3 = new OverRect(110,110,45);
OverRect r4 = new OverRect(110,160,45);
OverRect r5 = new OverRect(110,210,45);
OverRect r6 = new OverRect(110,260,45);

void setup(){
  size(450,400);
}

int rectRedL;
int rectGreenL;
int rectBrownL;
int rectBlueL;
int rectYellowL;
int rectOrangeL;

void draw(){
  r.update(mouseX, mouseY);
  r.display();
  r2.update(mouseX, mouseY);
  r2.display();
  r3.update(mouseX, mouseY);
  r3.display(); 
  r4.update(mouseX, mouseY);
  r4.display(); 
  r5.update(mouseX, mouseY);
  r5.display();
  r6.update(mouseX, mouseY);
  r6.display();
  
  fill(0, 0, 0);
  for(int i = 0; i < data.length; i++){
       float ellSize= map(data[i],50,80,0,50);
       textSize (12);
//       text(colors[i],i*50+30,60);
       text(colors[i],50,i*50+30,60);     
       text(data[i],50,i*50+45,60);
//       int (rectRedL = data[0]*10);
//       int (rectGreenL = data[1]*10);
//       int (rectBrownL = data[2]*10);
//       int (rectBlueL = data[3]*10);
//       int (rectYellowL = data[4]*10);
//       int (rectOrangeL = data[5]*10);
  
  fill(0,0,0);
  textSize (15);
  text ("NUMBER OF M&M'S IN ONE BAG BY COLOR", 85, 350);
  }
}

{
rectRedL = (data[0]*10);
rectGreenL = (data[1]*10);
rectBrownL = (data[2]*10);
rectBlueL = (data[3]*10);
rectYellowL = (data[4]*10);
rectOrangeL = (data[5]*10);
}
       
void mousePressed(){
  if(r.press()){
      fill (255, 0, 0);
      rect(165,10,rectRedL,45);
  } 
  if (r2.press()){ 
      fill (0, 195, 80);
      rect(165,60,rectGreenL,45);
 } 
  if (r3.press()){ 
      fill (85, 75, 60);
      rect (165,110,rectBrownL,45);
 } 
  if (r4.press()){ 
      fill (0,84,166);
      rect(165,160,rectBlueL,45);
   } 
  if (r5.press()){ 
      fill (255,255,0);
      rect (165,210,rectYellowL,45);
   } 
  if (r6.press()){ 
      fill (250,101,33);
      rect(165,260,rectOrangeL,45);

    }
//    println("FUCK!");   
  }
 
class OverRect{
 int x,y;
 int i = 0;
 int rectSizeH;
 int rectSizeL;
 int rectRedL = 18;
// int rectRedL;
 int rectGreenL;
 int rectBrownL;
 int rectBlueL;
 int rectYellowL;
 int rectOrangeL;
 int grey;
 boolean over;
 

 //constructor
 OverRect(int _x, int _y, int _rectSizeH){
   x = _x;
   y = _y;
   rectSizeH = 45;
   rectSizeL = rectSizeH;        
//   rectSizeL = rectSizeH+50;      
//   rectSizeL = rectSizeH+data[i];   
//   rectSize = _rectSize;
   grey = 0;
   over = false;
 }
 
 void update(int mx, int my){  
   if((mx > x) && (mx < x + rectSizeH) && (my > y) && (my < y + rectSizeH)){
  grey = 255;
  over= true;
   } else {
     grey = 0;
     over = false;
   }
  
   }
   
   void display (){
     fill(grey);
     rect(x,y,rectSizeL,rectSizeH);
 }
 
 boolean press(){
  if(over){
   return true;
  } else {
   return false;
  } 
 }
}






