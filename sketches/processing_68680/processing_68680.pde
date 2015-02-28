
float x1;
float y1;
float x2;
float y2;
float a1;
float a2;
int r;
void setup()
{
  size(400,400);
  background(#3CB371);
  frameRate(6);
}
void draw()
{
   //cabellos
        
         background(#3CB371);
         noFill();
         stroke(random(0,255),random(0,255),random(0,255));
         strokeWeight(5);
         x1=int(random(60,180)); 
         y1=int(random(60,180));
         x2=int(random(60,180)); 
         y2=int(random(60,180));
         a1=int(random(60,180)); 
         a2=int(random(60,180));
         bezier(180,100,x1,y1,x2,y2,a1,a2);
     beginShape(LINES);
         //ojo
         fill(0,0,0);
         ellipse(230,140,20,20);
         //contorno
         stroke(0,0,0);
         vertex(80,300);
         vertex(120,280);  
         vertex(120,280);
         vertex(100,240);
         vertex(100,240); 
         vertex(180,100);
         vertex(180,100);
         vertex(240,110);
         vertex(240,110);
         if(r==0){
         vertex(330,180);
         vertex(330,180);
         vertex(240,200);
         vertex(240,200);
         vertex(310,240);
         vertex(310,240);
         r=1;}
         else{
         vertex(330,180);
         vertex(330,180);
         vertex(240,200);
         vertex(240,200);
         vertex(330,180);
         vertex(330,180);
         r=0;}
         vertex(220,260); 
         vertex(220,260);
         vertex(240,300);
         vertex(240,300);
         vertex(80,300);
         vertex(80,300);      
    endShape();    
}
          

