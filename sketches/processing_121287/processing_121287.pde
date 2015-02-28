
String myString = "FuCk DiS";
float myHeight = -508;
float myWidth = 150;
PFont f; 


 
  
void setup() {
  size(607,590);
  f = createFont("PortagoITCTT",172,true); 

}

void draw() {
    background(44,44,44);
  textFont(f,79);                 
  fill(209,46,255);                        
  text("fuck dis",15,50);  
    for (int n = 10; n < 20; ++n)
    {
        fill(n*255/12,255,55,350);
        pushMatrix();
        rotate((frameCount * 0.0005) + (n*PI/6));
        translate((myWidth/2) * sin(frameCount*0.05), 500);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
       for (int n = 0; n < 12; ++n)
    {
        fill(n*255/1,235,55,150);
        pushMatrix();
        rotate((frameCount * 0.00005) + (n*PI/6));
        translate((myWidth/-200) * sin(frameCount*0.0005), -400);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
     for (int n = 0; n < 100; ++n)
    {
        fill(n*255/14,240,255,150);
        pushMatrix();
        rotate((frameCount * 0.005) + (n*PI/6));
        translate((myWidth/2) * sin(frameCount*0.05), -200);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
       for (int n = 0; n < 15; ++n)
    {
        fill(n*255/10,225,255,150);
        pushMatrix();
        rotate((frameCount *5) + (n*PI/6));
        translate((myWidth/250) * sin(frameCount*0.005), -100);
        text(myString, -(myWidth/80), (myHeight/4));
        popMatrix();
    }
       for (int n = 0; n < 12; ++n)
    {
        fill(n*255/12,255,255,150);
        pushMatrix();
        rotate((frameCount * -500) + (n*PI/6));
        translate((myWidth/-200) * sin(frameCount*0.005), 700);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
       for (int n = 0; n < 12; ++n)
    {
        fill(n*255/22,225,255,150);
        pushMatrix();
        rotate((frameCount * 0.005) + (n*PI/6));
        translate((myWidth/-3000) * sin(frameCount*0.0005), 650);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
       
    }
    for (int n = 10; n < 20; ++n)
    {
        fill(n*255/12,255,255,50);
        pushMatrix();
        rotate((frameCount * 0.005) + (n*PI/6));
        translate((myWidth/2) * sin(frameCount*0.05), 500);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
        for (int n = 0; n < 14; ++n)
    {
        fill(n*0/22,225,150);
        pushMatrix();
        rotate((frameCount * 0.0005) + (n*PI/6));
        translate((myWidth/-30000) * sin(frameCount*0.0005), 725);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
    for (int n = 10; n < 20; ++n)
    {
        fill(n*255/12,255,255,150);
        pushMatrix();      
        rotate((frameCount * 0.005) + (n*PI/6));
        translate((myWidth/2) * sin(frameCount*0.05), 500);
        text(myString, -(myWidth/8), (myHeight/4));
        popMatrix();
    }
    
}
   





