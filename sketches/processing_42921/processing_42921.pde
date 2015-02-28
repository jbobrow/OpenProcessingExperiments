
//EJ Posselius - Processing.3 - 2011.10.17 - v2.5
//much of this code for the class definition was derived from the Scrollbar example
//it utilizes classes and subclasses

Slider hs1, hs2, hs3, hs4, hs5, hs6; //define instances

PFont f1;

int sBar = 200;//menu width
int c = 80;//height constant\
int x,y,vx,vy,d;
color col;
float s1,s2,s3,s4,s5,s6;

void setup () {
  size(800,600);
  noStroke();
  
  f1 = loadFont("f1.vlw");
  hs1 = new Slider(0,c,sBar,20, 5);s1=50.;//see Slider class for parameters (x,y,sW,sH,vel)
  hs2 = new Slider(0,2*c,sBar,20, 3);s2=50;
  hs3 = new Slider(0,3*c,sBar,20, 3);s3=10.;
  hs4 = new Slider(0,4*c,sBar,20, 3);s4=127.;
  hs5 = new Slider(0,5*c,sBar,20, 3);s5=127.;
  hs6 = new Slider(0,6*c,sBar,20, 3);s6=127.;  
  
  x=width/2;
  y=height/2;
  vx = 1;
  vy=1;
  d = 10;  

  background(0);  
  smooth();
}

void draw () {
  
  //mouseover to show sidebar
  if (mouseX < sBar){

     fill(180, 10);
     rect(0,0,sBar,height);  
     
     textFont(f1,20);


     //Slider hs1
     float s1 = hs1.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs1.update();//call instance hs1, subclass update
     hs1.display();
     fill(0,10);
     text("X Speed",10,c-20);
//     s1 = map(s1,-75.,75.,sBar+0+s3,width-s3);
     s1 = round(map(s1,-75.,75.,10.,209.))/10;
     
     //Slider hs2
     float s2 = hs2.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs2.update();
     hs2.display();     
     fill(0,10);
     text("Y Speed",10,2*c-20);
//     s2 = map(s2,75.,-75.,0+s3,height-s3);
     s2 = round(map(s2,-75.,75.,10.,209.))/10;
     
     //Slider hs3
     float s3 = hs3.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs3.update();
     hs3.display();  
     fill(0,10);
     text("Blob Size",10,3*c-20);
     s3 = round(map(s3,-75.,75.,0.,101.));   

     //Slider hs4
     float s4 = hs4.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs4.update();
     hs4.display();
     fill(0,10);
     text("Red",10,4*c-20);
     s4 = round(map(s4,-75.,75.,0.,255.));

     //Slider hs5
     float s5 = hs5.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs5.update();
     hs5.display();
     fill(0,10);
     text("Green",10,5*c-20);     
     s5 = round(map(s5,-75.,75.,0.,255.));

     //Slider hs6
     float s6 = hs6.getPos()-sBar/2;  //scaled output according to Slider subclass getPos
     hs6.update();
     hs6.display();       
     fill(0,10);
     text("Blue",10,6*c-20);      
     s6 = round(map(s6,-75.,75.,0.,255.));
     
     col = color(s4,s5,s6);
     d =round(s3);
     vx = round(s1);
     vy = round(s2);
    
     fill(col);    
     ellipse(sBar/2,550,d,d);
     }else{
      
      fill(0,10);
      rect(0,0,sBar,height);
                
      x+=vx;
      y+=vy;
           
      if (y > height-d/2 || y < d/2){
           vy *= -1;  
//           fill(col);
//           ellipse(x, y, s3, s3);
      }
         if (x > width - d/2 || x < sBar+d){
           vx *= -1;
//           fill(col);
//           ellipse(x, y, s3, s3);
         }
           fill(col);
           ellipse(x, y, d, d);
     }   
}

//class... It works!
class Slider {
 int sWidth, sHeight;    // width and height of bar
 int xPos, yPos;         // x/y pos of bar
 float sPos, newsPos;    // slider x position
 int sPosMin, sPosMax;   // max/min for slider
 int vel;                // velocity
 boolean over;           // is it over?
 boolean lock;
 float ratio;
 
  Slider(int xP, int yP, int sW, int sH, int l) {
  sWidth = sW;
  sHeight = sH;
  int delta = sW-sH;
  ratio = (float)sW / (float)delta; //ratio of width to diff of height and width
  xPos = xP;
  yPos = yP - sHeight/2;
  sPos = xPos + sWidth/2 - sHeight/2;
  newsPos = sPos;
  sPosMin = xPos;
  sPosMax = xPos + sWidth - sHeight;
  vel = l;
  }
  
  //checks mouseOver
  void update(){
   if(over()){
    over = true;
   }else{
    over = false; 
    }
   if(mousePressed && over) {
     lock = true;
   }
   if(!mousePressed){
     lock = false; 
   }
   if(lock) {
     newsPos = limit(mouseX-sHeight/2,sPosMin,sPosMax);//constrain=limit
   }
   if(abs(newsPos - sPos)>1){
    sPos=sPos+(newsPos-sPos)/vel; 
   }
  }
  
  //new ways to define variables as subClasses
  int limit(int val, int minV, int maxV){
   return min(max(val,minV),maxV); //output from subclass (return)
  }
  
  //check mouseOver
  //GOLD
  boolean over() {
   if(mouseX>xPos && mouseX < xPos+sWidth && mouseY>yPos && mouseY < yPos+sHeight){
    return true;
   }else{
    return false;
   } 
  }
  
  //slider display
  void display(){
   for (int i=1;i<10;i++){
   int alph = i;
     
   fill(255, alph);
   rect(xPos,yPos,sWidth,sHeight);
   if(over || lock) {
    fill(150,100,0,alph);
   }else{
    fill(100,100,100,alph);
   }
   rect(sPos,yPos,sHeight,sHeight);
  } 
 } 
  
  //Convert sPos to values between 0 and total width of scrollbar
  float getPos(){
    return sPos * ratio;
  }
  
}



