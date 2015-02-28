
float blue = 255;
float distance = 0;
float xcirkel = 100;
float ycirkel = 100;
float raggio = 40;
float raggioc = 40;
float ggg = 0;
float hhh = 255;
float cerchiox = 0;
float cerchioy =0;
float poing = 0;


void setup()
{
 size(400,400) ;
 background(255,255,255);
}

void draw()
{
   stroke(0,0,0);
   
   
   distance = sqrt( (( xcirkel-mouseX)*(xcirkel-mouseX))+((ycirkel - mouseY)*(ycirkel - mouseY)) );
   
   
   
   if(distance < raggioc)
   {
     xcirkel = random(400);
     ycirkel = random(400);
     background(255,255,255);
      if(mousePressed)
     {
    raggioc = raggioc +5;
    println("fanget");
    poing = poing + 1;
   
    }
     
   }
   
   
   
   ellipse(xcirkel,ycirkel,80,80);
   stroke(ggg,ggg,ggg);
   fill(0,255,0);
   rect(20,20,poing,20);
}
