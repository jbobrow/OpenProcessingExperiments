
boolean one=true;
boolean two=false;
boolean three=false;
color c=color(255,0,0,255);
color d=color(100,100,100);
int rad=50;
float red;
float green;
float blue;
float vis;
void setup(){
 //colorMode(HSB, 255);
  size(600,600);  
  background(0);
  //smooth();
  loadPixels();
  frameRate(30);
  
}

void draw(){
   
  
         loadPixels();
         stroke(c);
         fill(c);
       
       
        
     if (mousePressed == true){       if (two==true){
  ellipse(mouseX,mouseY,rad,rad);
       }

       if(one==true){
        ellipse(mouseX,mouseY,rad,rad);
         
   
       }
       
     
      
     if(three==true){ 
    triangle(mouseX,mouseY,random(rad)+mouseX,random(rad)+mouseY,mouseX-random(rad),mouseY-random(rad));
     
         
    }
     }

}
     
     
     

  
  

  
  
void keyPressed(){
 if (key=='1'){
 one=true;
 two=false;
 three=false;
 vis=255;
 }
  if (key=='2'){
 one=false;
 two=true;
 three=false;
 vis=100;
 c=color(red(c),green(c),blue(c),vis);
 }
  if (key=='3'){
 one=false;
 two=false;
 three=true;
 vis=255;
 }
 if (key=='r')
   c=color(255,0,0,vis);
if (key=='g')
   c=color(0,255,0,vis);
   if (key=='b')
   c=color(0,0,255,vis);
   if (key=='e')
   c=color(random(255),random(255),random(255),vis);
if (key=='+')
  rad+=5;
  if(key=='-'){
    if(rad>5)
    rad-=5;
  }
}


