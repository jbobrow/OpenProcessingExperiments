
PImage img;
PImage img2;
void setup()
{
 size(500,500);
 img = loadImage("Franz_Marc_005.jpg");
 img2 = loadImage("_AK_G_480_280_93_alkopopsUweGroetzner32207998_Fotolia_32207998_S.png");
}

void draw()
{
 background (0);
 imageMode(CENTER);
 tint(255,153,204);
 image(img, 0,0);
 noTint();
 
 imageMode(CENTER);
 image(img2, mouseX, mouseY, 50,50);
}
                            
//mit filter() kann unscharf, Farbe verändert, ... werden


