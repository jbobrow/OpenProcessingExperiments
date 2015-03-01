
float diameter = 20;
int num = 20;
int b;
boolean a ;
float c; 
 
void setup()
{
    size(600, 600);
    stroke(0); 
    b=0; 
}
void draw() { 
background(255); 

    for (int x = width/num; x < width; x += width/num) { 
        for (int y = height/num; y < height; y+= height/num) {  
   if(dist(mouseX,mouseY,x,y)<20){
 fill(30*c,70*c,180*c);
 b+=1;
 a = true ;}

 
 else{
 
            fill(255-18*c,255-30*c,255-60*c);}
            ellipse(x, y, diameter+c, diameter+c);
if ( a=true ){
  
  c=map(sin(frameCount*0.06),-1.0,1.0,1,10);}
         
        }
    }
     
}



