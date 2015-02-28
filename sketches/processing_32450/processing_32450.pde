
float a=0;
float b=10;
float c=20;
float y=0;
float r=255;
float g=255;
float d=255;

void setup(){
  size(500,500);
  noFill();
  background(255);
 
 fill(0,0,255,10);
 noStroke();
  
}

void draw(){
 
  r=random(0);
  g=random(0);
  d=random(255);
  
 while(b<250){
 fill(r,g,d,25);
 ellipse(a,y,c,c);  

 ellipse(a,y,b,b);
 
  b=b+100;
  
}

a=a+100;
b=0;


if (a >500) {
  y=y+130;
  a=0;}

{  

  if(key == 's' || key == 'S')  

  {  

    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  

    if(filePath != null)  

    {  

      save(filePath + ".png");  

    }  

  }  

} 

}

