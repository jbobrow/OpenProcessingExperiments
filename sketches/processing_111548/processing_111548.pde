

PImage adelImage;
boolean filterApplied = false;
void setup() 
{
 size (600, 600);
 adelImage = requestImage("adel.jpg"); 
 
  
}

void draw ()


{
  
  
  
 if (adelImage.width > 0)
    {
     image(adelImage, 0, 0, width, height);
      
      if (filterApplied == false)
     {
      adelImage.filter(INVERT);
      filterApplied =  true; 
     }
     
    } 
    

    fill(#C5C1F5);
    quad(289,0,600,0,600,600,289,600);
    
    
    stroke(#FFFFFF);
    strokeWeight(2);
    fill(#C5C1F5);
    //wall
    
     for (int i = 0; i < 600; i = i + 50)
   {
     
     line(289, i, 600, i);
      
   }
    
      for (int i = 289; i < 600; i = i + 50)
   {
     
     line(i, 0, i, 600);
  
 
 
  }
  
    stroke(#FFFFFF);
    strokeWeight(.5);
   
    line(289,0,289,600);
    fill(#000000);//black
    quad(299, 0, 397, 0,422, 47, 358, 55);
    quad(359, 54, 422, 47, 438, 110, 399, 122);
    quad(438, 110, 399, 122, 404, 194, 439, 158);
    triangle(358, 54, 291, 23, 300, 0);
    triangle(403 , 194, 439, 209, 439, 159);
    triangle(403,194,431,243,439,209);
    quad(399,216,410,206,431,243,390,258);
    triangle(431,243,390,258,408,288);
    quad(390,258,408,288,368,323,355,303);
    quad(289,0,289,24,314,21,318,0);
    
     fill(#EDCC8B);//skin
     triangle(289 , 21, 289, 143, 310, 24);
     quad(310 , 24, 358, 56, 351, 126, 289, 143);
     triangle(351, 126, 399, 122,367,136);
     quad(403,194,289,214,322,242,390,258);
     quad(289,161,320,152,361,145,344,163);
     triangle(361,145,392,173,384,155);
     quad(392,173,403,194,370,189,353,171);
     quad(289,161,289,214,306,211,302,178);
     quad(289,214,295,220,296,243,289,250);
     quad(322,242,316,255,289,267,343,275);
     quad(313,306,331,283,343,275,355,303);
     quad(289,312,313,306,322,334,305,342);
     triangle(289,312,305,342,289,339);
     triangle(313,306,355,303,322,334);
 
      
     
     fill(#E8BA5E);//darkerskin
     triangle(410,206,403,194,399,216);
     triangle(358, 56, 351, 126, 399, 122);
     quad(399, 122,367,136,384,155,403,194);
     quad(289, 143, 351, 126,367 ,136 ,289,161);
     quad(322,242,390,258,355,303,344,275);
     quad(361,145,344,163,369,172,392,173);
     quad(289,161,344,163,323,181,302,178);
     quad(358,177,370,189,403,194,344,205);
     triangle(356,178,320,182,344,205);
     quad(302,178,320,182,344,205,306,211);
     triangle(295,220,296,243,322,242);
     quad(289,250,296,243,322,242,316,255);
     triangle(289,250,289,267,316,255);
     quad(289,267,343,275,322,281,289,282);
     
     quad(289,339,289,446,316,495,305,342);
     quad(305,342,322,334,337,419,316,495);
     quad(337,419,322,334,355,303,358,349);
     quad(355,303,377,339,367,343,358,349);
     
     //shirt
     fill(#1200ED);//dark blue
     quad(360,600,317,498,360,368,383,345);
     quad(378,342,446,443,461,600,360,600);
     quad(393,365,410,342,452,348,475,434);
     triangle(393,365,446,443,475,434);
     quad(452,348,490,352,529,402,493,407);
     quad(490,352,539,380,565,423,529,403);
     quad(469,497,475,434,493,407,565,423);
     triangle(543,441,565,423,600,482);
     quad(507,468,600,482,600,512,485,531);
     triangle(473,564,477,600,461,600);
     quad(473,564,485,531,509,600,477,600);

     fill(#4132F7);//light blue
     quad(368,323,384,309,410,343,393,365);
     quad(387,337,348,482,316,504,358,348);
     triangle(446,443,461,600,475,434);
     triangle(452,348,493,407,475,434);
     triangle(493,407,529,403,565,423);
     triangle(543,441,600,482,507,468);
     triangle(507,468,461,600,469,497);
     quad(485,531,600,512,600,600,509,600);
     
     
     //bottom hair
     fill(#000000);
     triangle(360,600,289,600,289,413);
     quad(289,413,298,436,303,404,289,381);
     quad(289,381,303,404,326,439,289,366);   
    
    //eyebrow
    fill(#000000);
    quad(320, 152, 320, 149, 353, 138, 361, 145);
    triangle(353,138,367,136,361,145);
    triangle(367,136,361,145,384,155);
    
        
      //eye
    noStroke();
    fill(#000000);
    ellipse(347,172,48,13);
    fill(#FFFFFF);
    triangle(319,184,334,171,339,184);
    triangle(363,176,344,185.5,346,169);
    fill(#744F05);
    ellipse(343,176,18,18);
    fill(#000000);
    ellipse(343,176,8,8);
    fill(#FFFFFF);
    ellipse(342,174,2,2);
    
    
    //lips
    fill(#E30B77);
    quad(289,282,322,281,315,291,289,295);
    triangle(322,281,343,275,315,291);
    fill(#F21D88);
    quad(289,295,315,291,313,306,289,312);
    triangle(331,283,313,306,315,292);
    
    float x1 = 195;
float y1 = 10;
float prevX1 = x1;
float prevY1 = y1;
strokeWeight (3);
stroke(#B9B8C6);
while (y1 < 300)
{
  y1+= 5;
  x1+= random(-5, 5);
  line(prevX1, prevY1, x1, y1);
  prevX1 = x1;
  prevY1 = y1;
  noise(200, 200);
   
}

    float x2 = 137;
float y2 = 124;
float prevX2 = x2;
float prevY2 = y2;
strokeWeight (3);
stroke(#B9B8C6);
while (y2 < 500)
{
  y2+= 5;
  x2+= random(-8, 8);
  line(prevX2, prevY2, x2, y2);
  prevX2 = x2;
  prevY2 = y2;
  noise(200, 200);
   
}

    float x3 = 255;
float y3 = 448;
float prevX3 = x3;
float prevY3 = y3;
strokeWeight (3);
stroke(#B9B8C6);
while (y3 < 550)
{
  y3+= 5;
  x3+= random(-4, 4);
  line(prevX3, prevY3, x3, y3);
  prevX3 = x3;
  prevY3 = y3;
  noise(200, 200);
   
}

    float x4 = 251;
float y4 = 9;
float prevX4 = x4;
float prevY4 = y4;
strokeWeight (3);
stroke(#B9B8C6);
while (y4 < 253)
{
  y4+= 5;
  x4+= random(-2, 2);
  line(prevX4, prevY4, x4, y4);
  prevX4 = x4;
  prevY4 = y4;
  noise(200, 200);
   
}

    float x5 = 217;
float y5 = 345;
float prevX5 = x5;
float prevY5 = y5;
strokeWeight (3);
stroke(#B9B8C6);
while (y5 < 586)
{
  y5+= 5;
  x5+= random(-3.5, 3.5);
  line(prevX5, prevY5, x5, y5);
  prevX5 = x5;
  prevY5 = y5;
  noise(200, 200);
   
}

    float x6 = 45;
float y6 = 390;
float prevX6 = x6;
float prevY6 = y6;
strokeWeight (3);
stroke(#B9B8C6);
while (y6 < 590)
{
  y6+= 5;
  x6+= random(-2, 2);
  line(prevX6, prevY6, x6, y6);
  prevX6 = x6;
  prevY6 = y6;
  noise(200, 200);
   
}






    
    
}


