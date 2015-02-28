
int g=25;
int k=15;
float a=0;

 
void setup()
{
  size(500,500);
  background(255);
  smooth();
  ellipseMode(CENTER);
}
 
void draw()
{
  background(0);
  randomSeed(mouseX);
  for(int i=50;i<=(width-50);i=i+50)
   {
     for(int j=50;j<=(height-50);j=j+50)
     {
       stroke(random(200,255),random(200,255),random(200,255));
       ellipse
      (i+sin(a),j,g,g);
        
        
     {
       stroke(random(200,255),random(50,255),random(50,255));
       fill(random(200,255),random(50,255),random(100,255));
       ellipse
       

      (i+sin(a),j,g+20,g+20);
      
      
      stroke(random(200,255),random(50,255),random(50,255));
       noFill ();
       ellipse

      (i+sin(a),j,g+80,g+80);
      
      
      stroke(random(200,255),random(50,255),random(100,255));
      
       ellipse
      (i+sin(a),j,g+50,g+50);
        
        
      noStroke();
      fill(random(200,255),random(50,255),random(100,255));
      ellipse(i+sin(a),j,k,k);
      noFill();
      a=a+100; 
       
     } } } }
    



