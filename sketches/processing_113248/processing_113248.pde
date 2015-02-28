
float counter= 0;
float angle = 0.0;
float offset = 10;
float hue = 0;
PImage vintage;

void setup()
{
size(300,300);
smooth();
colorMode(HSB, 360,100,100);
vintage = loadImage("vintage.jpg");
}

void draw()
{
background(#D6EA00);
counter = counter + 0.012;
println(counter);
 
  if (counter > 0.001)
  {
    angle += 0.1;
    pushMatrix();
    translate(20,100);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
    
    pushMatrix();
    translate(200,30);
    rotate(angle);
    noStroke();
    fill(#0B8900,200);
    ellipse(5,10,130,130);
    fill(#EF00FC);
    ellipse(5,9,120,120);
    fill(#000EFF);
    ellipse(5,10,110,110);
    fill(#FC8B00);
    ellipse(5,9,100,100);
    fill(#00F7F1);
    ellipse(5,10,90,90);
    fill(#A400F7);
    ellipse(5,9,80,80);
    fill(#EF00FC);
    ellipse(5,10,70,70);
    fill(#0B8900);
    ellipse(5,9,60,60);
    fill(#FF0095); // pink
    ellipse(5,10,50,50);
    fill(#000EFF);
    ellipse(5,9,40,40);
    fill(#A400F7);
    ellipse(5,10,30,30);
    fill(#FC8B00);
    ellipse(5,9,20,20);
    fill(#000EFF);
    ellipse(5,9,10,10);
    fill(#00F7F1);
    ellipse(5,10,5,5);
    popMatrix();
    
    
    pushMatrix();
    translate(300,100);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,160,160);
    fill(#00F7F1); //cyan
    ellipse(2,2,150,150);
    fill(#A400F7); //light purple
    ellipse(2,2,140,140);
    fill(#FF0000);// red
    ellipse(2,2,130,130);
    fill(#FC8B00); //orange
    ellipse(2,2,120,120);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,110,110);
    fill(#00FF2C); //green
    ellipse(2,2,100,100);
    fill(#0B8900); // dark green
    ellipse(2,2,90,90);
    fill(#BC0000);
    ellipse(2,2,80,80);
    fill(#000EFF); // blue
    ellipse(2,2,70,70);
    popMatrix();
    
    
    pushMatrix();
    translate(120,250);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,160,160);
    fill(#00F7F1); //cyan
    ellipse(2,2,150,150);
    fill(#A400F7); //light purple
    ellipse(2,2,140,140);
    fill(#FF0000);// red
    ellipse(2,2,130,130);
    fill(#FC8B00); //orange
    ellipse(2,2,120,120);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,110,110);
    fill(#00FF2C); //green
    ellipse(2,2,100,100);
    fill(#0B8900); // dark green
    ellipse(2,2,90,90);
    fill(#BC0000);
    ellipse(2,2,80,80);
    fill(#000EFF); // blue
    ellipse(2,2,70,70);
    popMatrix();
    
    pushMatrix();
    translate(90,90);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,160,160);
    fill(#00F7F1); //cyan
    ellipse(2,2,150,150);
    fill(#A400F7); //light purple
    ellipse(2,2,140,140);
    fill(#FF0000);// red
    ellipse(2,2,130,130);
    fill(#FC8B00); //orange
    ellipse(2,2,120,120);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,110,110);
    fill(#00FF2C); //green
    ellipse(2,2,100,100);
    fill(#0B8900); // dark green
    ellipse(2,2,90,90);
    fill(#BC0000);
    ellipse(2,2,80,80);
    fill(#000EFF); // blue
    ellipse(2,2,70,70);
    popMatrix();
    
    pushMatrix();
    translate(0,0);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
    
    pushMatrix();
    translate(200,100);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
    
    pushMatrix();
    translate(250,200);
    rotate(angle);
    noStroke();
    fill(#0B8900,200);
    ellipse(5,10,130,130);
    fill(#EF00FC);
    ellipse(5,9,120,120);
    fill(#000EFF);
    ellipse(5,10,110,110);
    fill(#FC8B00);
    ellipse(5,9,100,100);
    fill(#00F7F1);
    ellipse(5,10,90,90);
    fill(#A400F7);
    ellipse(5,9,80,80);
    fill(#EF00FC);
    ellipse(5,10,70,70);
    fill(#0B8900);
    ellipse(5,9,60,60);
    fill(#FF0095); // pink
    ellipse(5,10,50,50);
    fill(#000EFF);
    ellipse(5,9,40,40);
    fill(#A400F7);
    ellipse(5,10,30,30);
    fill(#FC8B00);
    ellipse(5,9,20,20);
    fill(#000EFF);
    ellipse(5,9,10,10);
    fill(#00F7F1);
    ellipse(5,10,5,5);
    popMatrix();
    
    pushMatrix();
    translate(250,250);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
    
    pushMatrix();
    translate(0,200);
    rotate(angle);
    noStroke();
    fill(#0B8900,200);
    ellipse(5,10,130,130);
    fill(#EF00FC);
    ellipse(5,9,120,120);
    fill(#000EFF);
    ellipse(5,10,110,110);
    fill(#FC8B00);
    ellipse(5,9,100,100);
    fill(#00F7F1);
    ellipse(5,10,90,90);
    fill(#A400F7);
    ellipse(5,9,80,80);
    fill(#EF00FC);
    ellipse(5,10,70,70);
    fill(#0B8900);
    ellipse(5,9,60,60);
    fill(#FF0095); // pink
    ellipse(5,10,50,50);
    fill(#000EFF);
    ellipse(5,9,40,40);
    fill(#A400F7);
    ellipse(5,10,30,30);
    fill(#FC8B00);
    ellipse(5,9,20,20);
    fill(#000EFF);
    ellipse(5,9,10,10);
    fill(#00F7F1);
    ellipse(5,10,5,5);
    popMatrix();
    
    pushMatrix();
    translate(0,100);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
    pushMatrix();
    translate(20,300);
    rotate(angle);
    noStroke();
    fill(#0B8900,200);
    ellipse(5,10,130,130);
    fill(#EF00FC);
    ellipse(5,9,120,120);
    fill(#000EFF);
    ellipse(5,10,110,110);
    fill(#FC8B00);
    ellipse(5,9,100,100);
    fill(#00F7F1);
    ellipse(5,10,90,90);
    fill(#A400F7);
    ellipse(5,9,80,80);
    fill(#EF00FC);
    ellipse(5,10,70,70);
    fill(#0B8900);
    ellipse(5,9,60,60);
    fill(#FF0095); // pink
    ellipse(5,10,50,50);
    fill(#000EFF);
    ellipse(5,9,40,40);
    fill(#A400F7);
    ellipse(5,10,30,30);
    fill(#FC8B00);
    ellipse(5,9,20,20);
    fill(#000EFF);
    ellipse(5,9,10,10);
    fill(#00F7F1);
    ellipse(5,10,5,5);
    popMatrix();
    
    pushMatrix();
    translate(250,280);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
    
    pushMatrix();
    translate(180,150);
    rotate(angle);
    noStroke();
    fill(#0B8900,200);
    ellipse(5,10,150,150);
    fill(#EF00FC);
    ellipse(5,9,140,140);
    fill(#000EFF);
    ellipse(5,10,130,130);
    fill(#FC8B00);
    ellipse(5,9,120,120);
    fill(#00F7F1);
    ellipse(5,10,110,110);
    fill(#A400F7);
    ellipse(5,9,100,100);
    fill(#EF00FC);
    ellipse(5,10,90,90);
    fill(#0B8900);
    ellipse(5,9,80,80);
    fill(#FF0095); // pink
    ellipse(5,10,70,70);
    fill(#000EFF);
    ellipse(5,9,60,60);
    fill(#A400F7);
    ellipse(5,10,50,50);
    fill(#FC8B00);
    ellipse(5,9,40,40);
    fill(#000EFF);
    ellipse(5,9,30,30);
    fill(#00F7F1);
    ellipse(5,10,20,20);
    popMatrix();
    
    pushMatrix();
    translate(150,80);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
    pushMatrix();
    translate(90,15);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
     pushMatrix();
    translate(80,160);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
     pushMatrix();
    translate(100,100);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
    
    pushMatrix();
    translate(300,100);
    rotate(angle);
    noStroke();
    fill(#FF0095,200);
    ellipse(2,8,50,50);
    fill(#F200FF);
    ellipse(2,7,40,40);
    fill(#000EFF);
    ellipse(2,8,30,30);
    fill(#00F7F1);
    ellipse(2,7,20,20);
    fill(#FFF300);
    ellipse(2,8,10,10);
    popMatrix();
    
    pushMatrix();
    translate(170,300);
    rotate(angle);
    noStroke();
    fill(#BC0000,200); // dark red
    ellipse(2,2,100,100);
    fill(#00F7F1); //cyan
    ellipse(2,2,90,90);
    fill(#A400F7); //light purple
    ellipse(2,2,80,80);
    fill(#FF0000);// red
    ellipse(2,2,70,70);
    fill(#FC8B00); //orange
    ellipse(2,2,60,60);
    fill(#EF00FC); //bright purple?
    ellipse(2,2,50,50);
    fill(#00FF2C); //green
    ellipse(2,2,40,40);
    fill(#0B8900); // dark green
    ellipse(2,2,30,30);
    fill(#BC0000);
    ellipse(2,2,20,20);
    fill(#000EFF); // blue
    ellipse(2,2,10,10);
    popMatrix();
  }
  if (counter > 5)
  {
    background(0);
    
      float power = 3;
      float d = 4;
      noStroke();
      for (int y = 0; y < height; y ++)
        {
          for (int x = 0; x < width; x ++)
            { 
               float total = 0.0;
               for (float i = d; i >= 1; i = i/2.0)
                 {
                    total += noise (x/d, y/d) * d;
                  }
               float turbulence = 128.0 * total / d;
               float base = (x * 0.2) + (y * 0.12);
               float offset = base + (power * turbulence / 256.0);
               float gray = abs(sin(offset)) * 256.0;
               stroke(gray);
               point(random(300),random(300));
            }
         }
       }
   if (counter > 5.1) // because the program slows down when going through static
    {
      if(vintage.width > 0)
      {
      image(vintage,0,0,width,height);
       for (int j = 0; j < 300; j += 6)
       {
         hue += offset;
         if ( hue ++)
         {
           offset = -offset;
         }
        
         stroke (hue,hue,hue);
         strokeWeight(2);
         line(0,j,300,j);
         noStroke();
         fill(hue,100,100,8);
         rect(20,20, 100,53);
         rect(250,150,40,120);
         rect(110,100, 50,50);
       }
      }
    }
}


